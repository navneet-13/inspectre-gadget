tfp_multiple_bb:
    ldr     x8, [x0]                        // Load QWORD from [rdi] into x8 (r8 <- [rdi])
    cmp     x0, #0                           // Compare rax (x0 in AArch64) with 0
    beq     tfp0                             // If zero (eq), branch to tfp0
    b       tfp1                             // Unconditional branch to tfp1

tfp0:
    movz    x2, 0xffff, lsl #48
    movk    x2, 0xffff, lsl #32
    movk    x2, 0x8100, lsl #16
    movk    x2, 0x0
    ldr     x10, [x8, x2]  // Load QWORD from [r8 + 0xffffffff81000000] into x10
    b       __aarch64_indirect_thunk_array  // Branch to __aarch64_indirect_thunk_array

tfp1:
    ldr     x10, [x0, #-0x10]                // Load QWORD from [rdi - 0x10] into x10 (r10 <- [rdi-0x10])
    ldr     x11, [x10]                       // Load QWORD from [r10] into x11
    b       __aarch64_indirect_thunk_array  // Branch to __aarch64_indirect_thunk_array

__aarch64_indirect_thunk_array:
    b       0xdead0                          // Branch to 0xdead0 (equivalent to `jmp 0xdead0`)
