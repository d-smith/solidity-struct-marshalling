# Solidity Struct Marshalling

Sample that shows how to marshall and unmarshall structs using a memory view instead of bytes memory.
This uses the TypedMemView contract to do the real work here, and taps the CCTP source for converting between
address and bytes32 types.

Refer to the comments in TypedMemView.sol for more details.

## References

* [TypedMemView origin](https://github.com/summa-tx/memview-sol)
* [Layne Haber fork updated for Solidity 0.8](https://github.com/LayneHaber/memview-sol/tree/latest-solidity)
* [Circle CCTP](https://github.com/circlefin/evm-cctp-contracts) with example use, and address - bytes32 conversion routines used in this sample.
