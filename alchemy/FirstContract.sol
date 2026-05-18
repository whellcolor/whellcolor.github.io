// Specifies the version of Solidity, using semantic versioning.
pragma solidity >=0.7.3;

// Defines a contract named 'HelloWorld'.
contract HelloWorld {
    // Emitted when update function is called
    event UpdatedMessages(string oldStr, string newStr);

    // Declares a state variable 'message' of type 'string'.
    string public message;

    // Constructor is a special function that is only executed upon contract creation.
    constructor(string memory initMessage) {
        // Accepts a string argument 'initMessage' and sets the value into the contract's 'message' storage variable.
        message = initMessage;
    }

    // A public function that accepts a string argument and updates the 'message' storage variable.
    function update(string memory newMessage) public {
        string memory oldMsg = message;
        message = newMessage;
        emit UpdatedMessages(oldMsg, newMessage);
    }
}
