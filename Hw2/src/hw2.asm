.data

	#For Input Array
	array: .word 
	.space 100
	array_1: .word
	.space 100
	array_2:.word
	.space 100
	array_3:.word
	.space 100
	array_4:.word
	.space 100
	array_5:.word
	  .space 100
	array_6:.word
	.space 100
	arrayLength: .byte 6
	arrayIndex: .byte 0 				
	
	#tmp array's datas
	.align 2
	tmpArray: .space  100 
	tmpLength: .byte 0
	tmpIndex: .byte 0 
	tmpArray2: .space  200
	#longest array's datas
	.align 2
	longArray: 	.space  100
	longLength: .byte 0
	longIndex: 	.byte 0 

	
	sequ: 	.asciiz "candidate sequence : ["
	long: 	.asciiz  "Longest:  "
	size: 	.asciiz "]  size =  "
	nl: 	.asciiz  "\n"
	space: 	.asciiz  " "
	comma: 	.asciiz  " "
	null: 	.word '\0'
	row:	.asciiz "\n\n ============================= \n\n"
	
	
	#For File I/O
	fileName: 	.asciiz  "arrays.txt"   
	inputBuffer: 	.space 256
	
	
	outputFile: .asciiz  "results.txt"  	 
	textBuffer: .space 512	#buffer

.text
	main:
			
		li $v0 13
		la $a0 fileName
		li $a1 0
		syscall
	
		move $s0  $v0
	
		li   $v0 14       # system call for read from file
		move $a0 $s0      # file descriptor 
		la   $a1 inputBuffer   # address of buffer to which to read
		la   $a2 256      # hardcoded buffer length
		syscall
		
		jal getArrayFromString
		
		
##########################################################
start:	

		li $v1 4
		la $a0 row
		syscall

	ARRAY_1:	
		la $a1 array
		la $a0 array_1
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7 tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0 4
		la  $a0 long
		syscall
		
			#set poniter to header for the longest
		addi $t1 $zero 0

		li  $v0 4
		la  $a0 sequ		# The longest sequnece
		syscall
		
		jal PrintLongest		# printign the longest we found
		
		la $a0 array_1			# set all elemet as 0
		jal clearArray
		
		la $a1 array_1
		la $a0 longArray		# assign to returned longest array to array_1 to print 
		jal deepCopyArray
		
		la $a0 tmpArray			
		jal clearArray		# to use second time we are resetting the used register and data storage
		jal resetData
		
		li $v1 4
		la $a0 row
		syscall
		
	ARRAY_2:
			
		la $a1 array
		la $a0 array_2
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7 tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0 4
		la  $a0 long
		syscall
		
			#set poniter to header for the longest
		addi $t1 $zero 0

		li  $v0 4
		la  $a0 sequ
		syscall
		
		jal PrintLongest
		
		la $a0 array_2				# Expalined these lines in Array_1
		jal clearArray				
		
		la $a1 array_2
		la $a0 longArray			# line 128 - 140
		jal deepCopyArray
		
		la $a0 tmpArray
		jal clearArray
		jal resetData				# ---------
		
		li $v1 4
		la $a0 row
		syscall
	ARRAY_3:
		la $a1 array
		la $a0 array_3
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7 tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0 4
		la  $a0 long
		syscall
		
			#set poniter to header for the longest
		addi $t1 $zero 0

		li  $v0 4
		la  $a0 sequ
		syscall
		
		jal PrintLongest
		
		la $a0 array_3				# Expalined these lines in Array_1
		jal clearArray
		
		la $a1 array_3
		la $a0 longArray			# line 128 - 140
		jal deepCopyArray
		
		la $a0 tmpArray
		jal clearArray
		jal resetData				# --------
		
		li $v1 4
		la $a0 row
		syscall

	ARRAY_4:
		la $a1 array
		la $a0 array_4
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7 tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0 4
		la  $a0 long
		syscall
		
			#set poniter to header for the longest
		addi $t1 $zero 0

		li  $v0 4
		la  $a0 sequ
		syscall
		
		jal PrintLongest
		
		la $a0 array_4					# Expalined these lines in Array_1
		jal clearArray
		
		la $a1 array_4
		la $a0 longArray
		jal deepCopyArray				# line 128 - 140
		
		la $a0 tmpArray
		jal clearArray
		jal resetData					# --------
		
		li $v1 4
		la $a0 row
		syscall

	ARRAY_5:
		la $a1 array
		la $a0 array_5
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7 tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0 4
		la  $a0 long
		syscall
		
			#set poniter to header for the longest
		addi $t1 $zero 0

		li  $v0 4
		la  $a0 sequ
		syscall
		
		jal PrintLongest
		
		la $a0 array_5					# Expalined these lines in Array_1
		jal clearArray
		
		la $a1 array_5
		la $a0 longArray
		jal deepCopyArray				# line 128 to 140
		
		la $a0 tmpArray
		jal clearArray
		jal resetData					# -------------------
		
		li $v1 4
		la $a0 row
		syscall
		
	ARRAY_6:
	
		la $a1 array
		la $a0 array_6
		jal deepCopyArray
		la $a1 array
		jal lengthOfArray2
		
		add $s0 $zero $v1 #Array Size
		
		lb $t0 arrayIndex
		add $s1 $zero 0 #Array Index idx
			#pointer for the array
		
		addi $t0 $zero 0 #for Array Memory Address
		
		lb $t2 longLength
		add $t2 $zero $t2 # LongestArray Size
		
		lb $t3 longIndex
		add $t3 $zero $t3 # LongestArray Index
		
			#pointer for the longest array
		addi $t1 $zero 0 #for LongestArray Memory Address		
		
			#Max Size
		add $t4 $zero 0
		
		lb $t6 tmpLength
		add $t6 $zero $t6 # Temp Size
		
		lb $t7  tmpIndex
		add $t7 $zero $t7 # Temp Index
		
			#pointer for the tmp array
		addi $t5 $zero 0 #temp address
		
			#call recursive function
		jal findLongestIncreasingSubSequence
		
		li  $v0  4
		la  $a0  long
		syscall
		
			#set poniter to header for the longest
		addi $t1   $zero   0

		li  $v0  4
		la  $a0  sequ
		syscall
		
		jal PrintLongest
		
		la $a0 array_6					# Expalined these lines in Array_1
		jal clearArray
		
		la $a1 array_6			
		la $a0 longArray				# line 128 to 140
		jal deepCopyArray
		
		la $a0 tmpArray
		jal clearArray
		jal resetData					# ------------
		
		li $v1  4
		la $a0 row
		syscall
		
Exit:		
	li $v0  10
	syscall

######################################################################################

	findLongestIncreasingSubSequence:
	
		bgt $s0 $s1 IF_1 	#Base Case control for the recursive
		blt $t2 $t6 IF_1_1 	#Continue For the recursive
		
		j printTmpArray

######################################################################################	
	#Base case of recursive

		IF_1_1:
       	
        addi $sp  $sp -4	#load foo adress
		sw  $ra  0($sp)
		
		addi $t3 $zero 0 	# set the longest index value again 			
		addi $t1 $zero 0 	# set the longest addres		
		addi $t2 $zero 0  	# reset longest size
		
		add $t4 $t6 $zero	# assing tmp size to max size
        sb $t6 longLength	# set as longLength
		
		addi $sp  $sp -4		
		sw  $t5  0($sp)		# get back tmp address
		addi $t5 $zero 4 	# iter one word 
		
		jal CopyToLongest
		
		lw $t5  0($sp)
		add $sp  $sp 4
		
		lw  $ra  0($sp)
		add $sp  $sp 4

######################################################################################	
			
	printTmpArray:
   		sub $sp  $sp 4	
		sw  $ra  0($sp)
		
		sub $sp  $sp 4
		sw  $t5  0($sp)
		li $t5 4 				#set back tmp address
		
		sub $sp  $sp 4
		sw  $t7  0($sp)
		addi $t7 $zero 0 		#set back tmp index
		
		li  $v0  4				# print Candicate sequnce ...
		la  $a0  sequ
		syscall
		
		jal PrintTmpArrayConsole
		
		lw  $t7  0($sp)		#get back tmp index
		add $sp  $sp 4
		
		lw  $t5  0($sp)		#get back tmp address
		add $sp  $sp 4
		
		lw  $ra  0($sp)		# load returned address
		add $sp  $sp 4
		jr $ra

######################################################################################
	
	IF_1:
		seq  $s2 $t6 $zero 			# to check the arr.length <= idx
		lw $t8 array($t0)			# get the array addres
		lw $t9 tmpArray($t5)		# get the tmp array address
		
		sgt $s3 $t8 $t9 			# to check the arr value is less than last tmp value
		or $s2 $s2 $s3				# get the or result of two condition
		beqz $s2 RecursiveCall 		# calling the recursive call
	
		add $t5 $t5 4 				# temp next address
		sw  $t8 tmpArray($t5) 		# store the arr index value
		
		add $t7 $t7 1 				# increase tmp index
		add $t6 $t6 1 				# increase tmp size
		
		add $t0 $t0 4 				# get the next adress of array
		add $s1 $s1 1 				# incrase array index
		
		addi $sp  $sp -4			# store the current fuction address
		sw  $ra  0($sp)				
		jal findLongestIncreasingSubSequence #calculateLongest(arr  idx+1  temp);
		lw  $ra  0($sp)				# get the loaded function addres
		add $sp  $sp 4
		
		addi $s1 $s1 -1				# decrease index of array
		addi $t0 $t0 -4 			# get array previous address
		
		sw $zero tmpArray($t5)
		addi $t5 $t5 -4 			# removing last elemtn address of tmp array
		addi $t7 $t7 -1 			# dexrase tmp array index
		addi $t6 $t6 -1 			# decrease tmp array size
		
######################################################################################			
	
	RecursiveCall: 
	
		add $s1 $s1 1
		sb $s1  arrayLength		
		add $t0 $t0 4
		
		addi $sp  $sp -4		# store the current funtion address
		sw  $ra  0($sp)
	   	
	   	jal findLongestIncreasingSubSequence 	#calculateLongest(arr  idx+1  temp);
	   	
	   	lw  $ra  0($sp)			# get the before function address
	   	add $sp  $sp 4
	   	
	   	addi $s1 $s1 -1
	   	addi $t0 $t0 -4
		jr $ra

#ARRAY FUNCTIONS
######################################################################################


# a1 get array as parameter
clearArray:
	add $t5  $a0  $zero			#get temp reference
	clear:

		sb $zero  0($t5)		#assign 0 to place
		addi $t5  $t5  4		#iterate array
	
		lb $t0  0($t5)			#check for the next byte to look end of array
		bne $zero $t0 clear		#clear loop
	
	jr $ra

######################################################################################

	#printing tmp array

	PrintTmpArrayConsole:
	
		li  $v0  1				#load the tmp array address
		lw  $a0  tmpArray($t5)
		syscall	
		
		add $t5 $t5 4	#iter the next element address 
		
		li  $v0  4
		la  $a0  comma
		syscall
				
		add $t7 $t7 1	#increase index
	
		#to check end of the tmp array
		bgt $t6  $t7 PrintTmpArrayConsole 	

		
		li  $v0  4
		la  $a0  size
		syscall
		 
		li  $v0  1 		# printing the size of tmp array
		la  $a0  0($t6)
		syscall
		

		li  $v0  4		#new Line
		la  $a0  nl
		syscall
		
		
		jr $ra
		
######################################################################################

#assign array adress to $a1 than you can use
printArray:
	add $t1  $a1  $zero
	#assing array adress to t1 for temporary 
	
	printIterator:
		lb 	$t0  0($t1)			#load the value of array
		addi 	$t1  $t1  1		#set t1 address for the next number
		
		li 	$v0  1
		addi 	$a0  $t0  0 	#printing next byte to the console
		syscall
		
		li	$v0  4
		la 	$a0  comma			#printing comma to console
		syscall
		
		lb 	$t0  0($t1)
		bne 	$t0  0  printIterator
		
		li $v0 4
		la $a0 nl
		syscall
		jr $ra
		
######################################################################################	
		
	PrintLongest:
		
		li  $v0  1				#print the element of array
		lw  $a0  longArray($t1)
		syscall
		
		add $t1 $t1 4			#iter the next element address
		
		li  $v0  4
		la  $a0  comma			# ,
		syscall
		
		add $t3 $t3 1		# next element counter
		
			#to check end of the longest array
		blt  $t3  $t4  PrintLongest 
		
		
		li  $v0  4
		la  $a0  size		# size = 
		syscall
		 					#print the size of longest array
		li  $v0  1
		la  $a0  0($t2)
		syscall
		
		#Print NewLine
		li  $v0  4
		la  $a0  nl
		syscall
		# Return
		jr $ra		
		
######################################################################################

#$a1 for left value $a0 for right value for assign
# a3 = a0 ( t2 = t1)
assignArray:
	
	#jal clearArray
	add $t1 $a0 $zero 		# assignnin tmp address for getting array address
	add $t2 $a3 $zero
	
	assign:
		
		lb $t3 ($t1)	# loading r value
		sw $t3 ($t2)	# storing l value
		
		addi $t2  $t2  4 #increase address
		addi $t1  $t1  1 # increase index
		
		lb $t3 ($t1)	# to check end of the list
		bne $t3  0   assign
	
	jr $ra

######################################################################################
#reseting data store elements to use again
resetData:
	
	sb $zero arrayIndex			# reseting data storage element to reusage
	sb $zero tmpLength
	sb $zero tmpIndex
	sb $zero longLength
	sb $zero longIndex

	jr $ra

######################################################################################
# if tmp array's length is grater than current
# long array it is making assigment 
# tmp = long
	CopyToLongest:
		lw $t8 tmpArray($t5)
		sw  $t8 longArray($t1)
		
		add $t5 $t5 4	#increasing adress
		add $t1 $t1 4
			
		addi $t2 $t2 1	#increasing index val
		addi $t7 $t7 1
		bgt $t6 $t2 CopyToLongest 

		jr $ra

######################################################################################
# a1 = a0
deepCopyArray:
				# assignnin onen array to another byte use word not byte
				# this is the different between assignArray procedure
	copy:
		lw $t8 0($a0)
		sw  $t8 0($a1)
		
		addi $a1 $a1 4 # increase address for the next values 		
		addi $a0 $a0 4
		
		lw $s4 ($a0)	# to cehck end of the array
		bne $s4 0 copy

	jr $ra
######################################################################################

#assign array adress to $a1 
#assing new element $a0 than you can use
addNewElement:	#adding new element end of the list
	move $s4  $ra 
	move $s0  $a0
	
	jal lengthOfArray
	addi $a0  $v1  0		# getting the lenght of the array

	jal getNthAddress		# getting the last addres of array
	move $a0  $v0

	sb $s0  0($a0)			# storing new value the getting address
	
	move $ra  $s4			# retunr the getting procedure
	jr $ra
	
######################################################################################

#assign array adress to $a1 than you can use
removeLastElement:	#remove last element
	move $s4  $ra 
	
	jal lengthOfArray 
	addi $a2  $v1  -1	#sub 1 for index number 
	
	jal getNthAddress   #return the adress of stored a2 register 
	move $a2  $v0
	sb $zero  0($a2)	# stored 0 getting adress
	
	move $ra  $s4
	jr $ra
	
######################################################################################	

#assign array adress to $a1 
#assign the nth to $a0 than you can use

getNthAddress:	# $v0 return the nth address for the input
	add $t1  $a1  $zero	
	li $t2  -1	#counter
	
	NthAdress:
		
		addi $t1  $t1  1	# get next adress
		addi $t2  $t2  1	# decrease counter number
		bne $t2  $a0  NthAdress	
		
		addi $v0  $t1  -1		# founded adress to return
		
		jr $ra

######################################################################################

#assign array adress to $a1 than you can use
lengthOfArray2:	# v1 register returning the length of array
	add $t1  $a1  $zero	
	#assing array adress to t1 for temporary 
	li $t3  -1
	#for the length counter
	lengthIterator2:			# .word lengt of array 
		lw	$t0  0($t1)
		addi 	$t1  $t1  4		# load the next value
		addi 	$t3  $t3  1				
		add 	$v1  $t3  $zero
		bne 	$t0  0  lengthIterator2
		jr $ra	
		
#assign array adress to $a1 than you can use
lengthOfArray:	# v1 register returning the length of array
	add $t1  $a1  $zero	
	#assing array adress to t1 for temporary 
	li $t3  -1
	#for the length counter
	lengthIterator:
		lw	$t0  0($t1)
		addi 	$t1  $t1  4
		addi 	$t3  $t3  1				
		add 	$v1  $t3  $zero
		bne 	$t0  0  lengthIterator
		jr $ra

#FILE OPERATIONS
######################################################################################

getArrayFromString:
	move $s0 $ra
		
	lb $t1  0($a1)			# Getting the byte from text file 
	addi $t1 $t1 -48		# convert the ascii to value 
	addi $a1 $a1 1			# increase the file pointer
	
	beq $t1  -48  ret		# storing or , \n \r conditions
	beq $t1  -38  getArrayFromString
	beq $t1  -35  getArrayFromString
	
	li $t2  0				# sum
	li $t3 10				# x 10
	atoi:				# normal atoi funtion string to integer
		
		mult  $t2 $t3		# sum * 10
		mflo  $t2
		
		add $t2 $t2 $t1		# sum + nex value

		lb $t1  ($a1)
		addi $t1 $t1 -48		# ascii to integer value
		addi $a1 $a1 1
		
		beq $t1 -4 next				#checking for the , \0 \n \r or a number to continue
		beq $t1 -48 next		
		bne $t1 -35 atoi
		beq $t1 -35 loadArray
		beq $t1 -48 loadArray		
	next:
		
		li $v0 1			# printing the numbers what we read
		move $a0 $t2
		syscall 
		
		sb $t2 tmpArray2($a3)		# store the values in tmp2 data storage
		addi $a3 $a3 1				# increase the storage address
		
		li $v0 4					# ,
		la $a0  comma
		syscall
		
		j getArrayFromString		# return for the next number
	
	ret:	
		move $ra $s0	
		jr $ra
	
loadArray:
	sb $t2 tmpArray2($a3)		#store address
	move $s3  $ra				# store return adress
	li $s1 0					# index to check
	li $a3 0					
	
			#query by next array
			
	lb  $s2 array_1($s1)		# quering the first element of array
	beq $s2 $zero first			# to decide what is the next
	lb  $s2 array_2($s1)
	beq $s2 $zero second
	lb $s2 array_3($s1)
	beq $s2 $zero third
	lb $s2 array_4($s1)
	beq $s2 $zero fourth
	lb $s2 array_5($s1)
	beq $s2 $zero fifth
	lb $s2 array_6($s1)
	beq $s2 $zero sixth
	
			#assign data storage with query
	
	first:
		la $a0 tmpArray2
		la $a3 array_1			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j getArrayFromString	# for next line array
		
	second:
		la $a0 tmpArray2
		la $a3 array_2			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j getArrayFromString	# for next line array
		
	third:
		
		la $a0 tmpArray2
		la $a3 array_3			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j getArrayFromString	# for next line array
		
	fourth:
		
		la $a0 tmpArray2
		la $a3 array_4			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j getArrayFromString	# for next line array
				
	fifth:
	
		la $a0 tmpArray2
		la $a3 array_5			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j getArrayFromString	# for next line array
		
	sixth:
		la $a0 tmpArray2	
		la $a3 array_6			# store the values on data storage
		jal assignArray			# assign array
		jal clearArray			# clear tmp2 array
		li $a3 0				# reset counter
		j start					# END OF READING TEXT AND START THE PROGRAM



writeFile:
# Open (for writing) a file that does not exist
	li $v0, 13 				# system call for open file
	la $a0, outputFile 		# output file name
	li $a1, 1 				# Open for writing (flags are 0: read, 1: write)
	li $a2, 0				# mode is ignored
	syscall 				# open a file (file descriptor returned in $v0)
	move $s7, $v0 			# save the file descriptor 				$s7 file

	#### to be Cointinue ....


######################################################################################

#printing array as byte byte
printbytebyte:
		
		lb $a0 ($a1)
		addi $a1 $a1 1
			
		addi $a0 $a0 -48
		li $v0  1
		syscall
			
		bne $a0 -48 printbytebyte
		j Exit
	
######################################################################################
