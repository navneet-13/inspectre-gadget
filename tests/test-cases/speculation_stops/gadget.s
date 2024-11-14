speculation_stops:
    ldrh    w9, [x0]                            // movzx r9, WORD PTR [rdi] -> Load halfword from [rdi] into x9
    cmp     x0, #0                              // cmp rax, 0x0 -> Compare x0 (rax) with 0
    beq     trans1                               // jz trans1 -> Jump to trans1 if x0 == 0
    cmp     x0, #1                              // cmp rax, 0x1 -> Compare x0 (rax) with 1
    beq     trans2                               // jz trans2 -> Jump to trans2 if x0 == 1
    cmp     x0, #2                              // cmp rax, 0x2 -> Compare x0 (rax) with 2
    beq     trans3                               // jz trans3 -> Jump to trans3 if x0 == 2

trans0:
    // SFENCE is a memory barrier, but AArch64 doesn’t have a direct equivalent, so we'll ignore it
    dmb     ishst
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x10, [x9, x2]      // mov r10, QWORD PTR [r9 + 0xffffffff81000000] -> Load value from [r9 + 0xffffffff81000000] into x10
    b       end                                 // jmp end -> Branch to the end label

trans1:
    // LFENCE is typically a barrier, which is also ignored in AArch64
    dmb     ish
    ldr     x10, [x1, x9, LSL #0]               // mov r10, QWORD PTR [rsi + r9 - 0x10] -> Load value from [rsi + r9 - 0x10] into x10
    b       end                                 // jmp end -> Branch to the end label

trans2:
    // MFENCE is also ignored in AArch64 (it’s a barrier for memory ordering)
    dsb     ish
    ldr     x10, [x1, x9]                       // mov r10, QWORD PTR [rsi + r9] -> Load value from [rsi + r9] into x10
    b       end                                 // jmp end -> Branch to the end label

trans3:
    // CPUID in x86 is used to get information about the CPU, but it’s not directly available in AArch64
    isb
    // So, we will just skip this operation in AArch64
    ldr     x10, [x1, x9]                       // mov r10, QWORD PTR [rsi + r9] -> Load value from [rsi + r9] into x10
    b       end                                 // jmp end -> Branch to the end label

end:
    b       0xdead0                             // jmp 0xdead0 -> Jump to the address 0xdead0
