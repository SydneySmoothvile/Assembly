
org 100h

mov cx,10
mov ax,5

L1:
add ax,10
out 199,ax
loop cx L1


ret




