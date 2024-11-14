tfp_symbolic:
    cmp     x15, #0                    // Compare r15 with 0
    beq     tfp1                       // If zero, branch to tfp1

tfp0:
    ldr     x0, [x1, x2]               // Load from [rcx + rsi] into x0 (rax)
    blr     x0                         // Call the address in x0 (equivalent to `call rax`)

tfp1:
    add     w1, w1, w7                 // Add bh to the byte at [rdi] (bh -> b7 in AArch64)
    cmp     w0, w1                     // Compare eax (w0) with ecx (w1)
    csel    w0, w0, w1, hs             // Set eax = ecx if above or equal (cmovae eax, ecx)
    
    movz    x2, 0x7db6, lsl #16
    movk    x2, 0xbd40
    sub     x0, x0, x2
    ldr     x0, [x0]     // Load from [rax - 0x7db6bd40]
    br      x0                         // Jump to the address stored at [rax - 0x7db6bd40]
