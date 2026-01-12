// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// import Openzeppelin Ownable contract
import "@openzeppelin/contracts/access/Ownable.sol";

// inherit from Ownable contract 
contract Assignment9 is Ownable {
    // create a public array called `deployedContracts` to store contracts addresses in it 
    SimpleContract[] public deployedContracts;

    // call Ownable constructor of openzeppelin contract
    constructor () Ownable(msg.sender) {
        
    }

    // @dev Factory to deploy new instances of `SimpleContract`
    // make only the owner is the one who can call this function
    function createContract() external onlyOwner {
        // deploy new instance of SimpleContract
            // Hint: When you create a new instance, do not forget to pass any arbitrary initial value in the constructor
        SimpleContract new_contract = new SimpleContract(0);

        // push the new deployed instance to deployedContracts array
        deployedContracts.push(new_contract);
    }

    function setValue(uint256 contract_index, uint256 newValue) external {
        SimpleContract(address(deployedContracts[contract_index])).setValue(newValue);
    }
}

// Simple contract to be deployed by the factory
contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}
