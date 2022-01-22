org 100h
STC
mov ax,12
mov bx, 5
call X1
out 199, ax
ret
X1 proc
    mul bx
    add ax, 1

mov cx,65
cmp ax,cx
ja x2

mov cx,10
mov dx,20
L2:
dec ax
out 199,ax
loop L2
jmp exit


x2:
xchg ax,cx
L1:
div bx
out 199,ax
loop cx,L1
exit:

ret


