cmove_sample:
    tst     x0, x0                      // test rdi, rdi
    cset    x1, eq                      // cmove rax, rbx (set x1 to rbx if rdi == 0)

    cmp     x2, x1                      // cmp rcx, rax
    beq     if                           // jz if (branch if x2 == x1)

    b       else                         // jmp else (branch to else)

if:
    ldr     x0, [x0, #0x18]             // mov rdi, qword ptr [rdi + 0x18]
    ldr     w0, [x0]                    // mov eax, dword ptr [rdi]

    b       0xdead0                     // jmp 0xdead0

else:
    ldr     x1, [x1, #0x18]             // mov rsi, qword ptr [rsi + 0x18]
    ldr     w2, [x1]                    // mov ebx, dword ptr [rsi]

    b       0xdead0                     // jmp 0xdead0
