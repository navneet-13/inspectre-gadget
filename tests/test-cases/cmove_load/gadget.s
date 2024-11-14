cmove_sample:
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if condition is met)

    ldr     x0, [x0, #0x18]             // mov rdi, qword ptr [rdi + 0x18] (load address)

    ldr     w0, [x0]                    // mov eax, dword ptr [rdi] (load value from address in rdi)

    b       0xdead0                     // jmp 0xdead0
