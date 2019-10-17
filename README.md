# 题目二

请依照下文所给提示的顺序进行解题，成功执行合约的同学将有机会获得奖励，依照时间顺序获得奖励。

##### 还记得刚入职众安时的样子吗，我们在众安开启一段新的旅程，从问题中寻找通往成功之门的地址，而你们就是开启成功之门的钥匙，祝各位程序员大大们，节日快乐！

提示一

[start_linux](bin/start_linux)

[start_macOS](bin/start_macOS)

提示二

|        1        |        2        |        3        |        4        |
| :-------------: | :-------------: | :-------------: | :-------------: |
| ![1](pic/1.jpg) | ![2](pic/2.jpg) | ![3](pic/3.jpg) | ![4](pic/4.jpg) |

提示三

合约执行和查询方法，所需参数如下。

sample.abi

```
[
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "string",
				"name": "_mail",
				"type": "string"
			}
		],
		"name": "getCompetitorResult",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "string",
				"name": "_mail",
				"type": "string"
			}
		],
		"name": "getCompetitorInfo",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_num",
				"type": "uint256"
			}
		],
		"name": "getCompetitorMail",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_mail",
				"type": "string"
			}
		],
		"name": "addCompetitorInfo",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAllAddr",
		"outputs": [
			{
				"internalType": "address[30]",
				"name": "",
				"type": "address[30]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]
```

[执行合约](https://github.com/dappledger/AnnChain/blob/master/docs/cmd.md#execute-contract)

sample_execute.json

```
{
  "contract" : "题目所得",		
  "function" : "addCompetitorInfo",															
  "params":[																									
    "姓名", "企业邮箱"
  ]
}
```

[查询合约](https://github.com/dappledger/AnnChain/blob/master/docs/cmd.md#read-contract)

sample_read.json

```
{
  "contract" : "题目所得",	
  "function" : "getCompetitorResult",															
  "params":[																									
    "企业邮箱"
  ]
}
```

执行成功返回"信息登记成功，节日快乐!"