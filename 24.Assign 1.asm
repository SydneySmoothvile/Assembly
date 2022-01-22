
org 100h


MOV BX,05H
MOV CX,03H
MOV DX,045H

MOV AH,0FFH
SAHF;takes the content of the ah to flag register x OF,IF,DF-reserved
MOV AH,00H
LAHF;

NEG AX 
call p1
add ax,bx
OUT 199,AX
ret
p1 proc
    sub bx,1
    out 199,ax 


ret


;SF,ZF,0,AF,0,PF,1,CF

