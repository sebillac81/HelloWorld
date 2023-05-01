// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld {
    string text;
    address public owner;
    uint public count;

    constructor(){
        text = "Hello World";
        owner = msg.sender;
    }
    /// @return text: return the variable text 
    function helloWorld() public view returns(string memory){
        return text;
    }

    /// @param _text: rename the storage variable text for the new input
    function setText(string calldata _text) public  {
        text = text;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    /// @param _newOwner: asing the variable owner
    /// @notice : replace the current owner for the newOwner
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    /// @param _payableText: rename the storage variable text for the new input
    /// @notice : You have to pay 0.1 ether to change te the text
    function setTextPayable(string calldata _payableText) public payable onlyOwner{
            require(msg.value >= 0.1 ether, "0.1 ether to pay at least!!!");
            text = _payableText;
    }

    function setCount() public {
        count++;
    }

    function getCount() public view returns(uint){
        return count;
    }

    receive() external payable{}

}