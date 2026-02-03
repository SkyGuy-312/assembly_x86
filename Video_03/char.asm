; let's take keyboard input
[org 0x7c00]

; pointer to string index
mov bx, string
 
; input loop
mov cx, 0   ; loop counter
mov ah, 0
input_loop:
    cmp cx, 12
    je print          ; loop break condition
    int 0x16          ;keyboard interrupt read funciton is blocking
    mov [bx], al
    inc bx
    mov ah, 0
    inc cx
    jmp input_loop

print:
    mov ah, 0x0e
    mov cx, 0
    mov bx, string
    ; mov al, 'S'
    ; int 0x10
    jmp print_string
    jmp exit

print_string:
    cmp cx, 12
    je exit
    mov al, [bx]
    int 0x10
    inc cx
    inc bx
    jmp print_string
    
exit:
    jmp $
    

; string variable to store input
string:
    times 13 db 0

; boot signature
times 510-($-$$) db 0
dw 0xaa55