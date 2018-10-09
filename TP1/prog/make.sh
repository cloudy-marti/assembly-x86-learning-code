#!/bin/bash

# compile param1.asm program
nasm -f elf32 $1.asm			#create object file
nasm $1.asm -l $1.lst -f elf32
ld -o $1 -melf_i386 -e main $1.o 	#create executable
chmod +x $1				#give permission to execute

#clean
rm -f $1.o

echo "compiling $1 ..."
