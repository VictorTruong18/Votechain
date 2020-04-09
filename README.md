# Votechain project

![Votechain%20project/Votechain.png](Votechain%20project/Votechain.png)

# Summary :

1. Presentation of the app 
2. The purpose of this app
3. Tests of the blockchain 
4. Perspective of upgrades 

## 1. Presentation of the app

This is a Voting app that uses blockchain technologies to **protect votes** from being modified by hackers, and to **assure anonymity** amongst the election process.

The main goal of building a **decentralized voting app** is to enable people to vote from wherever they want, and not to be restricted by time or geographical issues, or descrimination.

This project is still a prototype and still has some functionalities that can be improved. It was programmed in JavaEE and MysQL which are not the best languages for building a blockchain project, but are still good for writing prototypes.

### Presentatation : 1) Menu

![Votechain%20project/Screen_Shot_2020-04-09_at_17.12.48.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.12.48.png)

Every elector has a unique id and password. 

### Presentation : 2) Elector dashboard

![Votechain%20project/Screen_Shot_2020-04-09_at_17.16.27.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.16.27.png)

When the elector logs in he arrives on his dashboard. Of course he should only be able to vote, and the two other options should only be available for the developpers and the commity of votes. But because I needed those functionalities to assure myself that the app was working I've added them to the elector's dashboard.

### Presentation : 3) Vote

![Votechain%20project/Screen_Shot_2020-04-09_at_17.20.38.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.20.38.png)

As soon as the elector click on 'voter', he is directly retransfered to the login, and is unable to vote again. And as he voted, a new block is added to the blockchain.

### Presentation : 4) The Votechain

![Votechain%20project/Screen_Shot_2020-04-09_at_17.20.52.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.20.52.png)

Developpers can look at the votechain. You can see that every vote is anonymous and that the last-hash of one vote corespond to the hash of the previous vote. Eventhough you wouldn't normally be able to see the content of each block of a blockchain I've made this available for developpers to check if the final score is correct.

### Presentation : 5) The score

![Votechain%20project/Screen_Shot_2020-04-09_at_17.21.02.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.21.02.png)

We can see the number of votes. This score is counted thanks to the votechain, and is not stored. If you want to modify the score you'll have to modify the blockchain, and the blockchain is made to be protected against such attack.

## 2. The purpose of the app

We shouldn't have to go from one point to another in order to vote. The abstention rate is growing, and partialy a reason for that is because today's voting system is very unpractical. 

The reason why we still do not vote online is because of security issues. A hacker may be able to chang e the results of the election, if it is hard-coded.

Because we don't want to have any hard-coded variables, we decide to rely on a blockchain.

![Votechain%20project/chaine_de_blocs.png](Votechain%20project/chaine_de_blocs.png)

![Votechain%20project/Screen_Shot_2020-04-09_at_17.44.22.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.44.22.png)

A blockchain is useful for a voting system because :
- The votes can remain anonymous
- You can't modify any vote that belongs to the blockchain
- The result of the election will be given by the blockchain which is a secured system
- The election is decentralized so the vote cannot be rigged by any authority

How are the hashs created ?

The hashs are created with the combination of :
    data + voter's name + timestamp

The cryption algorithm used is "SHA-256"

	```java
    public class Vote {
    	private String hash;
    	private String last_hash;
    	private String data;
    
    	
    	
    	public Vote(String voteur,String data) {
    		this.data = data;
    		
    		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    		String hashing_content = data + voteur + timestamp;
    		try {
    			this.hash = toHexString(getSHA(hashing_content));
    		} catch (NoSuchAlgorithmException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    
    public static byte[] getSHA(String input) throws NoSuchAlgorithmException 
    	    {  
    	        // Static getInstance method is called with hashing SHA  
    	        MessageDigest md = MessageDigest.getInstance("SHA-256");  
    	  
    	        // digest() method called  
    	        // to calculate message digest of an input  
    	        // and return array of byte 
    	        return md.digest(input.getBytes(StandardCharsets.UTF_8));  
    	    } 
    	
    	 public static String toHexString(byte[] hash) 
    	    { 
    	        // Convert byte array into signum representation  
    	        BigInteger number = new BigInteger(1, hash);  
    	  
    	        // Convert message digest into hex value  
    	        StringBuilder hexString = new StringBuilder(number.toString(16));  
    	  
    	        // Pad with leading zeros 
    	        while (hexString.length() < 32)  
    	        {  
    	            hexString.insert(0, '0');  
    	        }  
    	  
    	        return hexString.toString();  
    	    }
	```

## 3. Tests of the blockchain

![Votechain%20project/Screen_Shot_2020-04-09_at_17.53.21.png](Votechain%20project/Screen_Shot_2020-04-09_at_17.53.21.png)

### 3 - 1 InvalidReplacementOfVote()
		```java
    	// You shouldn't be able to modify any vote or replace any vote by another.
    	// the 'replaceVote' method takes one vote and replaces it by another.
    	// this method will return a false if it couldn't change the vote.
    	@Test
    	public void invalidReplacementOfVote() {
    		//Instancing a votechain which already has a few votes
    		Votechain v = new Votechain();
    		//We are taking a vote from the votechain 
    		Vote previousVote = v.votes.get(3);
    		
    		//We are creating a false vote from a hackeur
    		String authorNewVote = "hackeur";
    		String dataNewVote = "Marine LePen";
    		Vote newVote = new Vote(authorNewVote,dataNewVote);
    		
    		//Thie method replaceVote() will return false if it couldn't change the block in question
    		assert(!v.replaceVote(previousVote,newVote));
    		
    		//It's returning false because the vote from the hacker didn't have the correct hash values
    		
    	}
		```

this test prooves that you can't replace a pre-existant vote by a fake one, because the hash value of the fake block wouldn't correspond to the last-hash value of the succeeding vote.

![Votechain%20project/Screen_Shot_2020-04-09_at_18.05.41.png](Votechain%20project/Screen_Shot_2020-04-09_at_18.05.41.png)

### 3 - 2 InvalidReplacementOfIndenticalVote()
	```java
    //You shouldn't be able to modify a vote even if you are modifying it with a Vote which is identical.
    	@Test 
    	public void invalidReplacementOfIdenticalVote() {
    		//Instancing a votechain which already has a few votes
    		Votechain v = new Votechain();
    
    		String authorName = "Davy";
    		String data = "Marine LePen";
    
    		Vote twinVote1 = new Vote(authorName,data);
    		Vote twinVote2 = new Vote(authorName,data);
    		
    		v.addVote(twinVote1);
    		assert(!v.modifyVote(twinVote1, twinVote2));
    		
    	}
	```

This test prooves that you cannot replace any vote from the blockchain at all. When we try to create two identical blocks with the same data they are in fact not identical at all because the hashing takes into consideration the timestamp, which is the time reffering to when the block was created. So considering their hashing values they are both two different blocks. 

### 3 - 3 InvalidModificationOfVote()
	```java
    //I should not be able to set a new value to a existing block
    	@Test
    	public void invalidModificationIdentical() {
    		//Instancing a votechain which already has a few votes
    		Votechain v = new Votechain();
    		//Changing the value of a vote
    		assert(!v.votes.get(3).setData("Marine LePen"));
    		//the setData method will return false if it could'nt manage to change the data
    		
    	}
	```

This test prooves that you can't modify the data of the block belonging to the blockchain.

## 4 - Perspectives of upgrades

- Use the language solidity and implement the Ethereum blockchain.
- Get rid of the database.
- Use abstract programming to be enable the user to create any kind of vote.