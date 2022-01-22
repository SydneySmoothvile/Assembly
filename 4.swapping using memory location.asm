org 100h

;mov [0ah],30h
;mov ax,23h
;mov 
;mov ch,bl;   bl and ch
;mov [0ah], bl; move what is in bl and place it in the memory address 
;mov bl,ch;  move into bl what is in ch
;mov ch,[08h]; move into ch what is in the memory address

mov bx, 2ah
mov cx, 3bh
mov [08h], bx 
mov bx, cx
mov cx, [08h]

ret