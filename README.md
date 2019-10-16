# HCRESC
A prototype of HCRESC. It can improve the randomization entropy significantly, meanwhile ensure the semantic consistency between variants and the original code. HCRESC reschedules instructions within the range of functions rather than basic blocks, thus producing more variants of the original code and preserving the code's semantic. We implemented HCRESC on a Linux platform of x86-64 architecture and demonstrated that HCRESC can increase the randomization entropy of x86-64 code over than 120 compared with existing methods while ensuring control flow and size of the code unaltered.

Currently, HCRESC supports processing of C programs, it will generate multiple variants of the original program. HCRESC works based on the LLVM compiler toolchain.
