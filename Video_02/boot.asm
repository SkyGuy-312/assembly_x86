; teletype mode
mov ah, 0x0e

; print 'A'
mov al, 'A'

; call bios interrupt
int 0x10

jmp print_char

;let's try and print the alphabet

; loop
print_char:
    inc al
    cmp al, 'Z' + 1
    je exit
    int 0x10
    jmp print_char

; exit function
exit:
    jmp $

; Padding:
; $ is the current address, $$ is the start address of the code
; We need to fill the rest of the 512-byte sector with 0s up to byte 510
times 510-($-$$) db 0

; Boot Signature:
; The last two bytes must be 0x55 and 0xAA for the BIOS to recognize this as bootable
db 0x55, 0xaa