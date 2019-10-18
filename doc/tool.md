# Command Tool 调用合约所需参数

- sample.abi

```
[
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
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAllAddr",
		"outputs": [
			{
				"internalType": "address[100]",
				"name": "",
				"type": "address[100]"
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
	}
]
```

- sample_execute.json

```
{
  "contract" : "关卡一所得",		
  "function" : "addCompetitorInfo",															
  "params":[																									
    "姓名", "企业邮箱"
  ]
}
```

- sample_read.json

```
{
  "contract" : "关卡一所得",	
  "function" : "getCompetitorResult",															
  "params":[																									
    "企业邮箱"
  ]
}
```

执行成功返回"信息登记成功，节日快乐!"以及第三题提示。