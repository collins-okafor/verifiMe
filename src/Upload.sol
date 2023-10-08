// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity >=0.7.0 < 0.9.0;

contract Upload{
    struct Access{
        address user;
        bool access;
    }

    mapping (address => string[]) urlValue; 
    mapping (address => mapping (address => bool)) ownership;
    mapping (address => Access[]) accessList;
    mapping (address => mapping (address => bool)) previousData;

    function add(address _user, string calldata url) external {  
        urlValue[_user].push(url);
    }

    function allow(address user) external {
        ownership[msg.sender][user] = true;
        accessList[msg.sender].push(Access(user, true)); 
    } 

    function disallow(address user) external {
        ownership[msg.sender][user] = false;
        accessList[msg.sender].push(Access(user, true)); 
    }    

}