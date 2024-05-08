
data segment
    
    prompt_menu db "1] Activity 1",10,13,"2] Activity 2",10,13,"3] Activity 3",10,13,"4] Activity 4",10,13,"5] Exit",10,13,"Please Choose The Program",10,13,"You Wish To Simulate:",10,13,"$"
    prompt_input db "Please Enter Your Choice (1-4): $"
    newline db 10,13,"$"
    warning db "Invalid input! Please enter a number from 1 to 4.",10,13,"$"
    name_buffer db 20 dup(' '), "$"
    exit_message db "-- Program Exited! Goodbye! -- $"

    ; ACTIVITY 1  
    output_staircase db "Staircase Format: $"
    member1 db "Cyrus$"
    member2 db "Vianca$"
    member3 db "Jazzer$"
    member4 db "Ruth$"  
    member5 db "Rey$"
    member6 db "Tolentino$" 
                              
    ; ACTIVITY 2
    prompt_name db "Enter Your First Name: $"
    prompt_age db "Enter Your Age: $"
                              
    msgName db "Your Name is: $"
    msgAge db "Your Age is: $" 
    
    outputnameString label byte
    stringnameML db 20 
    stringnameAL db ?  
    stringnameField db 20 dup(' ')
    
    outputageString label byte 
    stringageML db 5 
    stringageAL db ? 
    stringageField db 5 dup(' ')  
    
    ; ACTIVITY 3   
    act3_msg db "--Compare Three Numbers--$"
    prompt1 db "Input the first number [LIMITED to 1 DIGIT!]: $"  
    prompt2 db "Input the second number [LIMITED to 1 DIGIT!]: $"
    prompt3 db "Input the third number [LIMITED to 1 DIGIT!]: $"
    result db " is the number with the highest value $"  
    
    ; ACTIVITY 4
    prompt_verb db "Verb: $"
    prompt_noun db "Noun: $"
    prompt_occu db "Occupation: $"
    prompt_adj db "Adjective: $"  
    
    occupation db "One day our teacher decided to quit his job and apply to be the school's $"
    adjective db ". The employer of the university however thought that he was too $"
    verb db ". So our teacher decided to $"
    noun db ", not knowing that his $"
    addToLast db " broke down, costing him the job. $" 
    
    outputOccupationString label byte
    stringOccupationML db 20 
    stringOccupationAL db ?  
    stringOccupationField db 20 dup(' ')
    
    outputAdjectiveString label byte 
    stringAdjectiveML db 20 
    stringAdjectiveAL db ? 
    stringAdjectiveField db 20 dup(' ')
     
    outputVerbString label byte 
    stringVerbML db 20 
    stringVerbAL db ? 
    stringVerbField db 20 dup(' ') 
    
    outputNounString label byte 
    stringNounML db 20 
    stringNounAL db ? 
    stringNounField db 20 dup(' ') 
             
data ends

code segment
    assume cs:code, ds:data 
    
start:
    mov ax, data
    mov ds, ax

    call display_menu
    call get_choice
    cmp al, '1'
    je activity1
    cmp al, '2'
    je activity2
    cmp al, '3'
    je activity3
    cmp al, '4'
    je activity4 
    cmp al, '5'
    je terminate_program
    jmp invalid_input

activity1:       
          
    mov ax,03h 
    int 10h  
    
    mov ah, 02h     
    int 10h          
    mov bh, 0  
    
    mov dx, offset output_staircase
    mov ah, 09h 
    int 21h 
    
    mov ah,02h
    mov dh,2
    mov dl,1
    int 10h
    
    mov ah,09h
    lea dx, member1
    int 21h
    
    mov ah,02h
    mov dh,4
    mov dl,6
    int 10h
    
    mov ah,09h
    lea dx, member2
    int 21h
    
    mov ah,02h
    mov dh,6
    mov dl,12
    int 10h
    
    mov ah,09h
    lea dx, member3
    int 21h
    
    mov ah,02h
    mov dh,8
    mov dl,18
    int 10h
    
    mov ah,09h
    lea dx, member4
    int 21h  
    
    mov ah,02h
    mov dh,10
    mov dl,22
    int 10h
    
    mov ah,09h
    lea dx, member5
    int 21h
    
    mov ah,02h
    mov dh,12
    mov dl,25
    int 10h
    
    mov ah,09h
    lea dx, member6
    int 21h 
    
    mov ah, 09h
    lea dx, newline
    int 21h 
                       
    call clear_input_buffer
    jmp end_program

activity2:
    mov ax, 03h ;clear display
    int 10h         

    mov dx, offset prompt_name
    mov ah, 09h
    int 21h
               
    mov ah, 0ah
    lea dx, outputnameString
    int 21h
        
    mov bh, 00
    mov bl, stringnameAL
    mov stringnameField[bx], "$"
    
    mov ah, 09h
    lea dx, newline
    int 21h  
    
    mov dx, offset prompt_age
    mov ah, 09h
    int 21h
        
    mov ah, 0ah
    lea dx, outputageString
    int 21h
        
    mov bh, 00
    mov bl, stringageAL
    mov stringageField[bx], "$"   
    
    mov ax, 03h 
    int 10h 
    
    mov ah, 09h
    lea dx, msgName
    int 21h
        
    mov ah, 09h
    lea dx, stringnameField
    int 21h
        
    mov ah, 09h
    lea dx, newline
    int 21h  
        
    mov ah, 09h
    lea dx, msgAge
    int 21h
        
    mov ah, 09h
    lea dx, stringageField
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h 
    
    
    call clear_input_buffer 
    jmp end_program


activity3:
         
    mov ax, 03h 
    int 10h   
    
    mov dx, offset act3_msg
    mov ah, 09h
    int 21h
    
     mov ah, 09h
    lea dx, newline
    int 21h  
    
    lea dx, prompt1
    mov ah, 09h
    int 21h
    
    mov ah, 01h 
    int 21h
    mov bh, al

    mov ah, 09h
    lea dx, newline
    int 21h  

    lea dx, prompt2
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov bl, al
      
    mov ah, 09h
    lea dx, newline
    int 21h  
    
    lea dx, prompt3
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov cl, al
      
    mov ah, 09h
    lea dx, newline
    int 21h  
    
    mov al, bh
    cmp bl, al
    jg check_cl
    
    mov al, bl
    check_cl:
    cmp cl, al
    jg greater
    
    
    jmp print_result
    
    greater:
    mov al, cl 
       
    print_result:
    mov ah, 02h
    mov dl, al
    int 21h      
    
    
    mov ah, 09h
    lea dx, result
    int 21h   
    
    mov ah, 09h
    lea dx, newline
    int 21h  
                        
    mov ah, 09h
    lea dx, newline
    int 21h  
    
    call clear_input_buffer  ; Clear input buffer
    jmp end_program
                       
                       
activity4:  
    mov ax, 3h
    int 10h 
    
    ; VERB
    mov dx, offset prompt_verb
    mov ah, 09h
    int 21h   
    
    mov ah, 0ah
    lea dx, outputVerbString
    int 21h
        
    mov bh, 00
    mov bl, stringVerbAL
    mov stringVerbField[bx], "$"
    
    mov ah, 09h
    lea dx, newline
    int 21h   
    
    ; NOUN
    mov dx, offset prompt_noun
    mov ah, 09h
    int 21h   
    
    mov ah, 0ah
    lea dx, outputNounString
    int 21h
        
    mov bh, 00
    mov bl, stringNounAL
    mov stringNounField[bx], "$"
    
    mov ah, 09h
    lea dx, newline
    int 21h   
    
    ; OCCUPATION
    mov dx, offset prompt_occu
    mov ah, 09h
    int 21h   
    
    mov ah, 0ah
    lea dx, outputOccupationString
    int 21h
        
    mov bh, 00
    mov bl, stringOccupationAL
    mov stringOccupationField[bx], "$" 
    
    mov ah, 09h
    lea dx, newline
    int 21h   
    
    ; ADJECTIVE
    mov dx, offset prompt_adj
    mov ah, 09h
    int 21h   
    
    mov ah, 0ah
    lea dx, outputAdjectiveString
    int 21h
        
    mov bh, 00
    mov bl, stringAdjectiveAL
    mov stringAdjectiveField[bx], "$" 
    
    ; CLEAR DISPLAY
    mov ax, 3h
    int 10h 
    
    ; PRINT PARAGRAPH
    mov ah, 09h
    lea dx, occupation
    int 21h
      
    mov ah, 09h
    lea dx, stringOccupationField
    int 21h  
    
    mov ah, 09h
    lea dx, adjective
    int 21h
      
    mov ah, 09h
    lea dx, stringAdjectiveField
    int 21h
    
    mov ah, 09h
    lea dx, verb
    int 21h
      
    mov ah, 09h
    lea dx, stringVerbField
    int 21h    
    
    mov ah, 09h
    lea dx, noun
    int 21h
      
    mov ah, 09h
    lea dx, stringNounField
    int 21h   
    
    mov ah, 09h
    lea dx, addToLast
    int 21h
           
           
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    call clear_input_buffer 
    jmp end_program
   

clear_input_buffer:
    mov ah, 0Ah    
    mov dx,offset name_buffer   
    int 21h   
    ret

invalid_input:
    mov dx, offset warning
    mov ah, 09h
    int 21h 
    jmp start

end_program:
    jmp start   

display_menu:
    mov dx, offset prompt_menu
    mov ah, 09h
    int 21h 
    ret


get_choice:
    mov dx, offset prompt_input
    mov ah, 09h
    int 21h 
    mov ah, 01h
    int 21h
    ret 
    
terminate_program:
  mov ax,03h ;clear display
  int 10h 
  
  mov dx, offset exit_message
  mov ah, 09h
  int 21h
    
  mov ah, 4ch 
  int 21h 
  end start
  
  
code ends
    end start
