
org 100h

mov bx,5
mov ax,0

L1:;loop
inc ax
out 199,ax 

loop bx,L1;output is 1

ret




