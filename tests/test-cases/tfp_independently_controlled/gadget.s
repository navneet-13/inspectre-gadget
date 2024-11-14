tfp_independently_controllable:
    ldr     x2, [x0]                    // Load QWORD from [rdi] into x2 (rsi <- [rdi])
    ldr     x3, [x3]                    // Load QWORD from [rdx] into x3 (rdx <- [rdx])
    ldr     x1, [x2]                    // Load QWORD from [rsi] into x1 (rbx <- [rsi])
    add     x4, x2, x3                  // Add x2 (rsi) and x3 (rdx), result into x4 (rcx <- rsi + rdx)
    ldr     x0, [x0, #0x10]             // Load QWORD from [rdi + 0x10] into x0 (rax <- [rdi + 0x10])
    blr     x0                           // Branch to the address in x0 (call rax)
