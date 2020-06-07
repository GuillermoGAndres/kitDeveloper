#Construccion de makefiles with make
#buildMem:
#	g++ holaMundo.cpp -o hola.exe
#
#@see: https://hernandis.me/2017/03/20/como-hacer-un-makefile.html
#https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
#https://www.gnu.org/software/make/
#https://stackoverflow.com/questions/9593880/compile-and-run-a-c-program-in-emacs
#
#target: dependencies
#	 commands
#$@: the target filename
#$<: the first prerequisite filename.

%: $@.exe

# $@ matches the target; $< matches the first dependent
$@.exe: $@.o
	gcc -o $@ $<

$@.o: $@.c
	gcc -c $<

