.model small 

.data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

header DB "- Assembly Exam -",0Dh,0Ah
       DB "*****************",'$' 
       
NEWLINE    DB 10,13,"$"
      
yes_or_no  DB 0Dh,0Ah,0Dh,0Ah,"Enter y or n",0Dh,0Ah,10,13,'$'
q1         DB "Assembly is a low level programming language? ",'$'
q2         DB 0Dh,0Ah,"Array are not used in Assembly language? ",'$'
q3         DB 0Dh,0Ah,"Number can be signed or unsigned? ",'$' 
correct    DB 0Dh,0Ah,"Number of correct answers are: ",'$'
allright   DB 0Dh,0Ah,"All your answer are correct",0Dh,0Ah,'$'
noright    DB 0Dh,0Ah,"No right answer",'$'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.code
;;;;;;;;;;;;;;;; Printing Function;;;;;;;;;;;;;;;;;;;;;
PRINT macro msg
    
    pusha
    pushf
      
    LEA DX,msg  
    MOV AH,09H
    INT 21H
    
    popf
    popa  
    
    endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       
main proc
    
    mov ax,@data
    mov ds,ax
    
    PRINT header
    PRINT NEWLINE
    PRINT yes_or_no
     
    mov bl, 0       ;to track correct answer
    
    PRINT q1
    call UserInputY
    PRINT q2
    call UserInputN
    PRINT q3
    call UserInputY
    PRINT NEWLINE
    PRINT correct

    
    ;print number of correct answers 
    mov cl, bl
    add bl, 48     ; number to ascii conversion
    MOV ah,02H
    mov dl,bl
    INT 21H
    PRINT NEWLINE
      
    cmp cl ,3
    je allok
    cmp cl ,0
    je notallok
    jne ToEnd 
    
      
    allok:
    PRINT allright
    jmp ToEnd
    
    notallok:
    PRINT noright
    jmp ToEnd
       
         
    main endp
jmp ToEnd
              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UserInputY proc
    
    mov ah, 1
    int 21h
    cmp al, 'y'
    je incrementBL
        
    ret     
    UserInputY endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UserInputN proc
    
    mov ah, 1
    int 21h
    cmp al, 'n'
    je incrementBL
        
    ret     
    UserInputN endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
incrementBL proc
    
    inc bl  ; correct answer for q1
    
    ret  
    incrementBL endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ToEnd:
.Exit
END
