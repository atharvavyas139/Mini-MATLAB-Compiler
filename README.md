# Mini-MATLAB-Compiler
Compiler for Mini  MATLAB Specifications<br />
The repository contains code for all the 4 parts of a compiler<br />
1.lexer<br />
2.parser<br />
3.Intermediate code generator(Three Adress Code Generation)<br />
4.Target Code Generator<br />
makefile is used to run the code to test for a particular file first type make and then type make test[number of the test file]<br />
for eq to test ass5_15cs30005_test1.c type make and then type make test1<br />
the quads in this case are generated in file ass5_15cs30005_quads1.out<br />
the x86-64 assembly code in this case is created in ass5_15cs30005_1.s<br />
to test your input kindly edit ass5_15cs30005_test[1-5].c<br />
to execute the .s with gcc type ./test[number] for e.g ./test1<br />
