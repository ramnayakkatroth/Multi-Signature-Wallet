pragma solidity ^0.5.7;

// created a contract for MultiSignatureWallet 
contract MultiSignatureWallet {
// owner of address must be private because that is accessing only in contract Not Derived Contract

address private _owner;

// in solidity smart Contract mapping is defined as a hash table 
// this can have key and corresponding value 


mapping(address => uint256) private _owners;

// this can be defining how many signers to sign the Transaction
// while transfer amount or withdraw amount from wallet to account must be defined variable 
// 2 Signers can Sign The Transaction
uint constant MIN_SIGNATURES = 2;
// this can be defined as transaction index finding and accessing Transactions
uint private _transactionIdx;

// this can be custom properties 
// transaction can be one format to store  and defined
// The structure can be from , to , how much amount , signatureCount , and timestamp, mapping to transactionId
struct Transaction {
address from;
address to;
uint amount;
uint8 signatureCount;
uint256 timestamp;
mapping (address => uint8) signatures;
}
// in solidity smart Contract mapping is defined as a hash table 
// this can have key and corresponding value 
// this uint value can be mapping to Transaction structure
mapping (uint => Transaction) private _transactions;
// unsigned integer can defined it means getting the Pending Transaction while Transfering amount to another member and withdraw amount from wallet
uint[] private _pendingTransactions;


// modifier is used to make sure that the caller of a function is the owner of the contract.

modifier isOwner() {
    // check condition isOwner or not
    require(msg.sender == _owner);
    
    //The symbol _; is used to continue executing the rest of function body
    
    _;
}
// modifier is used to make sure that the caller of a function is the ValidOwner of the contract.

modifier validOwner() {
    // this can be check conditions with require method]
    
    require(msg.sender == _owner || _owners[msg.sender] == 1);
    //The symbol _; is used to continue executing the rest of function body
    _;
}
// Events allow the convenient usage of the EVM logging facilities. 
// Events are inheritable members of contracts. When they are called, 
// they cause the arguments to be stored in the transaction's log. 
 // All non-indexed arguments will be stored in the data part of the log.
 // DepositFunds can be a transfer money
event DepositFunds(address from, uint amount);
// this event can be a TransactionCreated  in log
event TransactionCreated(address from, address to, uint amount, uint transactionId);
// this event can be a TransactionCompleted  in log
event TransactionCompleted(address from, address to, uint amount, uint transactionId);
// this event can be a TransactionSigned  in log
event TransactionSigned(address by, uint transactionId);

// constructor can be a assign owner address 
constructor() public {
    _owner = msg.sender;
}
// this function can be add the signers and  check the validOwner can addSigners or not  
// when add a owner owners can be 1
function addOwner(address owner) isOwner public { 
    _owners[owner] = 1;
}

// this function can be delete  the signers and  check the validOwner can deleteSigners or not 
// when add a owner owners can be 0
function removeOwner(address owner) isOwner public {
    _owners[owner] = 0;
}
// this is a external to every fallback or interface function that does not specify its visibility already
// this can be deposit balance in wallet 
function () external payable {
    emit DepositFunds(msg.sender, msg.value);
}
// withdraw money can be a withdraw from wallet to account only
// we are uses transferTo Function to add money in account
// this function can be having to signing the Transaction
function withdraw(uint amount) public {
    transferTo(msg.sender, amount);
}
// this function can be transfer amoount to another person 
// this can be check valid owner can transfer amount or not 
function transferTo(address to, uint amount) validOwner public {
    // this can be check the amoount the given amount is less than account balance or not 
    require(address(this).balance >= amount);
    // if it`s ok transactionId can be generated 
    uint transactionId = _transactionIdx++;
// the structure of Transaction can be stored in a manner
Transaction memory transaction;
    transaction.from = msg.sender;
    transaction.to = to;
    transaction.amount = amount;
    transaction.signatureCount = 0;
    transaction.timestamp=now;
// adding the Blue print of structure Transaction to Transactions 
// and push into _pendingTransactions because given max signer to sign the transaction then transfered the amount 
    _transactions[transactionId] = transaction;
    _pendingTransactions.push(transactionId);
         // All calls directed at that function, including deeply nested
        // are going to be detected by the JavaScript API via
        // filtering for `TransactionCreated` to be called.
        
    emit TransactionCreated(msg.sender, to, amount, transactionId);
}
// getting the all the _pendingTransactions index
// it will return the all the pendingTransactions
// owner will not allow to sign the Transaction
function getPendingTransactions() validOwner public view returns (uint[] memory) {
    return _pendingTransactions;
}

// this funtion can be valid signers can sign the Transaction with pending transactionId
function signTransaction(uint transactionId) validOwner public {
    
    Transaction storage transaction = _transactions[transactionId];

// Transaction must exist
require(address(0x0) != transaction.from);
// Creator cannot sign the transaction
require(msg.sender != transaction.from);
// Cannot sign a transaction more than once
require(transaction.signatures[msg.sender] != 1);
// this can get signer count can  be increamented
transaction.signatures[msg.sender] = 1;
transaction.signatureCount++;

// All calls directed at that function, including deeply nested
// are going to be detected by the JavaScript API via
// filtering for `TransactionSigned` to be called.
//this function can be recorded
emit TransactionSigned(msg.sender, transactionId);
    // and check the  transaction.signatureCount is greaterthan equal to MIN_SIGNATURES or not 
    // if yes the transaction of amoubt can be transfered to reciever account
    if (transaction.signatureCount >= MIN_SIGNATURES) {
        
        require(address(this).balance >= transaction.amount);
        address(uint168(transaction.to)).transfer(transaction.amount);
        // All calls directed at that function, including deeply nested
        // are going to be detected by the JavaScript API via
        // filtering for `TransactionCompleted` to be called.
        // transaction can be recorded
        emit TransactionCompleted(transaction.from, transaction.to, transaction.amount, transactionId);
        // and delete transaction from pending transaction
        deleteTransaction(transactionId);
    }
}
//all the owner can be deleteTransaction from pendingTransactions also with their transactionId 

function deleteTransaction(uint transactionId) validOwner public {
uint8 replace = 0;
    for(uint i = 0; i < _pendingTransactions.length; i++) {
        if (1 == replace) {
            _pendingTransactions[i-1] = _pendingTransactions[i];
        } 
        else if (transactionId == _pendingTransactions[i]) {
            replace = 1;
        }
}
    delete _pendingTransactions[_pendingTransactions.length - 1];
    _pendingTransactions.length--;
    delete _transactions[transactionId];
}
//this function can be check the wallet balance 
// this will return balance in wei
//10000000000000000000 Wei=10 ether

function walletBalance() view public returns (uint) {
    return address(this).balance;
}
}
