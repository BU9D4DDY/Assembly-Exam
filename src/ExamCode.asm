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
