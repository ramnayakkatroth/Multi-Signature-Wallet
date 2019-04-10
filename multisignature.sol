pragma solidity >=0.4.0 <0.6.0;
// contract Creating for MultiSigniture Wallet 

contract MultiSigWallet {
// create a Proposals to send an amount ether to an address 
//may be reject Proposals 

// proposal can has to address and amount and mapping who are signed and finalized of proposals
 // proposal can finalized or not  that can True or false
  struct Proposal {
    address to;
    uint amount;
    mapping(address => bool) signed;
    bool finalized;
  }
//ini
  uint signersRequired;
  //array of signers 
  address[] public signers;
  //proposal arrays
  Proposal[] public proposals;
  // map to check to some one sign or not 
  mapping(address => bool) public canSign;
// 
//initialize the Contract With Signers 
// the signers can submit Proposals
// they can sign Proposals 
// address array is initial signers 

// first deploy the contract  with appropriate arguments like . ["0xca35b7d915458ef540ade6068dfe2f44e8fa733c", "0x14723a09acff6d2a60dcdf7aa4aff308fddc160c"],2 
// this can transfer ethers to 2 signers required 
  constructor(address[] initSigners, uint m) public {
      // condition checking if submit a proposal can have more then 1 signer  condtion checking 
    if(m == 0) {
      signersRequired = initSigners.length;
    } else {
      signersRequired = m;
    }
    //initial 
    signers = initSigners;
    // this can sign which address is can sign  that can be True 
    for(uint i = 0; i < initSigners.length; i++) {
      canSign[initSigners[i]] = true;
    }
  }
// this is fall back function that payable ether 
// send some Ethers from first account to another account 
// EX. 50  and click fallback button (value in ethers or wei) etc 
  function () public payable {

  }
// this will returns the balance of 
  function balance() public view returns(uint) {
      // this can return all the balance msg.sender
    return address(this).balance;
  }

// precondition checking the isSigners is that can False Revert the proposal
  modifier isSigner(address user) {
      // this can check all the signer is signed or not 
    require(canSign[user] == true);
    _;
  }
  
  
  // this can be push proposals to Proposal Structure  Who is signers can address can be get with msg.sender
  // Ex. 500000000000000000,"0xca35b7d915458ef540ade6068dfe2f44e8fa733c" through Submit The proposal 
  //that can pushing in the proposals array
  
  function submitProposal(uint amount, address to)  isSigner(msg.sender) public {
      // this can push required  all the proposals 
    proposals.push(Proposal({
      to: to,
      amount: amount,
      finalized: false
    }));
  }
// Checking the proposalExists or not checking the precondition

  modifier proposalExists(uint index) {
    require(index >= 0);
    require(index < proposals.length);
    _;
  }
  // before sign with index 0 or other indexes this function can execute first proposalExists,isSigner this two modifiers can be Check signer Can sign or not  and that index proposal Exist Or not 
  // if signer not exist signer can sign the proposal  can be True 
  // Sign With indexEx.  0 index
  function sign(uint proposalIndex)  isSigner(msg.sender) proposalExists(proposalIndex) public {
      // if click sign ti proposal is signed 
    proposals[proposalIndex].signed[msg.sender] = true;
  }
// this function is finalize to tell us the count all of them are signed or not  
  function signerRequirementsMet(uint index) proposalExists(index) public view returns(bool) {
    uint signedCount = 0;
    // sign signerRequirementsMet is equal or not  aall signers of array proposals 
    for(uint i = 0; i < signers.length; i++) {
      if(proposals[index].signed[signers[i]]){
          // if signer can sign that can be increase signer count 
        signedCount++;
      }
    }
    // it will return the if the condition is  true setting the bool value is True  or false 
    return signedCount >= signersRequired;
  }
// this modifier can check the all signers are signed  or not 
  modifier isFullySigned(uint index) {
      // checking the signerRequirementsMet with index
    require(signerRequirementsMet(index));
    _;
  }
// this is finalize the proposal can execute first isFullySigned modifier to check all the signer can sign or not 
//check the amount of this address balance is greater than proposals amount 
//if this is true the finalizeProposal can transfer the amount 
// add finalization to send Ethers 
// And finalized with index of reciever 
  function finalizeProposal(uint index) isFullySigned(index) isSigner(msg.sender) public  {
    require(address(this).balance >= proposals[index].amount);
    //if proposals of index is not finalized 
    require(proposals[index].finalized == false);
    // that can be finalized 
    proposals[index].finalized = true;
    // and transfer amount with Ethers
    proposals[index].to.transfer(proposals[index].amount);
  }


}