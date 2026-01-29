let provider;
let signer;
let contract;
const CONTRACT_ADDRESS = "0x6b0AB24867BE7B30DAeAf6f75960E85e7428B56e";

const ABI = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			}
		],
		"name": "addCandidate",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			}
		],
		"name": "CandidateAdded",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [],
		"name": "ElectionReset",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "resetElection",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_candidateId",
				"type": "uint256"
			}
		],
		"name": "vote",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "voter",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "candidateId",
				"type": "uint256"
			}
		],
		"name": "VoteRecorded",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "candidates",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "voteCount",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getCandidatesCount",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "hasVoted",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "voters",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];
// ============================
// CONNECT WALLET
// ============================
async function connectWallet() {
	if (!window.ethereum) {
	alert("Please install MetaMask");
	return;
	}
	await ensureGanacheNetwork();
	provider = new ethers.BrowserProvider(window.ethereum, 
   "any");
	await provider.send("eth_requestAccounts", []);
	signer = await provider.getSigner();
	contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, 
   signer);
	const address = await signer.getAddress();
	document.getElementById("account").innerText =
	"Connected account: " + address;
   }
   /* async function connectWallet() {
	if (!window.ethereum) {
	alert("Please install MetaMask");
	return;
	}
	provider = new ethers.BrowserProvider(window.ethereum);
	await provider.send("eth_requestAccounts", []);
	signer = await provider.getSigner();
	contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, 
   signer);
	const address = await signer.getAddress();
	document.getElementById("account").innerText =
	"Connected account: " + address;
   } */
   // ============================
   // ADD CANDIDATE (OWNER)
   // ============================
   async function addCandidate() {
	const name = 
   document.getElementById("candidateName").value;
	if (!name) {
	alert("Enter candidate name");
	return;
	}
	try {
	const tx = await contract.addCandidate(name);
	await tx.wait();
	alert("Candidate added!");
	} catch (err) {
	alert("Error: " + err.reason);
	}
   }
   // ============================
   // LOAD CANDIDATES
   // ============================
   
   async function loadCandidates() {
	const list = document.getElementById("candidatesList");
	list.innerHTML = "";
  
	const total = Number(await contract.getCandidatesCount());
  
	for (let i = 1; i <= total; i++) {
	  const c = await contract.candidates(i);
  
	  const li = document.createElement("li");
	  li.innerText = `ID: ${c.id} | Name: ${c.name} | Votes: ${c.voteCount}`;
	  list.appendChild(li);
	}
  } 

   // ============================
   // VOTE
   // ============================
   async function vote() {
	const id = document.getElementById("voteId").value;
	try {
	const tx = await contract.vote(id);
	await tx.wait();
	alert("Vote successful!");
	} catch (err) {
	alert("Vote failed: " + err.reason);
	}
   }
   async function ensureGanacheNetwork() {
	const ganacheChainId = "0x539"; // 1337
	const currentChainId = await ethereum.request({
	method: "eth_chainId"
	});
	if (currentChainId !== ganacheChainId) {
	await ethereum.request({
	method: "wallet_switchEthereumChain",
	params: [{ chainId: ganacheChainId }]
	});
	}
   }
   