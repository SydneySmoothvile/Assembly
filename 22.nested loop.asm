
org 100h

mov cx,5
mov ax,0
l1:
inc ax
push cx
mov cx,3
l2:
inc ax
out 199,ax
loop cx l2
pop cx
loop cx l1

ret




