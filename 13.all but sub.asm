
org 100h
 
;reg-reg
mov ax,65h
mov bx,40h
sub ax,bx
out 199,ax 
 
;reg-mem          
mov ax,80h           
mov [08AH],70h
sub ax,[08H]
out 199,ax 

;mem-immediate
mov [0AH],35h
sub [0AH],24h
mov ax,[0AH]
out 199,ax 


mov [03h],15h
mov bx,05h
sub [03h],bx
xchg ax,[03h]
out 199,ax 
   
;adding with carry
adc
   
;using sbb
stc;setting the carry
mov [03h],15h
mov bx,05h
sbb [03h],bx
xchg ax,[03h]
out 199,ax

ret




