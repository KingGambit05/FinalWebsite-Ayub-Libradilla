include 'emu8086.inc'
.data
    menu db "[Activity 1] Staircase ", 13, 10, "[Activity 2] User Info", 13, 10, "[Activity 3] Highest Value", 13, 10, "[Activity 4] Madlibs", 13, 10, "[Activity 5] Solar System Questions", 13, 10, "[Activity 6] Adding Two Numbers $"
    prompt1 db "Please Select", 13, 10, "The Program you want to simulate: $"                                                                                                                                                                               
    
    
    msg2 db 13, 10, 13, 10, "Section -> BSCS 2A $"
    msgerror db "=====Wrong Input=====", 13, 10, "$" 
    
    ;activity 1 - STAIRCASE
    transformersMembers DB "Alpez", 10, "Akilan", 10, "Ayub", 10, "Libradilla", 10, "Rosco", 10, "Ambula", 10
    
    ;activity 2 - USER INFO
    promptName db "Input Your Name!: $"
    msgName db "Your Name is: $" 
    
    promptAge db 13, 10, "Input Your Age!: $"
    msgAge db 13, 10, "Your Age is: $" 
     
    outputnameString label byte 
    stringnameML db 20 
    stringnameAL db ?  
    stringnameField db 20 dup(' ') 
    
    outputageString label byte
    stringageML db 5 
    stringageAL db ?  
    stringageField db 5 dup(' ') 
    
    ;activity 3 - HIGHEST VALUE
    act3Prompt1 db "Input the first number [LIMITED to 1 DIGIT!]: $" 
    act3input1 db ?, "$" 
    act3Prompt2 db 13, 10, "Input the second number [LIMITED to 1 DIGIT!]: $" 
    act3input2 db ?, "$"
    act3Prompt3 db 13, 10, "Input the third number [LIMITED to 1 DIGIT!]: $" 
    act3input3 db ?, "$"  
    act3Res db 13, 10, 13, 10, "The highest value is -> $" 
    
    ;activity 4 - MADLIBS
    act4prompt1 db "Noun: $"
    act4prompt2 db 13, 10, "Verb: $" 
    act4prompt3 db 13, 10, "Adjective: $"
    act4prompt4 db 13, 10, "Occupation: $"

    nounString label byte ;Variable for noun string output
    nounML db 50 ;Max Length for the string 
    nounAL db ? ;Actual Length of the string 
    nounField db 50 dup(' ') ;Input Field 
    
    verbString label byte ;Variable for verb string output
    verbML db 50 ;Max Length for the string 
    verbAL db ? ;Actual Length of the string 
    verbField db 50 dup(' ') ;Input Field  
    
    adjString label byte ;Variable for adjective string output
    adjML db 50 ;Max Length for the string 
    adjAL db ? ;Actual Length of the string 
    adjField db 50 dup(' ') ;Input Field 
    
    occString label byte ;Variable for occupation string output
    occML db 50 ;Max Length for the string 
    occAL db ? ;Actual Length of the string 
    occField db 50 dup(' ') ;Input Field 
    
    madlibP1 db 13, 10, 13, 10, "A mischievous grin spread across the $"
    madlibP2 db "'s face as they prepared to $"
    madlibP3 db " bucket of $"
    madlibP4 db " spaghetti onto the unsuspecting $"
    madlibP5 db " below. The annual town prank war was in full swing, and no one was safe from the ensuing chaos and laughter.$"
    
    ;activtity 5 - SOLAR SYSTEM QUESTIONS
    act5prompt1 db "Your Answer is: $" 
    act5prompt2 db "To proceed to the final question you must have atleast scored 3 points!", 13, 10, "$" 
    
    act5q1 db "What is the largest planet in our solar system?", 13, 10, 13, 10, "$"  
    act5q2 db "Which planet in our solar system has massive rings that are easily visible with a small telescope??", 13, 10, 13, 10, "$" 
    act5q3 db "Did you know that there is a planet that spins on its side? Which planet is it?", 13, 10, 13, 10, "$"
    act5q4 db "During the day this planet gets hot enough to melt lead, but at night the temperature drops to -290°F?", 13, 10, 13, 10, "$"
    act5q5 db "How many planets are there in the Solar System?", 13, 10, 13, 10, "$"
                      
    act5Score db ?
    
    ;activity 6 - ADDING TWO NUMBERS
    act6prompt1 db "Input 1ST Value: $"  
    act6prompt2 db 13, 10, "Input 2ND Value : $" 
    act6res db 13, 10, "The result is: $"
    
.code
    start:
    mov ax, @DATA
    mov ds, ax
    
    menuu:
    mov dx, offset menu        ;Display menu
    mov ah, 09h
    int 21h
    
    mov ax, 1003h
    mov bx, 0
    int 10h 
    
    mov ah, 02h
    mov dh, 7
    mov dl, 10
    int 10h
    lea dx, prompt1 
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bl, al 
    
    mov bh, 054 ; assign 050 which is 6 in Ascii code (middle)
    
    cmp bl, bh
    mov ax, 3h
    int 10h
    je activity6    ;if 6 = display activity 6
    ja retryinput  ; if >6 =display the menu again
    jb decrement1  ; if 5 = else statement if below 6
    
    retryinput:
    mov ah, 09h
    lea dx, msgerror
    int 21h
    jmp menuu
     
    decrement1:
    add bh, -2  ;this will make the value 4
    cmp bl, bh
    je activity4    ; if 4 = display activity 4
    ja activity5  ; if 5 = display the activity 5
    jb decrement2  ; if 3 = else statement if below 4
    
    decrement2:
    add bh, -2  ;this will make the value 2
    cmp bl, bh
    je activity2    ; if 2 = display activity 2
    ja activity3  ; if 3 = display the activity 3
    jb decrement3  ; if 1 = else statement if below 2   
    
    decrement3:
    add bh, -2  ;this will make the value 0
    cmp bl, bh
    je retryinput    ; if <1 = display the menu again
    ja activity1  ; if 1 = display the activity 1 
    
    activity6: 
    printn '-Adding 2 numbers-' 
    
    again:
    mov dx, offset act6prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    mov dx, offset act6prompt2
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bl, al  
    
    add bh, bl 

    sub bh, 30h  
    lea dx, act6res
    mov ah, 09h
    int 21h
    
    mov ah, 02h    ;display result
    mov dl, bh
    int 21h

    jmp exit
    
    activity5:
    printn '-Solar System Questions-' 
    
    mov ax, 3h
    int 10h
    
    mov dx, offset act5q1   ;Display 1st Question
    mov ah, 09h
    int 21h
    
    printn '1] Saturn'
    printn '2] Jupiter' 
    
    lea dx, act5prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    mov bl, 050  
    cmp bl, bh  
    
    je addpoints
    jne continue
    
    addpoints:
    mov act5Score, 049 
    
    continue:   
    mov ax, 3h
    int 10h
    
    lea dx, act5q2    ;Display 2nd Question
    mov ah, 09h
    int 21h
    
    printn '1] Mercury'
    printn '2] Saturn'
    
    lea dx, act5prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al 
    
    mov bl, 050  ;correct answer
    cmp bl, bh  
    
    je addpoints1
    jne continue1
    
    addpoints1:
    mov act5Score, 050
    
    continue1:
    mov ax, 3h
    int 10h
    
    lea dx, act5q3    ;Display 3rd Question
    mov ah, 09h
    int 21h 
    
    printn '1] Uranus'
    printn '2] Mars'   
    
    lea dx, act5prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    mov bl, 049  ;correct answer
    cmp bl, bh  
    
    je addpoints2
    jne continue2
    
    addpoints2:
    mov act5Score, 051    ;add score if correct
    
    continue2:
    mov ax, 3h
    int 10h
    
    lea dx, act5q4    ;Display 4th Question
    mov ah, 09h
    int 21h 
    
    printn '1] Mercury'
    printn '2] Neptune'
    
    lea dx, act5prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    mov bl, 050  ;correct answer
    cmp bl, bh  
    
    je addpoints3
    jne continue3
    
    addpoints3:
    mov act5Score, 052
    
    continue3: 
    mov ax, 3h
    int 10h
    
    lea dx, act5prompt2
    mov ah, 09h
    int 21h
    
    print 'Press ENTER to proceed!'
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    mov bl, act5Score 
    mov bh, 051
    
    cmp bh, bl
    
    jl finalq
    jge bye
    
    finalq:
    mov ax, 3h
    int 10h
    
    lea dx, act5q5    ;Display 5th Question
    mov ah, 09h
    int 21h 
    
    printn '1] 8'
    printn '2] 7'
     
    lea dx, act5prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bh, al
    
    
    bye:
    mov ax, 3h
    int 10h
    
    print 'Thank you for playing!'     
    jmp exit
      
    
    activity4:
    mov dx, offset act4prompt1
    mov ah, 09h
    int 21h
    
    ;Retrive Keyboard input
    mov ah, 0ah
    lea dx, nounString
    int 21h
        
    mov bh, 00
    mov bl, nounAL
    mov nounField[bx], "$" 
    
    lea dx, act4prompt2
    mov ah, 09h
    int 21h
    
    mov ah, 0ah
    lea dx, verbString
    int 21h
        
    mov bh, 00
    mov bl, verbAL
    mov verbField[bx], "$"
    
    lea dx, act4prompt3
    mov ah, 09h
    int 21h
    
    mov ah, 0ah
    lea dx, adjString
    int 21h
        
    mov bh, 00
    mov bl, adjAL
    mov adjField[bx], "$"
    
    lea dx, act4prompt4
    mov ah, 09h
    int 21h
    
    mov ah, 0ah
    lea dx, occString
    int 21h
        
    mov bh, 00
    mov bl, occAL
    mov occField[bx], "$"
        
    mov ah, 09h
    lea dx, madlibP1
    int 21h
    lea dx, nounField
    int 21h
    lea dx, madlibP2
    int 21h
    lea dx, verbField
    int 21h  
    lea dx, madlibP3
    int 21h
    lea dx, adjField
    int 21h    
    lea dx, madlibP4
    int 21h
    lea dx, occField
    int 21h 
    lea dx, madlibP5
    int 21h
    
    jmp exit
 
    activity3:
    ;print 1st prompt
    mov dx, offset act3Prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h 
    int 21h
    mov act3Input1, al  ;store the first input
     
    lea dx, act3Prompt2
    mov ah, 09h
    int 21h
     
    mov ah, 01h 
    int 21h 
    mov act3Input2, al 
    
    lea dx, act3Prompt3
    mov ah, 09h
    int 21h
    
    mov ah, 01h 
    int 21h
    mov act3Input3, al
    
    mov bh, act3Input1
    mov bl, act3Input2
    
    cmp bh, bl        ;compare both input 1 & 2
    
    jge comparison1
    jb comparison4
    
    comparison1:
    mov bl, act3Input3
    cmp bh, bl 
    jge comparison2
    jb comparison3
    
    comparison4:
    mov bh, act3Input3
    cmp bl, bh 
    jb comparison2
    jge comparison3
    
    ;diplays the results
    comparison2:
    mov ah, 09h
    lea dx, act3Res
    int 21h
    
    mov ah, 02h
    mov dl, bh
    int 21h
    jmp exit
    
    comparison3:
    mov ah, 09h
    lea dx, act3Res
    int 21h
    
    mov ah, 02h
    mov dl, bl
    int 21h 
    jmp exit
    
    activity2:
    ;Display prompt for Name
    mov dx, offset promptName
    mov ah, 09h
    int 21h
        
    ;Retrive Keyboard input
    mov ah, 0ah
    lea dx, outputnameString
    int 21h
        
    mov bh, 00
    mov bl, stringnameAL
    mov stringnameField[bx], "$"
        
    ;Display prompt for Age
    lea dx, promptAge
    mov ah, 09h
    int 21h
        
    ;Retrive Keyboard input
    mov ah, 0ah
    lea dx, outputageString
    int 21h
        
    mov bh, 00
    mov bl, stringageAL
    mov stringageField[bx], "$"
        
    mov ax, 3h
    int 10h
        
    mov ah, 09h
    lea dx, msgName
    int 21h
        
    mov ah, 09h
    lea dx, stringnameField
    int 21h
        
    mov ah, 09h
    lea dx, msgAge
    int 21h
        
    mov ah, 09h
    lea dx, stringageField
    int 21h
    
    jmp exit
    
    activity1:  
    lea dx, transformersMembers
    mov ah, 09h
    int 21h      
    jmp exit  

    exit:
    mov ah, 0
    int 16h
    mov ah, 4ch
    int 21h
    
    end start


    