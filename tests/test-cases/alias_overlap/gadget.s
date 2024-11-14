alias_type_2:
    // Independent stuff that comes from same register
    ldrh    w8, [x2, #0x28]                  // movzx r8d, WORD PTR [rdx + 0x28] (Load 16-bit value into w8)
    ldr     x0, [x2, #0x20]                  // mov rax, QWORD PTR [rdx + 0x20] (Load QWORD from [rdx + 0x20] into x0)
    ldr     x1, [x0]                          // mov rcx, QWORD PTR [rax] (Load QWORD from address in x0 into x1)
    ldr     x11, [x1, x8]                    // mov r11, QWORD PTR [rcx + r8] (Load QWORD from [rcx + r8] into x11)

    // Overlapping stuff that comes from same register
    ldrh    w9, [x2, #0x24]                  // movzx r9d, WORD PTR [rdx + 0x24] (Load 16-bit value into w9)
    ldr     x2, [x2, #0x20]                  // mov rbx, QWORD PTR [rdx + 0x20] (Load QWORD from [rdx + 0x20] into x2)
    ldr     x3, [x2]                          // mov rsi, QWORD PTR [rbx] (Load QWORD from address in x2 into x3)
    ldr     x12, [x3, x9]                    // mov r12, QWORD PTR [rsi + r9] (Load QWORD from [rsi + r9] into x12)

    b       0xdead0                           // jmp 0xdead0 (unconditional jump to 0xdead0)
