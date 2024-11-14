secret_stored_in_mem:
    ldr     w8, [x1]                          // Load 4-byte value from [x1] into w8 (r8d in x86-64)
    movz    x9, 0xffff, lsl #48
    movk    x9, 0xffff, lsl #32
    movk    x9, 8200, lsl #16
    movk    x9, 0x0 // Load address 0xffffffff82000000 into x9 (rdx in x86-64)
    str     w8, [x9]                          // Store w8 into memory at [x9] (rdx in x86-64)
    ldr     x10, [x9]                         // Load 8-byte value from [x9] into x10 (r10 in x86-64)
    and     x10, x10, #0xffff                 // Perform bitwise AND with 0xffff (clear upper bits)
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x11, [x10, x2]   // Load value from [x10 + 0xffffffff81000000] into x11 (rcx in x86-64)

    ldrh    w12, [x9]                         // Load 2-byte value from [x9] into w12 and zero-extend to w12 (movzx)
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x13, [x12, x2]   // Load value from [x12 + 0xffffffff81000000] into x13 (rdi in x86-64)
    b       0xdead0                           // Jump to address 0xdead0
