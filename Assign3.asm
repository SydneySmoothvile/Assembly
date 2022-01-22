org 100h

stc
mov ax,05
mov cx,2
mov bx,5
adc ax,cx;add with carry

cmp ax,bx
ja x1;if ax>bx jmp to x1

x1:
inc ax
xchg ax,bx
l1:
mul bx
sbb ax,bx;subtract bx from ax with borrow
Shl ax,1 ;double the value in ax

out 199,ax
ret





