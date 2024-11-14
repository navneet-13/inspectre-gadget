cmove_sample:
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if rdi == 0)

    ldr     x0, [x0, #0x18]             // mov rdi, qword ptr [rdi + 0x18]
    ldr     x1, [x1, #0x18]             // mov rsi, qword ptr [rsi + 0x18]

    ldr     w0, [x0, x1]                // mov eax, dword ptr [rdi + rsi] (load value with secret or attacker)

    b       0xdead0                     // jmp 0xdead0
