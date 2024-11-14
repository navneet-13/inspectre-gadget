nested_calls:
        bl      target_1              // Branch with link to target_1 (similar to call)
        bl      target_2              // Branch with link to target_2 (similar to call)

        ldr     x8, [x1]              // Load 8 bytes from address in x1 (rdi equivalent)
        ldrh    w9, [x1]              // Load 2 bytes from address in x1 and zero-extend to 32 bits (movzx equivalent)
        movz    x2, 0xffff, lsl #48
        movk    x2, 0xffff, lsl #32
        movk    x2, 0x8100, lsl #16
        movk    x2, 0x0
        add     x10, x9, x2  // Add offset 0x81000000 to the value in x9 and store in x10
        ldr     x10, [x10]            // Load 8 bytes from address in x10 (transmission)

        b       0xdead0               // Jump to address 0xdead0

target_1:
        ret                           // Return (this is equivalent to loading the return address and returning)

target_2:
        ret                           // Return (this is equivalent to loading the return address and returning)
