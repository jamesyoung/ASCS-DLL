pragma solidity^0.4.11;

library ASCSDLL {
    mapping(bytes32 => uint) store;

    bytes32[] attributes;
    uint sortAttributeIndex;

    function setOptions(bytes32[] _attributes, uint _sortAttributeIndex) {
        attributes = _attributes;
        sortAttributeIndex = _sortAttributeIndex;
    }

    function getAttribute(uint curr, bytes32 attributeName) returns uint {
        return store[sha3(msg.sender, curr, attributeName)];
    }

    function setAttribute(uint curr, bytes32 attributeName, uint attributeValue) {
        store[sha3(msg.sender, curr, attributeName)] = attributeValue;
    }
}
