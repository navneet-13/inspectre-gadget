cmove_sample:
    ldr     w0, [x1, #0x18]            // mov edi, dword ptr [rdx + 0x18]
    sxtw    x0, w0                     // movsxd rdi, edi (sign-extend the word in w0 to x0)
    mov     x1, x0                     // mov rbx, rdi (copy rdi into rbx)

    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to rsi if rdi == 0)
    cbnz    x0, cmove_store             // if condition is met, execute store
    ldr     w0, [x0]                    // eax = dword ptr [rdi] (only on CMOVE path)
    ldr     w2, [x1, #0x20]             // ecx = dword ptr [rbx + 0x20] (this is always done)

cmove_store:
    b       0xdead0                     // jmp 0xdead0
