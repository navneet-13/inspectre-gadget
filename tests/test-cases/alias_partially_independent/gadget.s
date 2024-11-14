alias_partially_independent:
    // Not exploitable
    mov     x2, x1                        // mov esi, edi (x1, x2 for 64-bit registers)
    add     x2, x2, x12                   // add rsi, r12 (Add r12 to x2)
    ldr     x8, [x12, #0x28]              // mov rax, QWORD PTR [r12 + 0x28] (Load QWORD from [r12 + 0x28] into x8)
    ldr     x9, [x2, x8]                  // mov r9, QWORD PTR [rsi + rax] (Load QWORD from [rsi + rax] into x9)

    // Exploitable, but base is dependent from a value loaded near the secret
    // value. It requires to leak a secret near a valid base in memory.
    mov     x2, x1                        // mov esi, edi (x1, x2 for 64-bit registers)
    add     x2, x2, x12                   // add rsi, r12 (Add r12 to x2)
    ldr     w0, [x12, #0x28]              // mov eax, DWORD PTR [r12 + 0x28] (Load DWORD from [r12 + 0x28] into w0)
    ldr     x10, [x2, x0]                 // mov r10, QWORD PTR [rsi + rax] (Load QWORD from [rsi + rax] into x10)

    // Not exploitable
    mov     x2, x1
    ldr     x10, [x12, #0x20]                        // mov esi, edi (x1, x2 for 64-bit registers)
    add     x2, x2, x10         // add rsi, QWORD PTR [r12 + 0x20] (Add the value at [r12 + 0x20] to x2)
    ldr     x8, [x12, #0x28]              // mov rax, QWORD PTR [r12 + 0x28] (Load QWORD from [r12 + 0x28] into x8)
    ldr     x11, [x2, x8]                 // mov r11, QWORD PTR [rsi + rax] (Load QWORD from [rsi + rax] into x11)

    b       0xdead0                       // jmp 0xdead0 (unconditional jump to 0xdead0)
