#Zubair Matani
#Task 3- Making a matrix and transposing it



.data
array:   .word 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 
	 .word 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 
	 .word 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9  
	 .word 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 
	 .word 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9  
	 


rowsColumns:
r: .word 10
c: .word 10
a: .asciiz "Original matrix:\n"
Transpose: .asciiz "Transpose:\n"
newLine: .asciiz "\n"
space: .asciiz " "
.text
main:
   # print original matrix
   la $a0,a
   li $v0,4
   syscall
   jal PrintMatrix
   # find transpose of the given matrix
   jal TransposeMatrix
   # print the transposed matrix
   la $a0,Transpose
   li $v0,4
   syscall
   jal PrintMatrix
li $v0,10
syscall

PrintMatrix:
   la $t2,array  
   lw $s0,r
   lw $s1,c
   li $t0,0       # i=0
L1:
   li $t1,0       # j=0
L2:
   mul $t3,$t0,$s0
   add $t3,$t3,$t1
   mul $t3,$t3,4
   add $t3,$t3,$t2
   lw $a0,($t3)  
   li $v0,1
   syscall           # print A(i,j)
   la $a0,space
   li $v0,4
   syscall
  
   add $t1,$t1,1       # j=j+1
   bge $t1,$s1,exitL2   # if i>colSize, go to exitL2
   j L2
exitL2:
   la $a0,newLine       # print new line
   li $v0,4
   syscall
   add $t0,$t0,1       # i=i+1
   bge $t0,$s0,exitL1   # if i>rowSize, go to exitL1
   j L1
exitL1:
   jr $ra           # return to main

TransposeMatrix:
   la $t2,array  
   lw $s0,r
   lw $s1,c
   li $t0,0       # i=0
   li $t1,0       # j=0
loopL1:  
loopL2:
   mul $t3,$t0,$s0
   add $t3,$t3,$t1
   mul $t3,$t3,4
   add $t3,$t3,$t2
   lw $t4,($t3)       # $t4=A(i,j)

   mul $t5,$t1,$s0
   add $t5,$t5,$t0
   mul $t5,$t5,4
   add $t5,$t5,$t2
   lw $t6,($t5)       # $t6=A(j,i)
  
   # swap A(i,j) and A(j,i)
   move $s2,$t4
   sw $t6,($t3)
   sw $s2,($t5)  
  
   add $t1,$t1,1       # j=j+1
   bge $t1,$s1,exitLoopL2   # if i>colSize, got to exitLoopL2
   j loopL2
exitLoopL2:
   la $a0,newLine
   li $v0,4
   syscall
   add $t0,$t0,1       # i=i+1
   bge $t0,$s0,exitLoopL1   # if i>rowSize, got to exitLoopL1
  
   move $t1,$t0       # i=j
   j loopL1
exitLoopL1:
   jr $ra           # return to main

