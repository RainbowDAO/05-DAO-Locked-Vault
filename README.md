# Submission for the ETHDenver 2022 Virtual BUIDLathon

## 1.Project name

DAO Locked Vault System

## 2.Elevator pitch

Through our DAO lock-up vault system, a certain amount of ERC20 tokens can be locked according to the specified rules and released according to the corresponding rules.

## 3.Team Name

RainbowCity Foundation

## 4.Submission links

In this ETHDenver 2022 Virtual BUIDLathon event, RainbowCity Foundation submitted a total of 9 projects, which is the  address directory of the 9 projects. We are continuing to refine the details of each project.

Submission address directory:
http://www.rainbowdao.io/ETHDanver2022

Project demo website:
https://vaultethdanver.rainbowdao.io/

GitHub repository :
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault

Solidity-Version-contract (GitHub):
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/tree/main/Solidity-contract

Frontend code (GitHub):
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/tree/main/Front-end

Picture (GitHub):
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/tree/main/PIC

## 5.Recorded video demo

https://youtu.be/zSGWTrzNWfE

## 6.Testnet Deployment Information

Network Name: Rinkeby Test Network
RPC URL: https://rinkeby.infura.io/v3/

Contract deployment address

vault:
0xd0eA8A623dE4F2565F93d30227Ceb0572068d38C

RBD:
0x798Bb825666bD32A106f6f6bF1995059d4749858

Frontend docs:
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/blob/main/Front-end/README.md

Contract  docs:
https://github.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/blob/main/Solidity-contract/README.md

## 7.Project social media:

RainbowDAO website ：http://www.rainbowdao.io

Rainbowcity website ：https://www.rainbowcity.io

Twitter:    https://twitter.com/RainbowDAOio

Discord     https://discord.gg/vbnvFEeYRr

Telegram: https://t.me/RainbowDAO

Medium:   https://medium.com/rainbowcity

Github:    https://github.com/RainbowDAO

Email： Rainbowcitydao@gmail.com

#  Project Story

## 1.Inspiration

The DAO lock-up vault system is also a very practical Web3 tool developed by us, especially suitable for various types of DAO governance. Each DAO organization will issue its own governance tokens, and will also manage its own governance tokens. Locking is a very common application scenario, but there is no corresponding tool in the market. What we solve is the basic need of ERC20 token lock-up.

## 2.What it does

Through our DAO lock-up vault system, a certain amount of ERC20 tokens can be locked according to the specified rules and released according to the corresponding rules.

It is mainly suitable for two important application scenarios. The first point is to issue private tokens to early investors of a project. Tokens issued by early investors need to follow certain rules for lock-up, and the corresponding tokens can only be released after the lock-up time expires.

The second point is the token incentives that can be used for community members or core employees of the DAO organization. In order to reward core community members and core employees, some governance tokens will be issued for incentives, but the issued governance tokens are not immediately available for circulation, but need to follow certain lock-up rules. In this way, the interests of core members can be aligned with the interests of the DAO organization.

## 3.How we built it

![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/logic-diagram.png)

Operation steps of the DAO lock-up vault system function:

(1) Create a lock-up vault and initialize the vault

First, you need to initialize the name, profile, logo, and basic information of the lock-up vault. Then set the time of the complete closure period. The complete closure period refers to the period in which the governance tokens are completely locked without any release after they are locked.

Set the starting release time, the monthly release proportion after the starting release, and the final time when the vault is fully unlocked.

For example, the complete closure period is 24 months, which is equivalent to that no one can withdraw money from the lock vault within 24 months; If the release rate is 2% per month during the release period, it will take 50 months for 100% to be released. The final full unlocking period is 24 + 50 = 74 months.

(2) deposit in the lock vault
To make a deposit to a locked bank, you need to specify the recipient's address. There are two situations:

① Drawn by the depositor;

② Authorized by the depositor to receive, authorized to receive can authorize multiple addresses to receive, and each address can receive a corresponding share of tokens according to the proportion;

(3) Whether the depositor can terminate the authorization to collect, there can be two different application scenarios:

① In the first case, when the tokens are sold privately, the project party can deposit the corresponding tokens into the lock vault and authorize the private buyer to receive them at the agreed time. At this time, the project party does not need to have the authority to terminate the authorization. When the project party deposits the token into the lock vault, it will no longer have the management authority of this fund.

② The second case is employee incentives. The project party and employees agree on a certain number of token incentives, and employees can receive corresponding rewards after completing corresponding tasks. During this process, if the motivated employee resigns or fails to complete the corresponding assessment, the depositor can cancel the corresponding reward. At this time, the depositor needs to terminate the authorization to receive and cancel the corresponding reward.

If there are multiple recipient addresses authorized, the depositor can choose to terminate one or more of them, or terminate all of them, and the corresponding withdrawal authority will be changed back to the depositor itself.

(4) Lock-up bank withdrawal

The depositor or the authorized receiving address will receive the corresponding funds from the lock-up vault according to the lock-up agreement.

#  Project UI

##  1-Locked-Vault-System-1

![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/1-Locked-Vault-System-1.png)

##  2-Locked-Vault-System-2

![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/2-Locked-Vault-System-2.png)


##  3-Locked-Vault-System-3


![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/3-Locked-Vault-System-3.png)


##  4-Deposit



![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/4-Deposit.png)


##  5-Home


![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/5-Home.png)


##  6-Info


![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/6-Info.png)


##  7-Info-Withdraw


![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/7-Info-Withdraw.png)


##  8-Manager


![image](https://raw.githubusercontent.com/RainbowDAO/06-ETHDenver2022-DAO-Locked-Vault/main/PIC/8-Manager.png)
