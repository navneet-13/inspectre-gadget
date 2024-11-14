multiple_bb:
    cmp     x8, #0                       // cmp r8, 0x0
    beq     trans1                        // je trans1 -> Jump to trans1 if x8 == 0
    cmp     x8, #1                       // cmp r8, 0x1
    beq     trans2                        // je trans2 -> Jump to trans2 if x8 == 1
    cmp     x8, #2                       // cmp r8, 0x2
    beq     trans3                        // je trans3 -> Jump to trans3 if x8 == 2
    cmp     x8, #3                       // cmp r8, 0x3
    beq     trans4_5                      // je trans4_5 -> Jump to trans4_5 if x8 == 3

# -- exploitable gadgets
trans0:
    ldr     x9, [x0]                     // mov r9, QWORD PTR [rdi] -> Load value from [rdi] into x9
    ldr     x10, [x9, #0x5890]           // mov r10, QWORD PTR [r9 + 0x5890] -> Load value from [r9 + 0x5890] into x10
    b       end                          // jmp end -> Jump to the end label

trans1:
    ldr     x9, [x0]                     // mov r9, QWORD PTR [rdi] -> Load value from [rdi] into x9
    add     x9, x9, #0x821               // add r9, 0x821 -> Add 0x821 to x9
    lsl     x9, x9, #16                  // shl r9, 16 -> Shift x9 left by 16 bits
    add     x9, x9, #0x33                // add r9, 0x33 -> Add 0x33 to x9
    ldr     x10, [x9]                    // mov r10, QWORD PTR [r9] -> Load value from [x9] into x10
    b       end                          // jmp end -> Jump to the end label

trans2:
    ldr     x9, [x0]                     // mov r9, QWORD PTR [rdi] -> Load value from [rdi] into x9
    and     x0, x0, #0xff                // and rax, 0xff -> Mask the lower byte of x0 (rax) with 0xff
    ldr     x10, [x9, x0]                // mov r10, QWORD PTR [r9 + 0x20 + rax] -> Load value from [r9 + x0] into x10
    b       end                          // jmp end -> Jump to the end label

trans3:
    ldr     x9, [x0]                     // mov r9, QWORD PTR [rdi] -> Load value from [rdi] into x9
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x10, [x9, x2] // mov r10, QWORD PTR [r9 + 0xffffffff81000000] -> Load value from [r9 + 0xffffffff81000000] into x10
    b       end                          // jmp end -> Jump to the end label

# -- not exploitable gadgets
trans4_5:
    ldr     x9, [x0]                     // mov r9, QWORD PTR [rdi] -> Load value from [rdi] into x9
    lsl     x9, x9, #9                   // shl r9, 9 -> Shift x9 left by 9 bits
    ldr     x10, [x9]                    // mov r10, QWORD PTR [r9] -> Load value from [x9] into x10
    ldr     w9, [x0]                     // mov r9d, DWORD PTR [rdi] -> Load the lower 32-bits from [rdi] into w9
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x11, [x9, x2] // mov r11, QWORD PTR [r9 + 0xffffffff81000000] -> Load value from [r9 + 0xffffffff81000000] into x11
    b       end                          // jmp end -> Jump to the end label

end:
    b       0xdead0                       // jmp 0xdead0 -> Jump to the address 0xdead0
