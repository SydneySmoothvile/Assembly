org 100h

mov ax,30h
sub ax,12h
out 199,ax

; Register, Immediate
mov ax , 0AH
sub ax, 03H
;Reg, Reg
mov bx, 07H
mov cx, 03H
sub bx, cx
;Reg, memory
mov dx, 07H
mov [08H], 02H
sub dx, [08H]
;Memory, Reg
mov [09H], 05H
sub [09H], dx
;Memory, immediate
mov [0AH], 07H
sub [0AH], 02H


ret