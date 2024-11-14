cmove_sample:
    tst     x0, x0                      // test rdi, rdi
    cset    x1, eq                      // cmove rax, rbx (set x1 to rbx if rdi == 0)

    cmp     x2, x1                      // cmp rcx, rax
    beq     if                           // jz if (branch if x2 == x1)

    b       else                         // jmp else (unconditional branch to else)

if:
    ldr     x0, [x1, #0x18]             // mov rdi, qword ptr [rax + 0x18] (load address from rbx + 0x18 into x0)
    ldr     w0, [x0]                    // mov eax, dword ptr [rdi] (load 32-bit value from address in x0 into w0)

    b       0xdead0                     // jmp 0xdead0 (unconditional jump)

else:
    ldr     x1, [x1, #0x18]             // mov rsi, qword ptr [rbx + 0x18] (load address from rbx + 0x18 into x1)
    ldr     w2, [x1]                    // mov ebx, dword ptr [rsi] (load 32-bit value from address in x1 into w2)

    b       0xdead0                     // jmp 0xdead0 (unconditional jump)
