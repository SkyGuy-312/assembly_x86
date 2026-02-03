; let's print some string
; setting memory address origin to 0x7c00
[org 0x7c00]

mov ah, 0x0e
mov bx, string
mov al, [bx]
int 0x10
jmp loops

loops:
    inc bx
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    jmp loops

exit:
    jmp $

string:
    db "Hello, World!\n", 0

times 510-($-$$) db 0
dw 0xaa55
