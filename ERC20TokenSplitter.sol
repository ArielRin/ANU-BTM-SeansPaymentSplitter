// SPDX-License-Identifier: MIT

// Use 0.8.18 to deploy
// add payees in this format: ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"]
// add an additional payee to contract
// on clicking distribute button the payments are sent to payees.
// add rewards to the contract's address

pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SeansSafuRewardsPaymentSplitter {
    address[] public payees;
    address public owner;
    address public tokenAddress; // New variable to store the ERC-20 token address

    constructor(address[] memory _payees, address _tokenAddress) {
        require(_payees.length > 0, "No payees provided");
        require(_tokenAddress != address(0), "Invalid token address");

        owner = msg.sender;
        payees = _payees;
        tokenAddress = _tokenAddress; // Initialize the ERC-20 token address
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    receive() external payable {
        distribute();
    }

    function distribute() public {
        require(tokenAddress != address(0), "Token address not set"); // Check if token address is set

        uint256 balance = IERC20(tokenAddress).balanceOf(address(this));
        require(balance > 0, "No tokens to distribute");

        uint256 amountPerPayee = balance / payees.length;

        for (uint256 i = 0; i < payees.length; i++) {
            IERC20(tokenAddress).transfer(payees[i], amountPerPayee);
        }
    }

    function updatePayees(address[] memory _payees) public onlyOwner {
        require(_payees.length > 0, "No payees provided");
        payees = _payees;
    }

    function addPayee(address newPayee) public onlyOwner {
        require(newPayee != address(0), "Invalid payee address");
        payees.push(newPayee);
    }

    // Function to withdraw ERC20 tokens sent to the contract
    function withdrawTokens() public onlyOwner {
        require(tokenAddress != address(0), "Token address not set");

        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(address(this));

        require(balance > 0, "No tokens to withdraw");

        token.transfer(owner, balance);
    }

    // Function to change the ERC-20 token address
    function changeTokenAddress(address newTokenAddress) public onlyOwner {
        require(newTokenAddress != address(0), "Invalid token address");
        tokenAddress = newTokenAddress;
    }

    // Function to transfer ownership of the contract
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid new owner address");
        owner = newOwner;
    }

    // Function to recover lost tokens or native currency
    function recoverLostFunds(address tokenToRecover, uint256 amount) public onlyOwner {
        require(tokenToRecover != address(0), "Invalid token address");
        require(amount > 0, "Invalid amount");

        if (tokenToRecover == address(0)) {
            // Recover native currency (ETH)
            payable(owner).transfer(amount);
        } else {
            // Recover ERC-20 tokens
            IERC20(tokenToRecover).transfer(owner, amount);
        }
    }

    // Function to get the balance of the specified ERC-20 token
    function getTokenBalance() public view returns (uint256) {
        require(tokenAddress != address(0), "Token address not set");
        return IERC20(tokenAddress).balanceOf(address(this));
    }
}
