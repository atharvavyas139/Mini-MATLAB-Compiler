#to test for a particular file first type make and then make test[number of the test file]
#for eq to test ass5_15cs30005_test1.c type make and then type make test1
#the quads in this case are generated in file ass5_15cs30005_quads1.out
#the x86-64 assembly code in this case is created in ass5_15cs30005_1.s
#to test your input kindly edit ass5_15cs30005_test[1-5].c
#to execute the .s with gcc type ./test[number] for e.g ./test1
asmGenerate: comp
	./comp 1 > ass5_15cs30005_quads1.out
	./comp 2 > ass5_15cs30005_quads2.out
	./comp 3 > ass5_15cs30005_quads3.out
	./comp 4 > ass5_15cs30005_quads4.out
	./comp 5 > ass5_15cs30005_quads5.out

comp: lex.yy.o y.tab.o ass5_15cs30005_translator.o ass5_15cs30005_target_translator.o
	g++ lex.yy.o y.tab.o ass5_15cs30005_translator.o \
	ass5_15cs30005_target_translator.o -lfl -o comp

ass5_15cs30005_target_translator.o: ass5_15cs30005_target_translator.cxx
	g++ -c ass5_15cs30005_target_translator.cxx

ass5_15cs30005_translator.o: ass5_15cs30005_translator.cxx ass5_15cs30005_translator.h
	g++ -c ass5_15cs30005_translator.h
	g++ -c ass5_15cs30005_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: ass5_15cs30005.l y.tab.h ass5_15cs30005_translator.h
	flex ass5_15cs30005.l

y.tab.c: ass5_15cs30005.y
	yacc -dtv ass5_15cs30005.y -W

y.tab.h: ass5_15cs30005.y
	yacc -dtv ass5_15cs30005.y -W

clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass5_15cs30005_translator.o test1 test2 test3 test4 test5 y.output comp ass5_15cs30005_target_translator.o libass5_15cs30005.a ass5_15cs30005_1.o ass5_15cs30005_2.o ass5_15cs30005_3.o ass5_15cs30005_4.o ass5_15cs30005_5.o ass5_15cs30005.o


#Test files
test1:  libass5_15cs30005.a ass5_15cs30005_1.o
	gcc ass5_15cs30005_1.o -o test1 -L. -lass5_15cs30005
ass5_15cs30005_1.o: myl.h ass5_15cs30005_1.s
	gcc -c ass5_15cs30005_1.s
ass5_15CS30005_1.s: comp ass5_15CS30005_test1.c
	./comp 1

test2:  libass5_15cs30005.a ass5_15cs30005_2.o
	gcc ass5_15cs30005_2.o -o test2 -L. -lass5_15cs30005
ass5_15cs30005_2.o: myl.h ass5_15cs30005_2.s
	gcc -c ass5_15cs30005_2.s
ass5_15CS30005_2.s: comp ass5_15CS30005_test2.c
	./comp 2

test3:  libass5_15cs30005.a ass5_15cs30005_3.o
	gcc ass5_15cs30005_3.o -o test3 -L. -lass5_15cs30005
ass5_15cs30005_3.o: myl.h ass5_15cs30005_3.s
	gcc -c ass5_15cs30005_3.s
ass5_15CS30005_3.s: comp ass5_15CS30005_test3.c
	./comp 3

test4:  libass5_15cs30005.a ass5_15cs30005_4.o
	gcc ass5_15cs30005_4.o -o test4 -L. -lass5_15cs30005
ass5_15cs30005_4.o: myl.h ass5_15cs30005_4.s
	gcc -c ass5_15cs30005_4.s
ass5_15CS30005_4.s: comp ass5_15CS30005_test4.c
	./comp 4

test5:  libass5_15cs30005.a ass5_15cs30005_5.o
	gcc ass5_15cs30005_5.o -o test5 -L. -lass5_15cs30005
ass5_15cs30005_5.o: myl.h ass5_15cs30005_5.s
	gcc -c ass5_15cs30005_5.s
ass5_15CS30005_5.s: comp ass5_15CS30005_test5.c
	./comp 5



libass5_15cs30005.a: ass5_15cs30005.o
	ar -rcs libass5_15cs30005.a ass2_15cs30005.o

ass5_15cs30005.o: ass2_15cs30005.c myl.h
	gcc -Wall -c ass2_15cs30005.c
