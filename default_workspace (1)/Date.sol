// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DatingApp is ERC20 {
    struct UserProfile {
        string name;
        uint256 age;
        string gender;
        uint256 likes;
        uint256 interactionCount;
        address[] sentRequests;
        mapping(address => bool) pendingRequests; // Mapping to store request status
        address[] acceptedRequests;
    }

    struct Match {
        address user1;
        address user2;
    }

    struct Message {
        address sender;
        string text;
    }

    mapping(address => UserProfile) public userProfiles;
    Match[] public matches;
    mapping(bytes32 => Message[]) public messages;

    IERC20 public token;

    
    constructor() ERC20("Test", "TST") {
        _mint(address(this), 1000);
    }

    function createProfile(string memory name, uint256 age, string memory gender) external {
        require(bytes(name).length > 0, "Name cannot be empty");
        require(userProfiles[msg.sender].age == 0, "Profile already exists");

        userProfiles[msg.sender].name = name;
        userProfiles[msg.sender].age = age;
        userProfiles[msg.sender].gender = gender;
        
    }

    function updateProfile(string memory name, uint256 age, string memory gender) external {
        require(bytes(name).length > 0, "Name cannot be empty");
        require(userProfiles[msg.sender].age > 0, "Profile does not exist");

        userProfiles[msg.sender].name = name;
        userProfiles[msg.sender].age = age;
        userProfiles[msg.sender].gender = gender;

    }

    function likeUser(address target) external {
        require(msg.sender != target, "You cannot like yourself");
        require(userProfiles[msg.sender].age > 0, "User profile must exist");
        require(userProfiles[target].age > 0, "Target profile must exist");
        require(!hasMatched(msg.sender, target), "You have already matched with this user");

        userProfiles[msg.sender].likes++;
        userProfiles[target].likes++;

        matches.push(Match(msg.sender, target));

        // Check if the other user also liked, and if so, create a match
        if (hasMatched(target, msg.sender)) {
        }
    }

    function sendRequest(address target) external {
        require(msg.sender != target, "You cannot send a request to yourself");
        require(userProfiles[msg.sender].age > 0, "User profile must exist");
        require(userProfiles[target].age > 0, "Target profile must exist");
        require(!hasMatched(msg.sender, target), "You have already matched with this user");
        require(!userProfiles[msg.sender].pendingRequests[target], "You have already sent a request to this user");

        userProfiles[msg.sender].pendingRequests[target] = true;
        userProfiles[msg.sender].sentRequests.push(target);

    }

    function acceptRequest(address sender, bool accepted) external {
        require(userProfiles[msg.sender].age > 0, "User profile must exist");
        require(userProfiles[msg.sender].pendingRequests[sender], "Request not found");

        userProfiles[msg.sender].pendingRequests[sender] = false;

        if (accepted) {
            userProfiles[msg.sender].acceptedRequests.push(sender);

            // Notify the sender that the request has been accepted
            
            // Check if the sender also liked, and if so, create a match
            if (hasMatched(sender, msg.sender)) {
                
            }
        }
    }

    function getPendingRequests() external view returns (address[] memory) {
        UserProfile storage userProfile = userProfiles[msg.sender];
        address[] memory result = new address[](userProfile.sentRequests.length);
        for (uint256 i = 0; i < userProfile.sentRequests.length; i++) {
            result[i] = userProfile.sentRequests[i];
        }
        return result;
    }

    function getRequestStatus(address sender) external view returns (bool) {
        //return userProfiles[msg.sender].pendingRequests[sender];
    }

    function sendMessage(address target, string memory message) external {
        require(msg.sender != target, "You cannot send a message to yourself");
        require(bytes(message).length > 0, "Message cannot be empty");
        require(userProfiles[msg.sender].age > 0, "User profile must exist");
        require(userProfiles[target].age > 0, "Target profile must exist");
        require(hasMatched(msg.sender, target), "You must be matched with this user");

        bytes32 conversationID = keccak256(abi.encodePacked(msg.sender, target));
        messages[conversationID].push(Message(msg.sender, message));
        
    }

    function rewardInteraction(address target) external {
        require(msg.sender != target, "You cannot interact with yourself");
        require(userProfiles[msg.sender].age > 0, "User must have a profile with interactions.");

        uint256 rewardAmount = calculateRewardAmount(target);

        transfer(target, rewardAmount);
        userProfiles[msg.sender].interactionCount++;

        
    }

    function hasMatched(address user1, address user2) internal view returns (bool) {
        for (uint256 i = 0; i < matches.length; i++) {
            if (
                (matches[i].user1 == user1 && matches[i].user2 == user2) ||
                (matches[i].user1 == user2 && matches[i].user2 == user1)
            ) {
                return true;
            }
        }
        return false;
    }

    function calculateRewardAmount(address target) internal view returns (uint256) {
        require(userProfiles[target].interactionCount > 0, "Target user must have interactions.");

        uint256 baseReward = 1;
        uint256 targetInteractions = userProfiles[target].interactionCount;
        uint256 rewardAmount = baseReward + targetInteractions;
        uint256 maxReward = 10;

        if (rewardAmount > maxReward) {
            rewardAmount = maxReward;
        }

        return rewardAmount;
        }

    function getUsername(address userAddress) external view returns (string memory) {
        require(userProfiles[userAddress].age > 0, "Profile does not exist");
        return userProfiles[userAddress].name;
    }

}