alias_type_2:
    // Secret Address and Transmission Base based on rdi
    ldrh    w8, [x0, #0x100]                 // movzx r8d, WORD PTR [rdi + 0x100] (load 16-bit secret from [rdi + 0x100] into w8)
    ldr     x1, [x0]                         // mov rsi, QWORD PTR [rdi] (load trans base from [rdi] into x1)
    ldr     x10, [x1, x8]                    // mov r10, QWORD PTR [rsi + r8] (load transmission from [rsi + r8] into x10)

    // Secret Address and Indirect Transmission Base based on rdx
    ldrh    w8, [x1, #0x28]                 // movzx r8d, WORD PTR [rdx + 0x28] (load 16-bit secret from [rdx + 0x28] into w8)
    ldr     x0, [x1, #0x20]                 // mov rax, QWORD PTR [rdx + 0x20] (load IND trans base from [rdx + 0x20] into x0)
    ldr     x1, [x0]                         // mov rsi, QWORD PTR [rax] (load trans base from [rax] into x1)
    ldr     x11, [x1, x8]                    // mov r11, QWORD PTR [rsi + r8] (load transmission from [rsi + r8] into x11)

    // Not a alias:
    ldr     x0, [x0, #0x200]                // mov rax, QWORD PTR [rdi + 0x200] (load secret address from [rdi + 0x200] into x0)
    ldr     x1, [x0, #0x240]                // mov rsi, QWORD PTR [rdi + 0x240] (load trans base from [rdi + 0x240] into x1)
    ldrh    w8, [x0]                        // movzx r8d, WORD PTR [rax] (load 16-bit secret from [rax] into w8)
    ldr     x13, [x1, x8]                   // mov r13, QWORD PTR [rsi + r8] (load transmission from [rsi + r8] into x13)

    b       0xdead0                         // jmp 0xdead0 (unconditional jump to 0xdead0)
