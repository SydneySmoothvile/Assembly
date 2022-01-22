
org 100h

org 100h
mov bx,34
mov ax,23
call P1
add ax,bx
out 199,ax
ret
P1 PROC
    ADD ax,9
    OUT 199,ax
ret


ret




