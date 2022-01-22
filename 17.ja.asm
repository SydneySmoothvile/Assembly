
org 100h

mov ax,10
mov bx,12
cmp ax,bx
ja x1;if ax>bx go to X1 else continue
add ax,1
out 199,ax
jmp exit
x1:
dec ax
out 199,ax
exit:

ret




