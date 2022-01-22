
org 100h
MOV AX,0FFFFH
SAHF 
MOV AX,0000H
LAHF ;AX=D7H=1101,0110b
ret 

org 100h
; Flag, Ah, and stack
mov ah, 0ffh;
sahf;store from AH into flag   
mov ah, 00h;
lahf;load into ah from flag
pushf; pushes flag register into top of stack
ret 

mov ax, 0ffa4h; move data to reg A
sahf; to flag reg
mov ax, 0000h; clear reg A
lahf; transfer from flag reg to reg A
pushf; push to stack
end
ret

 mov AH, 0FFh
SAHF
;push flags to top of stack
PUSHF
         
;push new top of stack
PUSH 0000h      
;pop stack to flag register
POPF
END 
