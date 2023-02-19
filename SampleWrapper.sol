// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "Sample.sol";
import "TypedMemView.sol";

contract SampleWrapper {
    using TypedMemView for bytes;

    function doIt() public {
        Sample.tryIt();
    }

    struct MyMessage {
        bytes32 recipient;
        uint256 amount;
    }

    function makeMessage() internal pure  returns  (MyMessage memory) {
        MyMessage memory _msg;
        _msg.recipient = Sample.addressToBytes32(0xE0f5206BBD039e7b0592d8918820024e2a7437b9);
        _msg.amount = 123;

        return _msg;
    }

    function decodedAmount() public pure returns (uint256) {
        MyMessage memory mm = makeMessage();
        bytes memory daBytes = Sample.formatSample(mm.recipient, mm.amount);
        bytes29 _originalMsg = daBytes.ref(0);

        uint256 daAmount = Sample._amount(_originalMsg);
        return daAmount;
    }

    function decodeAddress() public pure returns (address) {
        MyMessage memory mm = makeMessage();
        bytes memory daBytes = Sample.formatSample(mm.recipient, mm.amount);
        bytes29 _originalMsg = daBytes.ref(0);

        bytes32 daAddress = Sample._recipient(_originalMsg);
        address decoded = Sample.bytes32ToAddress(daAddress);

        return decoded;
    }
}
