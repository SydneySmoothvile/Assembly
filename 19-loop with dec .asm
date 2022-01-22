
org 100h

mov cx,10
mov ax,15
L1:
dec ax
out 199,ax
loop L1

ret




