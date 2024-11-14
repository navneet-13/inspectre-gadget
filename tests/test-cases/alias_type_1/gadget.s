alias_type_1:
    // Secret Address and transmission base on rdi
    ldrh    w8, [x0]                        // movzx r8d, WORD PTR [rdi] (load 16-bit secret from [rdi] into w8)
    ldr     x2, [x0, x8, lsl #3]            // mov rcx, QWORD PTR [r8 - 0x20] (load transmission base without aliasing from [r8 - 0x20] into x2)
    ldr     x10, [x0, x8, lsl #3]           // mov r10, QWORD PTR [rdi + r8 + 0x50] (load transmission with aliasing from [rdi + r8 + 0x50] into x10)

    // Secret Address and transmission base on Indirect Load rsi
    ldr     x11, [x1]                       // mov r11, QWORD PTR [rsi] (load address from [rsi] into x11)
    ldrh    w9, [x11]                       // movzx r9d, WORD PTR [r11] (load 16-bit secret from [r11] into w9)
    ldr     x0, [x11, x9, lsl #3]           // mov rax, QWORD PTR [r11 + r9 + 0x20] (load transmission base from [r11 + r9 + 0x20] into x0)

    b       0xdead0                         // jmp 0xdead0 (unconditional jump to 0xdead0)
