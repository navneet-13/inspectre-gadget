stack_controlled:
    ldr     x0, [sp], #8                 // pop rdi -> load value from [sp] into x0 (rdi <- [sp]), update sp
    ldr     x1, [sp], #8                 // pop rsi -> load value from [sp] into x1 (rsi <- [sp]), update sp
    ldr     x2, [sp], #8                 // pop rdx -> load value from [sp] into x2 (rdx <- [sp]), update sp
    ldr     x3, [sp], #8                 // pop rcx -> load value from [sp] into x3 (rcx <- [sp]), update sp
    ldrh    w4, [x2, #0xff]              // movzx r10, WORD PTR [rdx + 0xff] -> load halfword from [rdx + 0xff] into x4
    ldr     x5, [x3, x4]                 // mov r11, QWORD PTR [rcx + r10] -> load value from [rcx + x4] into x5
    b       0xdead0                      // jmp 0xdead0 -> branch to address 0xdead0
