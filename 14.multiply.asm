
org 100h

;multiply
mov ax,10
mov bx,15
mul bx
out 199,ax

mov ax,10
mov [09h],12
mul [09h]
out 199,ax

ret


;A+B-(C*D) 
;program to calculate the acceleration of an object


