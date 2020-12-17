#Zubair Matani
#Task1- Printing a for loop that starts at 120 and goes to 129


.data 
   space: .asciiz " \n"
.text
    main:
    
    addi $t0, $zero, 120
    li $t1, 0
    li $t2, 10
    
    for:
    	jal printNumber
    	addi $t0, $t0, 1
    	addi $t1, $t1, 1
    	beq $t1, $t2, exit
    	
    	j for
    	
    	
    exit:
    li, $v0, 10
    syscall
    
    printNumber:
    li, $v0, 1
    add $a0, $t0, $zero
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    jr $ra
