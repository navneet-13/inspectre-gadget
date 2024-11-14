cmove_sample:
    ldr     x0, [x1, #0x18]             // mov rdi, qword ptr [rdx + 0x18] (x1 is equivalent to rdx, x0 is equivalent to rdi)
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if rdi == 0, x2 is equivalent to rsi)

    ldr     w0, [x0]                    // mov eax, dword ptr [rdi] (load 32-bit value from address pointed by rdi into w0)

    b       0xdead0                     // jmp 0xdead0
