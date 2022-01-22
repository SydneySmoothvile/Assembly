
org 100h

stc
mov ax,05
mov cx,2 
mov bx,5
adc ax,cx

cmp ax,bx
ja x1:

x1:
inc ax 
xchg ax,bx
l1:
mul bx
sbb ax,bx


out 199,ax
ret




