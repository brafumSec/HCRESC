# HCRESC
HCRESC, a code randomization tool, which can improve the randomization entropy significantly, meanwhile ensure the semantic consistency between variants and the original code. HCRESC reschedules instructions within the range of functions rather than basic blocks, thus producing more variants of the original code and preserving the code's semantic, i.e., control flow and size of the randomized code are consistent with the original code. HCRESC works based on the LLVM compiler toolchain.

Currently, HCRESC runs on Linux platform and supports processing of C programs, it will generate multiple variants of the original program. 
