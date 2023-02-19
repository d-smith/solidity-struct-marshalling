// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "TypedMemView.sol";

library Sample {
    using TypedMemView for bytes;
    using TypedMemView for bytes29;

    struct A {
        bytes32 recipient;
        uint256 amount;
    }

    event Amount(uint256);

    function formatSample(bytes32 recipient,
        uint256 amount) internal pure returns (bytes memory) {
        return abi.encodePacked(
            recipient,
            amount
        );
    }

    function _recipient(bytes29 _message) internal pure returns (bytes32) {
        return bytes32(_message.index(0,32));
    }

    function _amount(bytes29 _message) internal pure returns (uint256) {
        return uint256(_message.indexUint(32,32));
    }

     function addressToBytes32(address addr) internal pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function bytes32ToAddress(bytes32 _buf) public pure returns (address) {
        return address(uint160(uint256(_buf)));
    }

    function tryIt() public  {
       bytes32 addr = addressToBytes32(0xE0f5206BBD039e7b0592d8918820024e2a7437b9);
        A memory a =  A(addr, 10);

        bytes memory daBytes = Sample.formatSample(a.recipient, a.amount);
        bytes29 _originalMsg = daBytes.ref(0);

        uint256 daAmount = _amount(_originalMsg);

        emit Amount(daAmount);
    }

    
}
