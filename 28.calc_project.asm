;123700 Abuya, Sydney Bradley
;121789 Njagi, Caleb Ngugi
;120689 Sumba, Kathlene Adogo
;124090 Lydia Nyawira
;122785 Ian Okova
org  100h
.DATA
    msg1 DB 0AH,0DH, "Enter first  Number :  $"                                       
    msg2 DB 0AH,0DH, "Enter second Number :  $"          
                                                       
    msg3 DB 0AH,0DH, "Enter operator (+,-,*,/,%,^) :  $"
    result DB 0AH,0DH, "Result is : $"
    proj  DB 0AH,0DH,   "                   --------------- SEM PROJECT -------$"
    myname  DB 0AH,0DH, "                   --------------- CADS ---------------$"
    reg_no  DB 0AH,0DH, "                   --------------- 123456789 ----------------$"
    section  DB 0AH,0DH,"                   ---------------- ICS 3A -----------------$"
    done  DB 0AH,0DH, "---------------------------------$"
    done2  DB 0AH,0DH, "****************************$"
    invalid_message DB 0AH,0DH, "INVALID INPUT$"    
    num1 dw 00h
    num2 dw 00h
    overflow db 00h
   
.CODE

include 'emu8086.inc'
LEA DX,done2            
MOV AH,09H              
INT 21H                 
LEA DX,proj             
MOV AH,09H  ;display string            
INT 21H                 
LEA DX,myname           
MOV AH,09H              
INT 21H                 
LEA DX,reg_no           
MOV AH,09H              
INT 21H                 
LEA DX,section          
MOV AH,09H              
INT 21H                 
LEA DX,done2            
MOV AH,09H             
INT 21H                 
            
            
 calc:
    MOV AX,@DATA            ;to move the address of DATA in AX
    MOV DS,AX               ;initializing data segment(DS)  

    CALL input              
     CALL parser             
    CALL operation          
    
    MOV [SI],'&'            ;To label the end of result in Data Segment
    
    call reverse_parser
    call print_result       
 input  PROC                                    
        MOV [SI],'&'        
        LEA DX,msg1         
        MOV AH,09H          
        INT 21H             

        input1:          
                MOV AH,01H          ;to read from the keyboard
                INT 21H             
                CMP AL,13d          ;To check wether enter is pressed or not
                JZ  print_message2  ;Jump to second input if enter is pressed
                MOV AH,AL
                SUB AH,'0'          ;Comparing entered number (0<X<9)
                JC invalid          ;jump to invalid if number operator is NOT between 0 to 9
                MOV AH,AL
                MOV DH,'9'
                SUB DH,AH           ;Comparing entered number (0<x<9)
                JC invalid          ;jump to invalid if number operator is NOT between 0 to 9
                SUB AL,'0'          
                INC SI              
                MOV [SI],AL         ;Store at incremented SI
                JMP input1          ;Jump to input1 if enter is not pressed   
                
               
                
        print_message2:
                INC SI              
                MOV [SI],'&'        ;To mark end of input2 in segment
                LEA DX,msg2         ;to print message2
                MOV AH,09H          ;To display character string
                INT 21H             ;call DOS function
                                   
        input2:
                MOV AH,01H          ;to read from the keyboard
                INT 21H             ;call DOS function
                CMP AL,13d  ;To check wether enter is pressed or not
                JZ exit             ;Jump to exit if enter is pressed
                MOV AH,AL
                SUB AH,'0'  ;
                JC invalid          ;jump to invalid if number operator is NOT between 0 to 9
                MOV AH,AL
                MOV DH,'9'
                SUB DH,AH;Comparing entered number (0<x<9)
                JC invalid          ;jump to invalid if number operator is NOT between 0 to 9
                SUB AL,'0'          ;Subtract ASCII of 0 to convert from character to number
                INC SI              
                MOV [SI],AL         ;Store at incremented SI
                JMP input2          ;Jump to input2 if enter is not pressed
        exit:              
                ret
                
       invalid: LEA DX,invalid_message;To display invaid message
                MOV AH,09H          ;To display character string
                INT 21H             ;call DOS function
                hlt
 ENDP                               ;input proc
 


 parser PROC                        ;
 
                MOV CX,01d          
                MOV BX,00H           
                
        parse2:  
                MOV AX,00H          
                MOV AL,[SI]         ;Copy the digit stored at SI to AL
                MUL CX              ;Multiplying AX by CX
                ADD BX,AX           
                MOV AX,CX           ;copy CX into AX
                MOV CX,10d          ;moving value 10 in CX
                MUL CX              ;Multiplying AX by CX  
                MOV CX,AX           ;copy AL into CX (for increamenting decimal position
                DEC SI              
                CMP [SI],'&'        ;If reached end of number2 (input2)
                JNZ parse2          ;Jump to parse1 if not reached at the end of (input2)
                
                MOV [num2],BX       ;store the parsed number2 at num2
                MOV BX,00H                   
                MOV DX,00h          
                DEC SI              
                MOV CX,01d          
                
         parse1:  
                MOV AX,00H          
                MOV AL,[SI]         ;Copy the digit stored at SI to AL
                MUL CX              
                ADD BX,AX           
                MOV AX,CX           
                MOV CX,10d          
                MUL CX              
                MOV CX,AX           
                DEC SI              ;
                CMP [SI],'&'        ;If reached end of number1 (input1)
                JNZ parse1          ;Jump to parse2 if not reached at the end of (input1)
                
                MOV [num1],BX       ;store the parsed number1 at num1
                MOV AX,[num1]       ;store the parsed number1 in AX
                MOV BX,[num2]       ;store the parsed number2 in BX
                 
                
        ret                                                                                                     
 ENDP                               
       
       
 operation proc                     
               MOV CX,AX            
               LEA DX,msg3          ;to print message3
               MOV AH,09H           ;To display string
               INT 21H              
                
                
               MOV AH,01H           ;to read from the keyboard
               INT 21H              
               
               CMP AL,'+'           ;Comparing entered operator with '+'
               JZ addition          ;jump to addition if entered operator is '+'
               
               CMP AL,'-'           ;Comparing entered operator with '-'
               JZ subtraction       ;jump to subtraction if entered operator is '-'
               
               CMP AL,'*'           ;Comparing entered operator with ''
               JZ multiplication    ;jump to multiplication if entered operator is '*'
               
               CMP AL,'/'           ;Comparing entered operator with '/'
               JZ division          ;jump to division if entered operator is '/'
               
               CMP AL,'%'           ;Comparing entered operator with '%'
               JZ mod               ;jump to mod if entered operator is '%'
               
               CMP AL,'^'           ;Comparing entered operator with '^'
               JZ pow               ;jump to pow if entered operator is '^'
           
               LEA DX,invalid_message;To display invaid message (If NOT '+' , '-' , '*' , '/' , '^')
               MOV AH,09H           ;To display character string
               INT 21H              ;call DOS function
           hlt
       
       addition:
                MOV AX,CX           ;copy number1 to AX from CX
                MOV DX,00h          ;moving 00h in DX
                ADD AX,BX           ;adding with number2 and storing the result in AX
                ADC AX,DX           ;adding CF to AX and storing the result in AX
                OUT 199,AX
                RET
       subtraction:
                MOV AX,CX           ;copy number1 to AX from CX
                SUB AX,BX           ;subtracting number2 from number1 into AX
                OUT 199,AX
                JC ov
                JNC nov
               ov:
                NEG AX
                OUT 199,AX
                MOV [overflow],01h
                OUT 199,AX
                RET
                
               nov:RET
                OUT 199,AX
                
       multiplication:
                MOV AX,CX           ;copy number1 to AX from CX
                MOV DX,00H          ;moving 00h in DX
                MUL BX
                OUT 199,AX              ;multiplying number1 by number2 INTO AX
                RET
       division:
                MOV AX,CX           ;copy number1 to AX from CX
                MOV DX,00H          ;moving 00h in DX
                ADD BX,DX
                JZ DbyZ
                DIV BX              ;dividing number1 by number2 and storing the result in AX
                OUT 199,AX
                RET
         DbyZ:  print '   ERROR : DIVIDE BY ZERO'
                JMP calc
       mod:
                MOV AX,CX           ;copy number1 to AX from CX
                MOV DX,00H          ;moving 00h in DX
                ADD BX,DX
                JZ DbZ
                DIV BX              ;dividing number1 by number2 and storing the result in AX
                MOV AX,DX           ;moving remainder in AX from DX  
                OUT 199,AX
           DbZ: RET
       pow:
                MOV AX,CX           ;copy number1 to AX from CX
                MOV CX,BX           ;initializing CX with BX(number2)
                ADD CX,00h          ;
                JZ Lc   
                SUB CX,01h          
                JZ La               ;if CX = 0 ,jump to La
                JNZ Lb              ;if CX != 0 ,jump to Lb
                OUT 199,AX
           La:  ret                                       
           Lb:  MOV BX,AX           ;moving value of AX in BX
                MOV DX,00h          ;moving 00h in DX
           L1:  MUL BX              ;multiplying number1 by number1 and storing the result in AX
                LOOP L1             ;jump to L1 untill CX != 0
                OUT 199,AX
                ret
           Lc:  MOV AX,01h
                OUT 199,AX
                ret                                     
                                  
 ENDP                               


                
 reverse_parser PROC                
     
        r_parse:
                MOV DX,00h          
                MOV BX,10d            
                DIV BX                
                ADD DL,'0'             

                INC SI             
                MOV [SI],DL            
                ADD AX,00h             
                JNZ r_parse              
                           
            
 ENDP                               
 
 print_result PROC                  
              
              LEA DX,result         
              MOV AH,09H            
              INT 21H
                            
              MOV CL,01h            
              CMP CL,[overflow]       
              MOV [overflow],00h
              JZ print_minus        
              JNZ print
              
                 
 print_minus: MOV DL,'-'             
              MOV AH,02H            
              INT 21H
              
                                       
 
print:
              MOV DL,[SI]  ;Loads ascii of digit from DS:[SI]         
              MOV AH,02H  ;To display value in DL          
              INT 21H
                          
              DEC SI                
              CMP [SI],'&' ;end of result and jumps to next line
              JNZ print;if not end jump to print
              ;mov AL,DL
              ;OUT 199,AX;output on LED
              
                        
              LEA DX,done           
              MOV AH,09H            
              INT 21H
            JMP calc  ;Restarting the calculator
 
 ENDP
 ret
ret
