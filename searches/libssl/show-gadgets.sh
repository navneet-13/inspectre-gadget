#!/bin/bash

for uuid in $(cat exploitable-gadgets.log | cut -d '|' -f1); do
    ../../inspectre show out/combined_asm $uuid
    read -p "Press enter to continue"
done
