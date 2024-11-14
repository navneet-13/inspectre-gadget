.code_load:
    cmp     w8, #0
    beq     trans1
    cmp     w8, #1
    beq     trans2
    cmp     w8, #2
    beq     trans3

trans0:
    ldrh    w2, [x0]                // load of secet (half-word)
    add     x0, x1, x2              // lea rax, [rdx + rsi]
    br      x0                      // jmp rax

trans1:
    ldr     x0, [x0]                // load of unmasked secet
    br      x0                      // jmp rax

trans2:
    ldrh    w0, [x0]                // load of secet (half-word)
    ldr     x0, [x0, x0, lsl #3]    // jmp QWORD PTR [rax*8 - 0x7f000000]
    br      x0

trans3:
    ldr     x0, [x0]
    br      x0                    // jmp [rdi]
