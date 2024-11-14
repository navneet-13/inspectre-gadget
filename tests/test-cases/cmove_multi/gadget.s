cmove_sample:
    ldr     x0, [x1, #0x18]            // mov rdi, qword ptr [rdx + 0x18]
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if rdi == 0)

    tst     x0, x0                      // test rax, rax
    cset    x0, eq                      // cmove rax, rbx (set x0 to rbx if rax == 0)

    ldr     w0, [x0, x0]                // eax = dword ptr [rax + rdi] (transmission of either value)

    b       0xdead0                     // jmp 0xdead0
