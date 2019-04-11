# Multi-Signature-Wallet

 1.Regular transactions can be considered “single-signature transactions,” because the only one signature is from the owner of the    
    private key.
 2.But there are much more complex transfers that require the signatures from multiple people before transferring the funds. They 
    are called multi-signature addresses.
 3.Multisignature addresses are similar to joint bank accounts where more than one signature owner is required for the transactions 
    to be authorized
## The following steps to work  Multisigniture wallet 

# Step-1 :
      Deploy the contract with the Owner 
[](url)
![deploy](https://user-images.githubusercontent.com/26214396/55928143-40b2ea00-5c35-11e9-9901-ca8e418947b4.png)
    
    See The All The Features of Multisigniture Wallet.
    
![all the features](https://user-images.githubusercontent.com/26214396/55930111-74920d80-5c3d-11e9-90f1-558f0e66f244.png)

      
# Step-2 :
      Adding the Signers in the Contract for signing the Transaction 
      thats up to you how many signers can sign 
      in the smart contract Adding the max signers can be 2 members

![2nd owner](https://user-images.githubusercontent.com/26214396/55928373-09910880-5c36-11e9-9890-ec6993bb81d4.png)
    
     and Owner cannot sign the transaction It will be Raise The Error.
     
![owner_error](https://user-images.githubusercontent.com/26214396/55930049-30067200-5c3d-11e9-8b47-0a8d97611eb0.png)

    And All Signers can Sign The Transaction.
    
![added owner](https://user-images.githubusercontent.com/26214396/55928486-6bea0900-5c36-11e9-9dc9-61cb97c3adf9.png)
# Step-3 :
      Then Owner can  add the amount to wallet Account.
      with fallback Function.
      20 Ether add in the wallet.
   ![fallback amount](https://user-images.githubusercontent.com/26214396/55928526-9f2c9800-5c36-11e9-889a-705c7c5a35a4.png)

      
      
# Step-4 :
      And Now  check the Wallet Balance.
 ![image](https://user-images.githubusercontent.com/26214396/55928997-5ece1980-5c38-11e9-9edf-d6c1ce843b9a.png)

      
# Step-5 :
      Transfer The money to reciever.
      
![transfer_balance](https://user-images.githubusercontent.com/26214396/55929044-9210a880-5c38-11e9-87d1-f36b2145ff67.png)

# Step-6 :
      Check The Pending Transactions. 
      
![check_pending_Transactions](https://user-images.githubusercontent.com/26214396/55929066-ae144a00-5c38-11e9-895a-1197db82f663.png)

# Step-7 :
    Then Sign The transaction with having Signer using pending Trasaction ID.
   
![one_signed](https://user-images.githubusercontent.com/26214396/55929139-021f2e80-5c39-11e9-860f-4bbbf2a1f2e1.png)

# Step-8 :
       second Signer can Sign The Transaction.
    
![image](https://user-images.githubusercontent.com/26214396/55929250-6cd06a00-5c39-11e9-82dd-814ab617fbc1.png)

# Step-9 :
    and Check The pending transaction.
  ![image](https://user-images.githubusercontent.com/26214396/55929311-a30de980-5c39-11e9-88b0-5dc1d85a22ec.png)
# Step-10 :
     check the balance of that reciever account.
     balance credited or not 
  ![image](https://user-images.githubusercontent.com/26214396/55929369-ed8f6600-5c39-11e9-97c2-ed6ba7cb8dd5.png)

    Amount Will be recieved.
    Then Check The Wallet Balanace and pending Transaction.
![image](https://user-images.githubusercontent.com/26214396/55929420-2fb8a780-5c3a-11e9-9704-0f5957ea23ef.png)

# Step-11 :
     Withdraw amount from wallet to his account.
     Then Transaction is created in pending history.
![image](https://user-images.githubusercontent.com/26214396/55929521-af467680-5c3a-11e9-81d5-7afeb8e949cb.png)

    Again Signer can Sign The pending Transaction.
  
    max Signer can signed The Transaction.
![image](https://user-images.githubusercontent.com/26214396/55929693-75c23b00-5c3b-11e9-9cb0-79268713c478.png)
 
    check the wallet balance debited or not
 ![image](https://user-images.githubusercontent.com/26214396/55929801-10bb1500-5c3c-11e9-9050-88781dd14fea.png)

    
    Then the amount credited in owner acoount or not checking.
![image](https://user-images.githubusercontent.com/26214396/55929735-aace8d80-5c3b-11e9-915e-a677b3e532f5.png)

   Yes Credited in account.
## Step-12 :
     Then Delete pending Transaction By Owner or Signers also.
     
![anyone_can_delete_Transaction](https://user-images.githubusercontent.com/26214396/55929893-760f0600-5c3c-11e9-8333-fac7d85d05e1.png)

## Step-13 :
     Owner can be  delete the Signers.
![image](https://user-images.githubusercontent.com/26214396/55929929-a191f080-5c3c-11e9-8b24-4fa9333ffc1e.png)
     
     the Signers Cannot Delete the Owner.It will Raise The Error.
  ![image](https://user-images.githubusercontent.com/26214396/55929978-d9993380-5c3c-11e9-916a-00243fc19114.png)

   

## Done The Process.
