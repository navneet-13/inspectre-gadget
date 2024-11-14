attack_stored_in_mem:
    movz    x10, 0xffff, lsl #48
    movk    x10, 0xffff, lsl #32
    movk    x10, 0x7000, lsl #16
    movk    x10, 0x0
    mov     x1, x10        // mov rdx, 0xffffffff70000000
    str     x8, [x1]                      // mov QWORD PTR [rdx], r8 (store attacker value in memory at rdx)
    
    ldr     x2, [x1]                      // mov r10, QWORD PTR [rdx] (load attacker from memory into x2)
    
    ldr     x3, [x2, #0xff]               // mov rdi, QWORD PTR [r10 + 0xff] (load secret from memory into x3)
    and     x3, x3, #0xffff               // and rdi, 0xffff (mask the secret)
    
    movz    x10, 0xffff, lsl #48
    movk    x10, 0xffff, lsl #32
    movk    x10, 0x8100, lsl #16
    movk    x10, 0x0
    ldr     x4, [x3, x10] // mov r10, QWORD PTR [rdi + 0xffffffff81000000] (transmission, load value from address formed by rdi + offset)
    
    b       0xdead0                       // jmp 0xdead0 (unconditional jump to 0xdead0)
