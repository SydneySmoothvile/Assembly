

org  100h

mov ax,08h; add your code here
mov bh,08h;
mov cl,08h;move 08h into the lower 8 bits of C register
mov dl,20;
mov dh,10010b;
mov [08h],10001010b;
mov bl,[08h];
mov ch,bl;


ret



