// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Caller {
    // Address of the contract to which we will delegate calls
    address public receiverContract;

    // Event to log delegate call results
    event DelegateCallResult(bool success, bytes returnData);

    constructor(address _receiverContract) {
        receiverContract = _receiverContract;
    }

    // Function to update the state variables in the receiver contract via delegate call
    function updateStateVariables(uint256 _newValue) external returns (bool, bytes memory) {
        // Prepare the delegate call data
        bytes memory data = abi.encodeWithSignature("updateState(uint256)", _newValue);

        // Perform the delegate call
        (bool success, bytes memory returnData) = receiverContract.delegatecall(data);

        // Emit an event to log the result of the delegate call
        emit DelegateCallResult(success, returnData);

        return (success, returnData);
    }
}

// Target Contract
contract Receiver {
    uint256 public stateVariable;

    // Function to update a state variable
    function updateState(uint256 _newValue) external returns (bool) {
        stateVariable = _newValue;
        return true;
    }
}
