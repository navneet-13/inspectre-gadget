store_transmission:
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x7000, lsl #16
    movk    x2, 0x0
    mov     x1, x2           // Load 0xffffffff70000000 into x1 (rdx <- 0xffffffff70000000)
    str     x8, [x1]                              // Store the value of x8 (r8) into memory at [x1] (equivalent to `mov [rdx], r8`)
    ldr     x10, [x1]                             // Load QWORD from [x1] (rdx) into x10 (r10 <- [rdx])
    ldr     x9, [x10, #0xff]                      // Load QWORD from [x10 + 0xff] (rdi <- [r10 + 0xff])
    and     x9, x9, #0xffff                       // Apply the mask (and rdi, 0xffff)
    str     x0, [x9, x0]                          // Store value in x0 (rax) into memory at [x9 + x0] (equivalent to `mov [rcx+rdi], rax`)
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x10, [x9, x2]        // Load QWORD from [rdi + 0xffffffff81000000] into x10 (r10 <- [rdi + 0xffffffff81000000])
    b       0xdead0                               // Branch to 0xdead0 (equivalent to `jmp 0xdead0`)
