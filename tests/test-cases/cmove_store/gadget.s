cmove_sample:
    ldr     x0, [x1, #0x18]            // mov rdi, qword ptr [rdx + 0x18] 
    tst     x0, x0                      // test rdi, rdi
    cset    x0, eq                      // cmove rdi, rsi (set x0 to 1 if condition is true)
    mov     x1, x2                      // mov rsi, x2 (to store value)
    cbnz    x0, cmove_store             // if x0 is non-zero, continue with cmove
    mov     x0, x2                      // set x0 to rsi if rdi is zero
cmove_store:
    str     w3, [x0]                    // store eax (w3 is used for eax) at address in rdi
    str     x0, [x2]                    // store rdi value at address in rsi
    ldr     x0, [x2]                    // load value from rsi into rbx
    b       0xdead0                     // jmp 0xdead0
