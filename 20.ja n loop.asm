   
org 100h

mov bx,30
mov [08h],20
cmp [08h],bx
ja x1

mov cx,10
mov ax,20
L2:
dec ax
out 199,ax
loop L2
jmp exit

x1:
mov cx,10
mov ax,0
L1:
inc ax
out 199,ax
loop cx,L1
exit:


ret

     



