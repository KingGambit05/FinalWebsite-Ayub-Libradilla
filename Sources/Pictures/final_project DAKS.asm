; Group DAKS

.MODEL small
.STACK

.DATA
    new_line DB 10, 13, "$"
    menu_str DB "1] Staircase Names", 13, 10, "2] User Info", 13, 10, "3] Highest Value", 13, 10, "4] Madlibs", 13, 10, "5] Palindrome Checker", 13, 10, "6] Reverse Print", 13, 10, "Q] Quit", 13, 10, 13, 10, 13, 10, "Please Choose the Program You Wish to Simulate: $"
    invalid_input_str DB "Options are from 1-6 only, please try again!", 10, 13, "$"
    wait_str DB "Press any key to continue!$"
    end_msg DB "Thank you for using our program!$"
    
    ; activity 1 - staircase
    members_names DB "Alas-as", 10, "Dangaran", 10, "Esteban", 10, "Mayran", 10, "Nu", 241, "ez", 10, 13, "$"
 
    ; activity 2 - user info  
    input_name_str DB "Input your name: $"
    input_age_str DB "Input your age: $"
    result_str DB "Name: $", "Age: $"
    
    first_name LABEL BYTE
    first_name_ml DB 20
    first_name_al DB ?
    first_name_field DB 20 DUP(' ')
    
    age LABEL BYTE
    age_ml DB 10
    age_al DB ?
    age_field DB 10 DUP(' ')
    
    ; activity 3 - highest value
    act_3_input_str DB "Input value: $"
    act_3_result_str DB "Highest value: $"
    act_3_highest_value DB 0
    
    ; activity 4 - madlibs
    input_noun_str DB "Input Noun: $"
    input_verb_str DB "Input verb: $"
    input_adj_str DB "Input adjective: $"
    
    noun_1 LABEL BYTE
    noun_1_ml DB 20
    noun_1_al DB ?
    noun_1_field DB 20 DUP(' ')
    
    noun_2 LABEL BYTE
    noun_2_ml DB 20
    noun_2_al DB ?
    noun_2_field DB 20 DUP(' ')
    
    verb LABEL BYTE
    verb_ml DB 20 
    verb_al DB ?
    verb_field DB 20 DUP(' ')
    
    adjective LABEL BYTE
    adjective_ml DB 20
    adjective_al DB ?
    adjective_field DB 20 DUP(' ')
    
    madlib DB "Last night I had a dream that a $", " was trying to $", " my $", ".", 10, 13, "I woke up $", "!", 10, 13, "$"
    
    ; activity 5 - palindrome checker
    act5_title DB "[Palindrome Checker]", 10, 13, "$"
    act5_enter_msg DB "Enter word: $"
    act5_is_palindrome_msg DB "The word is a palindrome!", 10, 13, "$"
    act5_not_palindrome_msg DB "The word is not a palindrome!", 10, 13, "$"
    
    act5_word LABEL BYTE
    act5_word_ml DB 100
    act5_word_al DB ?
    act5_word_field DB 100 DUP(' ')
    
    ; activity 6 - reverse print
    act6_title DB "[Reverse Word Printer]", 10, 13, "$"
    act6_enter_msg DB "Enter Word: $"
    act6_result_msg DB "Reversed Word: $"
    
    act6_word LABEL BYTE
    act6_word_ml DB 100
    act6_word_al DB ?
    act6_word_field DB 100 DUP(' ')   
    
.CODE
start:
    ; move variables to program
    MOV AX, @DATA
    MOV DS, AX

main_menu:
    ; clear console
    MOV AX, 03H
    INT 10H
    
    ; Output menu
    LEA DX, menu_str
    MOV AH, 09H
    INT 21H
    
    ; Get option from menu
    MOV AH, 01H
    INT 21H
    
    ; compare user option and go to the selected activity
    CMP AL, '1'
    JE activity_1
    
    CMP AL, '2'
    JE activity_2
    
    CMP AL, '3'
    JE activity_3
    
    CMP AL, '4'
    JE activity_4
    
    CMP AL, '5'
    JE activity_5
    
    CMP AL, '6'
    JE activity_6

    ; quit option 
    CMP AL, 'q'
    JE end_program
    CMP AL, 'Q'
    JE end_program   
    
    ; handle invalid option
    MOV AX, 03H
    INT 10H

    LEA DX, invalid_input_str
    MOV AH, 09H
    INT 21H
    
    ; proceed to wait_main_menu
    
; wait for user input before going back to main menu    
wait_main_menu:
    LEA DX, wait_str
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    JMP main_menu  

activity_1:
    MOV AX, 03H
    INT 10H
    
    ; print member names
    LEA DX, members_names
    MOV AH, 09H
    INT 21H
    
    JMP wait_main_menu
    
activity_2:
    MOV AX, 03H
    INT 10H
    
    LEA DX, input_name_str
    MOV AH, 09H
    INT 21H
    
    ; get first name
    LEA DX, first_name
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the first name
    MOV BH, 0
    MOV BL, first_name_al
    MOV first_name_field[BX], "$"
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    LEA DX, input_age_str
    INT 21H
    
    ; get age
    LEA DX, age
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the age string
    MOV BH, 0
    MOV BL, age_al
    MOV age_field[BX], "$"
    
    MOV AX, 03H
    INT 10H
    
    ; output first name
    LEA DX, result_str
    MOV AH, 09H
    INT 21H
    LEA DX, first_name_field
    INT 21H
    
    LEA DX, new_line
    INT 21H
    
    ; output age
    lEA DX, result_str[7]
    INT 21H
    LEA DX, age_field
    INT 21H
    
    LEA DX, new_line
    INT 21H
    
    JMP wait_main_menu   
 
activity_3:
    MOV AX, 03H
    INT 10H
    
    ; counter for 3 inputs
    MOV CX, 2
    
    act_3_get_input:
        LEA DX, act_3_input_str
        MOV AH, 09H
        INT 21H
        
        ; get value from user
        MOV AH, 01H
        INT 21H
        
        ; compare current value (defult 0) to the new value
        CMP act_3_highest_value, AL
        ; skip if current highest is greater than or equala to new value
        JGE act_3_get_next_input
        
        ; set new value as highest value
        MOV act_3_highest_value, AL
        
    act_3_get_next_input:
        LEA DX, new_line
        MOV AH, 09H
        INT 21H
 
        ; jump to results if CX is 0       
        CMP CX, 0
        JE act_3_output_result
        
        ; subtract CX by one and get next input
        SUB CX, 1
        JMP act_3_get_input
        
    act_3_output_result:
        ; output result
        LEA DX, act_3_result_str
        MOV AH, 09H
        INT 21H
        
        MOV AH, 02H
        MOV DL, act_3_highest_value
        INT 21H
        
        LEA DX, new_line
        MOV AH, 09H
        INT 21H
        
        JMP wait_main_menu

activity_4:
    MOV AX, 03H
    INT 10H
    
    LEA DX, input_noun_str
    MOV AH, 09H
    INT 21H
    
    ; get first noun
    LEA DX, noun_1
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the first noun
    MOV BH, 0
    MOV BL, noun_1_al
    MOV noun_1_field[BX], "$"
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    LEA DX, input_verb_str
    INT 21H
    
    ; get verb
    LEA DX, verb
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the verb
    MOV BH, 0
    MOV BL, verb_al
    MOV verb_field[BX], "$"
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    LEA DX, input_noun_str
    INT 21H
    
    LEA DX, noun_2
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the second noun    
    MOV BH, 0
    MOV BL, noun_2_al
    MOV noun_2_field[BX], "$"
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    LEA DX, input_adj_str
    INT 21H
    
    ; get adjective
    LEA DX, adjective
    MOV AH, 0AH
    INT 21H
    
    ; add "$" at the end of the adjective
    MOV BH, 0
    MOV BL, adjective_al
    MOV adjective_field[BX], "$"
    
    MOV AX, 03H
    INT 10H
    
    ; print 1st part of the madlib (first noun)
    LEA DX, madlib
    MOV AH, 09H
    INT 21H
    LEA DX, noun_1_field
    INT 21H
    
    ; print 2nd part of the madlib (verb)
    LEA DX, madlib[33]
    INT 21H
    LEA DX, verb_field
    INT 21H
 
    ; print 3rd part of the madlib (second noun)  
    LEA DX, madlib[49]
    INT 21H
    LEA DX, noun_2_field
    INT 21H
 
    ; print 4th part of the madlib (adjective)   
    LEA DX, madlib[54]
    INT 21H
    LEA DX, adjective_field
    INT 21H
 
    ; the rest of the madlib  
    LEA DX, madlib[68]
    INT 21H
 
    LEA DX, new_line
    INT 21H        
    
    JMP wait_main_menu
    
activity_5:
    MOV AX, 03H
    INT 10H
    
    LEA DX, act5_title
    MOV AH, 09H
    INT 21H
    
    LEA DX, act5_enter_msg
    INT 21H
    
    ; get word
    LEA DX, act5_word
    MOV AH, 0AH
    INT 21H
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    MOV SI, 0 ; SI as index of the first letter of the word
    MOV BL, act5_word_al
    MOV BH, 00
    MOV DI, BX ; DI index of the last letter of the word
    DEC DI
    
    compare_letters:
        ; if SI is not less than DI despite checking the whole word
        ; then it is a palindrome
        CMP SI, DI,
        JNL is_palindrome
        
        ; store the letter of index SI in AL
        ; compare AL with the letter in index DI
        MOV AL, BYTE PTR [act5_word_field + SI]       
        CMP AL, BYTE PTR [act5_word_field + DI]
        ; if not equal then it is not a palindrome
        JNE not_palindrome
        
        ; move indices
        INC SI ; move the right
        DEC DI ; move to the left
        JMP compare_letters ; compare letters again
        
    is_palindrome:
        LEA DX, act5_is_palindrome_msg
        MOV AH, 09H
        INT 21H
        
        JMP wait_main_menu
    
    not_palindrome:
        LEA DX, act5_not_palindrome_msg
        MOV AH, 09H
        INT 21H
        
        JMP wait_main_menu   

activity_6:
    MOV AX, 03H
    INT 10H
    
    LEA DX, act6_title
    MOV AH, 09H
    INT 21H
    
    LEA DX, act6_enter_msg
    INT 21H
    
    ; get word
    LEA DX, act6_word
    MOV AH, 0AH
    INT 21H
    
    LEA DX, new_line
    MOV AH, 09H
    INT 21H
    
    LEA DX, act6_result_msg
    INT 21H
 
    MOV BX, 0           
    MOV BL, act6_word_al
    MOV SI, BX ; store the index of the last letter in SI
    DEC SI
    
    act6_print_letter:
        ; print current letter using index SI
        MOV DL, BYTE PTR [act6_word_field + SI]       
        MOV AH, 02H
        INT 21H
        
        ; if SI is at index zero then it is done printing
        CMP SI, 0
        JE act6_end
        
        DEC SI
        ; print next letter
        JMP act6_print_letter
    
    act6_end:
        LEA DX, new_line
        MOV AH, 09H
        INT 21H
        
        JMP wait_main_menu
        
end_program:
    MOV AX, 03H
    INT 10H
    
    LEA DX, end_msg
    MOV AH, 09H
    INT 21H
    
    ; return control to OS
    MOV AH, 4CH
    INT 21H