org 100h

mov ax,'rp'
mov [0abh], 0001111b
xchg ax,[0abh]
mov bx,[0abh]  

out 199,ax;
ret