; Infinite loop: jumps to the current address ($), effectively hanging the system
jmp $

; Padding:
; $ is the current address, $$ is the start address of the section
; We need to fill the rest of the 512-byte sector with 0s up to byte 510
times 510-($-$$) db 0

; Boot Signature:
; The last two bytes must be 0x55 and 0xAA for the BIOS to recognize this as bootable
db 0x55, 0xaa