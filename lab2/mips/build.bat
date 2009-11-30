gcc -c %1 -o prog.o -EL -g
ld prog.o -Tprog_link.ld -e main -EL -o Prog.elf