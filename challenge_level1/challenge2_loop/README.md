# Level 1 
## Challenge 2 - Loop

Error cause: More than the test data is being checked in the for loop   
Reason and Fix:
1. Loop needs to run only for 3 sets of numbers and there was no end of loop
2. Added these two lines
    ```
    beqz t5, test_end (she uses pass)
    addi t5, t5, -1
    ```
