cmove_sample:
    ldr     x0, [x1, #0x18]            // mov rdi, qword ptr [rdx + 0x18]
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if condition is met)
    tst     x0, x0                      // test rax, rax
    cset    x0, eq                      // cmove rax, rdi (set rax to rdi if condition is met)

    ldr     w0, [x0, #0x24]             // eax = dword ptr [rax + 0x24] (transmission of either value)

    b       0xdead0                     // jmp 0xdead0
