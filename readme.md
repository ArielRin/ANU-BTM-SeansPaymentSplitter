# Seans ANU BTM Payment Splitter

## Overview

This README provides an explanation of the SeansRewardsPaymentSplitter contract, how it works, and its advantages in the context of Web3 decentralized applications (DApps).

## SeansRewardsPaymentSplitter Contract

The SeansRewardsPaymentSplitter is a smart contract designed to manage the fair distribution of funds (Ether) among a predefined list of payees. The contract can be used for various purposes, such as salary payments, revenue sharing, or any scenario where funds need to be split among multiple recipients.

### Key Features

1. **Payees Management:** The contract allows the contract owner to define a list of payees during deployment. Payees are Ethereum addresses that will receive a portion of the funds when the `distribute` function is called.

2. **Dynamic Payments:** Upon invoking the `distribute` function, the contract evenly distributes the Ether it holds among the specified payees. The amount per payee is calculated based on the total Ether in the contract and the number of payees.

3. **Payee Updates:** The contract owner can update the list of payees using the `updatePayees` function, adding new payees or modifying the existing list.

4. **Flexible Withdrawals:** The contract owner can withdraw ERC20 tokens using the `withdrawTokens` function, Ether using the `withdrawEther` function, and transfer ownership of the contract using the `transferOwnership` function.

5. **Fallback Function:** The contract includes a fallback function (`receive`) that automatically triggers the `distribute` function when Ether is sent to the contract.

6. **Token Balance Display:** The contract introduces a new function `getTokenBalance` to check the balance of a specific ERC20 token held by the contract.

## Advantages in Web3 DApps

### Trustless Transactions

The SeansRewardsPaymentSplitter operates on the Ethereum blockchain, providing a trustless environment. Smart contracts execute predefined logic without the need for intermediaries, enhancing transparency and reducing the risk of fraud.

### Automation and Efficiency

In Web3 DApps, automation is crucial. The payment splitter contract automates the distribution of funds, ensuring accurate and efficient payments without manual intervention. This is especially beneficial for projects with recurring payments or complex revenue-sharing models.

### Decentralized Governance

With the ability to update payees and transfer ownership, the contract supports decentralized governance. Changes can be made by the contract owner without the need for a central authority, promoting community involvement and ownership.

### Interoperability

The contract supports the withdrawal of both ERC20 tokens and Ether, making it versatile and interoperable with various tokens and decentralized finance (DeFi) protocols. This flexibility is essential in the rapidly evolving Web3 ecosystem.

### Transparency and Audibility

All transactions and contract interactions are recorded on the Ethereum blockchain, providing a transparent and auditable payment history. This transparency enhances accountability and allows stakeholders to verify fund allocations.

## Getting Started

To use the SeansRewardsPaymentSplitter contract in your Web3 DApp:

1. Deploy the contract, providing the initial list of payees.
2. Call the `distribute` function to distribute funds among the payees.
3. Use additional functions to update payees, withdraw tokens or Ether, and transfer ownership if needed.

### list of payees

format the payee string as follows

Function "updatePayees"
example

["0x1234"]


["0x1234", "4321"]


["0x1234", "0x4321", "0x4213"]


Ensure that users interacting with the contract are familiar with decentralized applications and have access to Ethereum wallets compatible with Web3.

## Disclaimer

This smart contract is provided as-is, and users should exercise caution when deploying or interacting with it on the Ethereum blockchain. Ensure that the contract addresses your specific use case and security requirements. Always conduct thorough testing and audits before deploying in a production environment.

Feel free to modify the contract code to suit your needs or consult with a smart contract developer for customization.

---

## Tests Performed

Holderlist as in repo sent amount and successfully distributed equally


https://scan.maxxchain.org/tx/0x40f2c55cffc5113e84b8c54e731d5e5cb0c537311cc843916db7591c004e765c


alpha tests performed

Fail 1 https://scan.maxxchain.org/tx/0x48fafbf37580f4ed2b5b947f3c054737d9bf216632deb5ef7fe68c50128bf2d6 (didnt format string correctly)

Success 1 https://scan.maxxchain.org/tx/0x813df19702830d58656894c82c148dc154bc34ccc44f2cd0d47b3c6ef3639f46

Success with contract 2 safu tokens distributed https://scan.maxxchain.org/tx/0x594bc74ba78406b7523198026953e4543c9f6c41b0ee6a9da804adbcc141dc5d

### Contacts live

AnunakiPowerSplitter https://scan.maxxchain.org/address/0x6F56131563f01ED10e74B71939C291f42210196D/contracts#address-tabs

SeansSafuRewardsSplitter https://scan.maxxchain.org/address/0x9E9f8CeC0e08dF5Fc9c301E10f91e6b3a83e4328/contracts#address-tabs




*Note: This README assumes basic knowledge of Ethereum, smart contracts, and decentralized applications (DApps).*
