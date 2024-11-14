tg3_start_xmit:
    stp     x15, x14, [sp, #-16]!       // Push x15 and x14 onto the stack
    stp     x13, x12, [sp, #-16]!       // Push x13 and x12 onto the stack
    mov     x13, x0                     // r13 <- rdi (parameter 1)
    stp     x29, x30, [sp, #-16]!       // Push rbp (x29) and lr (return address) onto the stack
    mov     x29, x1                     // rbp <- rsi (parameter 2)
    sub     sp, sp, #0x58               // Allocate 0x58 bytes of stack space
    mrs     x0, tpidrro_el0             // Load thread pointer (equivalent to x86-64's `gs`)
    str     x0, [sp, #0x50]             // Store it on the stack
    mov     w0, wzr                     // eax <- 0 (zero register)
    
    add     x0, x1, #0x900              // lea rax, [rsi + 0x900]
    str     x0, [sp, #0x10]             // Store result at [rsp + 0x10]
    
    ldrh    w0, [x13, #0x7c]            // movzx eax, WORD PTR [rdi + 0x7c]
    add     x2, x0, x0, lsl #2          // lea rdx, [rax + rax*4]
    mov     x12, x2                     // r12 <- rdx
    
    add     x0, x0, x2, lsl #1          // lea rax, [rax + rdx*2]
    lsl     x0, x0, #6                  // shl rax, 0x6
    lsl     x12, x12, #6                // shl r12, 0x6
    
    ldr     x3, [x29, #0x380]           // Load QWORD PTR [rsi + 0x380]
    add     x12, x12, x3                // add r12, [rsi + 0x380]
    str     x12, [sp, #0x8]             // Store at [rsp + 0x8]
    
    add     x12, x29, x0                // lea r12, [rsi + rax + 0xa40]
    add     x12, x12, #0xa40
    
    ldr     x0, [x29, #0x1b58]          // mov rax, [rsi + 0x1b58]
    add     x2, x12, #0x2c0             // lea rdx, [r12 + 0x2c0]
    
    lsr     x0, x0, #61                 // shr rax, 0x3d
    tst     w0, #0x1                    // test al, 0x1
    csel    x12, x2, x12, ne            // cmovne r12, rdx

    ldr     w1, [x12, #0x240]           // mov esi, DWORD PTR [r12 + 0x240]
    ldr     w2, [x12, #0x248]           // mov edx, DWORD PTR [r12 + 0x248]
    ldr     x3, [x13, #0xc8]            // mov rdi, QWORD PTR [rdi + 0xc8]
    
    mov     w0, w1                      // mov eax, esi
    ldr     w4, [x12, #0x244]           // Load DWORD PTR [r12 + 0x244]
    sub     w0, w0, w4                  // eax <- esi - [r12 + 0x244]
    and     w0, w0, #0x1ff              // and eax, 0x1ff
    sub     w2, w2, w0                  // edx <- edx - eax

    ldr     w0, [x13, #0xc0]            // mov eax, DWORD PTR [r13 + 0xc0]
    str     w2, [sp, #0x4c]             // Store edx at [rsp + 0x4c]
    
    add     x0, x0, x3                  // rax <- rax + rdi
    ldrb    w1, [x0, #0x2]              // Load BYTE PTR [rax + 0x2] zero-extended to w1
    add     w1, w1, #1                  // ecx <- ecx + 1
    cmp     w1, w2                      // cmp ecx, edx
    b       0xdead0                     // Unconditional branch to 0xdead0
