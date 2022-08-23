@ECHO OFF

echo Compiler
echo     

C:\i686-elf-tools-windows\bin\i686-elf-as.exe boot.s -o boot.o

C:\i686-elf-tools-windows\bin\i686-elf-gcc.exe -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
C:\i686-elf-tools-windows\bin\i686-elf-gcc.exe -T linker.ld -o fakyoy.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

C:\i686-elf-tools-windows\grub\grub-file.exe --is-x86-multiboot fakyoy.bin

C:\i686-elf-tools-windows\qemu\qemu-system-i386.exe -kernel fakyoy.bin

pause
