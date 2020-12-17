#Zubair Matani
#Task2- Finding the highest and lowest number from a given array 


.data 
   highest: .asciiz " Highest\n"
   lowest:  .asciiz " Lowest\n"
   Array: .word 12, -1, 8, 0, 6, 85, -74, 23, 99, -30 #array of 10 elements
   N: .word 10 #number of elements
   
.text
main: la, $a0, Array #load array 
      lw, $a1, N #counter 
      
      li $t2, 0 #tempVariable
      li $t3, 0 #tempVariable
      
      jal readArray #jumptoReadArray
      li $v0, 10
      syscall #exit
      
readArray:
	li $t0, 0 #counter
	li $t1, 0 #arrayPointer
	
loop:
	bge $t0, $a1, exit #comparingCounterIfReached10
	lw $a0, Array($t1) #ifNotLoadinValue
	
	blt $a0, $t3, newMinimum #compareCurrentValue,IfLessthenItIsTheNewMinimum
	j checkMax #IfNotCompareToCheckIfMax
	
newMinimum:	move $t3, $a0 #NewMin
		j count #UpdateCounter
		
checkMax: 	bgt $a0, $t2, newMaximum
		j count
		
newMaximum:	move $t2, $a0

count:		addi $t1, $t1, 4
		addi $t0, $t0, 1
		b loop
		
exit:
	li $v0, 1
	move $a0, $t2
	syscall
	
	la $a0, highest #printHighest
	li $v0, 4
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	la $a0, lowest #printLowest
	li $v0, 4
	syscall
	
	jr $ra #exit
	
	
	

	
