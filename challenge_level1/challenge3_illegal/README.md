# Level 1 
## Challenge 3 - Illegal

Error cause: Illegal instruction was caused by .word 0
Reason and Fix:
1. 0 is not a valid instruction for this architecture and when encountered the trap handler mtvec_handler is getting invoked. Two solutions are possible:
    1. Change the invalid instruction so that trap handler is not called
    2. For silently skipping the invalid instruction, the trap handler can return to the next instruction
2. Solution 1: (test.S)
    Instead of instruction 0 we use instruction 164499 which corresponds to mv t0, t0. We also need to change j fail to j pass. Modified instructions are as follows:
    ```
    .word 164499              
    j pass
    ```
3. Solution 2: (test1.S)
    These instructions are added under mtvec_handler so that mepc can skip two instructions (which are .word 0 and j fail)
    ```
    addi t0, t0, 8 ## to skip both .word 0 and j fail
    csrw mepc, t0
    ```