MOV AX, 101b
MOV [08H], 110b
ADD AX, [08H]
OUT 199, AX


MOV [08H], 11B
mov [09H], 100B
mov ax, [08H]
mov bx, [09H]
add ax, bx
out 199, ax


;memory register
MOV AX, 055H
MOV [08H], 067H
ADD [08H], AX
MOV AX, [08H]
OUT 199, AX


mov bx, 10
mov ax, [08h]
add ax, bx
out 199, ax