org 100h
mov ax,12
mov bx, 5
call X1
out 199, ax
ret
X1 proc
    mul bx
    add ax, 1
ret


