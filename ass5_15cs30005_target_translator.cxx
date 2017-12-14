#include "ass5_15cs30005_translator.h"
#include <bits/stdc++.h>

extern FILE *yyin;
extern vector<string> allstrings;

using namespace std;

std::map<int, int> labelMap;				// map from quad number to label number
vector <quad> array;						// quad array
string asmfilename="ass5_15cs30005_";		// asm file name
string inputfile="ass5_15cs30005_test";		// input file name
int labelCount=0;							// Label count in asm file
ofstream out;								// asm file stream

void computeActivationRecord(sym_table* st) {
	int param = -20;
	int local = -24;
	for (deque <sym_row>::iterator it = st->table.begin(); it!=st->table.end(); it++) {
		if (it->category.compare("param")==0) {
			st->ar [it->getname()] = param;
			param +=it->size;
		}
		else if (it->getname().compare("return")==0) continue;
		else {
			st->ar [it->getname()] = local;
			local -=it->size;
		}
	}
	cout << "/////////////activation record:" << st->table_name << "////////////\n";
	for(map<string,int>::iterator it=st->ar.begin();it!=st->ar.end();++it)
	{
		cout << it->first << "\t" << it->second << "\n";
	}
	
}



void genasm() {
	array = qarr.array;

	//To update the goto labels
	for (vector<quad>::iterator it = array.begin(); it!=array.end(); ) {
	int i;
	if (it->getop()==GOTOOP || it->getop()==LT || it->getop()==GT || it->getop()==LE|| it->getop()==GE || it->getop()==EQOP || it->getop()==NEOP) {
		i = atoi(it->getresult().c_str());
		labelMap [i] = 1;
	}
	it++;
	}
	int count = 0;
	for (std::map<int,int>::iterator it=labelMap.begin(); it!=labelMap.end(); ++it)
		it->second = count++;
	deque<sym_table*> tablelist;
	for (deque <sym_row>::iterator it = gTable->table.begin(); it!=gTable->table.end(); it++) {
		if (it->nested_table!=NULL) tablelist.push_back (it->nested_table);
	}
	for (deque<sym_table*>::iterator iterator = tablelist.begin();
		iterator != tablelist.end(); ++iterator) {
		computeActivationRecord(*iterator);
	}

	//asmfile
	ofstream asmfile;
	asmfile.open(asmfilename.c_str());

	asmfile << "\t.file	\"test.c\"\n";
	for (deque <sym_row>::iterator it = symbol_table->table.begin(); it!=symbol_table->table.end(); ) {
		if (it->category.compare("function")!=0) {
			if (it->gettype()->getcat()==_CHAR) { // Global char
				if (it->init[0]!="") {
					asmfile << "\t.globl\t" << it->getname() << "\n";
					asmfile << "\t.type\t" << it->getname() << ", @object\n";
					asmfile << "\t.size\t" << it->getname() << ", 1\n";
					asmfile << it->getname() <<":\n";
					asmfile << "\t.byte\t" << atoi( it->init[0].c_str()) << "\n";
				}
				else {
					asmfile << "\t.comm\t" << it->getname() << ",1,1\n";
				}
			}
			if (it->gettype()->getcat()==_INT) { // Global int
				if (it->init[0]!="") {
					asmfile << "\t.globl\t" << it->getname() << "\n";
					asmfile << "\t.data\n";
					asmfile << "\t.align 4\n";
					asmfile << "\t.type\t" << it->getname() << ", @object\n";
					asmfile << "\t.size\t" << it->getname() << ", 4\n";
					asmfile << it->getname() <<":\n";
					asmfile << "\t.long\t" << it->init[0] << "\n";
				}
				else {
					asmfile << "\t.comm\t" << it->getname() << ",4,4\n";
				}
			}
		}
		it++;
	}
	if (allstrings.size()>0) {
		asmfile << "\t.section\t.rodata\n";
		for (vector<string>::iterator it = allstrings.begin(); it!=allstrings.end(); it++) {
			asmfile << ".LC" << it - allstrings.begin() << ":\n";
			asmfile << "\t.string\t" << *it << "\n";
		}
	}
	asmfile << "\t.text	\n";

	vector<string> params;
	std::map<string, int> theMap;
	int ind=0;
	for (vector<quad>::iterator it = array.begin(); it!=array.end(); ++it,ind++) {
		if (labelMap.count(ind)) {
			asmfile << ".L" << (2*labelCount+labelMap.at(it - array.begin()) + 2 )<< ": " << endl;
		}

		
		string result = it->getresult();
		string arg1 = it->getarg1();
		string arg2 = it->getarg2();
		string s=arg2;

		if(array[ind].getop()==PARAM){
			params.push_back(array[ind].getresult());
		}
		else {
			asmfile << "\t";
			// Binary Operations
			if (array[ind].getop()==ADD) {
				int flag=1;
				if(s.empty() || ((!isdigit(s[0])) && (s[0] != '-') && (s[0] != '+'))) flag=0 ;
				else{
					char * p ;
					strtol(s.c_str(), &p, 10) ;
					if(*p == 0) flag=1 ;
					else flag=0;
				}
				if (flag) {
					asmfile << "addl \t$" << atoi(arg2.c_str()) << ", " << symbol_table->ar[array[ind].getarg1()] << "(%rbp)";
				}
				else {
					asmfile << "movl \t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp), " << "%eax" << endl;
					asmfile << "\tmovl \t" << symbol_table->ar[arg2] << "(%rbp), " << "%edx" << endl;
					asmfile << "\taddl \t%edx, %eax\n";
					asmfile << "\tmovl \t%eax, " << symbol_table->ar[array[ind].getresult()] << "(%rbp)";
				}
			}
			else if (array[ind].getop()==SUB) {
				asmfile << "movl \t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp), " << "%eax" << endl;
				asmfile << "\tmovl \t" << symbol_table->ar[arg2] << "(%rbp), " << "%edx" << endl;
				asmfile << "\tsubl \t%edx, %eax\n";
				asmfile << "\tmovl \t%eax, " << symbol_table->ar[array[ind].getresult()] << "(%rbp)";
			}
			if (array[ind].getop()==MULT) {
				asmfile << "movl \t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp), " << "%eax" << endl;
				int flag=1;
				if(s.empty() || ((!isdigit(s[0])) && (s[0] != '-') && (s[0] != '+'))) flag=0 ;
				else{
					char * p ;
					strtol(s.c_str(), &p, 10) ;
					if(*p == 0) flag=1;
					else flag=0;
				}
				if (flag) {
					asmfile << "\timull \t$" << atoi(arg2.c_str()) << ", " << "%eax" << endl;
					sym_table* t = symbol_table;
					string val;
					for (deque <sym_row>::iterator it = t->table.begin(); it!=t->table.end(); it++) {
						if(it->getname()==arg1) val=it->init[0];
					}
					theMap[result]=atoi(arg2.c_str())*atoi(val.c_str());
				}
				else asmfile << "\timull \t" << symbol_table->ar[arg2] << "(%rbp), " << "%eax" << endl;
				asmfile << "\tmovl \t%eax, " << symbol_table->ar[it->getresult()] << "(%rbp)";
			}
			if(array[ind].getop()==DIVIDE) {
				asmfile << "movl \t" << symbol_table->ar[it->getarg1()] << "(%rbp), " << "%eax" << endl;
				asmfile << "\tcltd" << endl;
				asmfile << "\tidivl \t" << symbol_table->ar[arg2] << "(%rbp)" << endl;
				asmfile << "\tmovl \t%eax, " << symbol_table->ar[array[ind].getresult()] << "(%rbp)";
			}

			// Bit Operators /* Ignored */
			else if (it->getop()==MODOP)		asmfile << array[ind].getresult() << " = " << it->getarg1() << " % " << arg2;
			if (array[ind].getop()==XOR)			asmfile << it->getresult() << " = " << arg1 << " ^ " << arg2;
			else if (array[ind].getop()==INOR)		asmfile << array[ind].getresult() << " = " << array[ind].getarg1() << " | " << arg2;
			if (array[ind].getop()==BAND)		asmfile << it->getresult() << " = " << arg1 << " & " << arg2;
			// Shift Operations /* Ignored */
			else if (array[ind].getop()==LEFTSHIFT)		asmfile << it->getresult() << " = " << it->getarg1() << " << " << arg2;
			if (array[ind].getop()==RIGHTSHIFT)		asmfile << array[ind].getresult() << " = " << arg1 << " >> " << arg2;

			if (array[ind].getop()==EQUAL)	{
				if(symbol_table->lookup(arg1)->gettype()->getcat()==_MATRIX_ || symbol_table->lookup(array[ind].getresult())->gettype()->getcat()==_MATRIX_) //case like t1=m+t2 //doesn't calculated the address, just assigns t1=t2
					{
						//asmfile << "leaq\t" << table->ar[arg1] << "(%rbp), " << "%rax" << endl;
						//asmfile << "\tmovl\t" << table->ar[arg2] << "(%rbp), " << "%eax" << endl;
						//asmfile << "\taddq\t%rdx, %rax"<<endl;
						//asmfile << "\tmovl\t%eax, " << table->ar[result] << "(%rbp)" <<endl;
						asmfile << "# result, " << symbol_table->ar[array[ind].getresult()] << " arg1" << symbol_table->ar[arg1];
						symbol_table->ar[array[ind].getresult()]=symbol_table->ar[arg1];
						
					}
				else
				{
				s=array[ind].getarg1();
				int flag=1;
				if(s.empty() || ((!isdigit(s[0])) && (s[0] != '-') && (s[0] != '+'))) flag=0 ;
				else{
					char * p ;
					strtol(s.c_str(), &p, 10) ;
					if(*p == 0) flag=1;
					else flag=0;
				}
				if (flag)
					asmfile << "movl\t$" << atoi(arg1.c_str()) << ", " << "%eax" << endl;
				else
					asmfile << "movl\t" << symbol_table->ar[arg1] << "(%rbp), " << "%eax" << endl;
				asmfile << "\tmovl \t%eax, " << symbol_table->ar[array[ind].getresult()] << "(%rbp)";
				}
				
			}
			else if (array[ind].getop()==EQUALSTR)	{
				asmfile << "movq \t$.LC" << array[ind].getarg1() << ", " << symbol_table->ar[array[ind].getresult()] << "(%rbp)";
			}
			if (array[ind].getop()==EQUALCHAR)	{
				asmfile << "movb\t$" << atoi(array[ind].getarg1().c_str()) << ", " << symbol_table->ar[it->getresult()] << "(%rbp)";
			}
			// Relational Operations
			if (array[ind].getop()==EQOP) {
				asmfile << "movl\t" << symbol_table->ar[arg1] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tje .L" << (2*labelCount+labelMap.at(atoi( it->getresult().c_str() )) +2 );
			}
			else if (array[ind].getop()==NEOP) {
				asmfile << "movl\t" << symbol_table->ar[it->getarg1()] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tjne .L" << (2*labelCount+labelMap.at(atoi( result.c_str() )) +2 );
			}
			if (array[ind].getop()==LT) {
				asmfile << "movl\t" << symbol_table->ar[arg1] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tjl .L" << (2*labelCount+labelMap.at(atoi( it->getresult().c_str() )) +2 );
			}
			if (array[ind].getop()==GT) {
				asmfile << "movl\t" << symbol_table->ar[it->getarg1()] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tjg .L" << (2*labelCount+labelMap.at(atoi( result.c_str() )) +2 );
			}
			else if (array[ind].getop()==GE) {
				asmfile << "movl\t" << symbol_table->ar[it->getarg1()] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tjge .L" << (2*labelCount+labelMap.at(atoi( array[ind].getresult().c_str() )) +2 );
			}
			if (array[ind].getop()==LE) {
				asmfile << "movl\t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp), %eax\n";
				asmfile << "\tcmpl\t" << symbol_table->ar[arg2] << "(%rbp), %eax\n";
				asmfile << "\tjle .L" << (2*labelCount+labelMap.at(atoi( result.c_str() )) +2 );
			}
			else if (it->getop()==GOTOOP) {
				asmfile << "jmp .L" << (2*labelCount+labelMap.at(atoi( array[ind].getresult().c_str() )) +2 );
			}
			// Unary Operators
			if (array[ind].getop()==ADDRESS) {
				asmfile << "leaq\t" << symbol_table->ar[it->getarg1()] << "(%rbp), %rax\n";
				asmfile << "\tmovq \t%rax, " <<  symbol_table->ar[array[ind].getresult()] << "(%rbp)";
			}
			else if (it->getop()==PTRR) {
				asmfile << "movl\t" << symbol_table->ar[arg1] << "(%rbp), %eax\n";
				asmfile << "\tmovl\t(%eax),%eax\n";
				asmfile << "\tmovl \t%eax, " <<  symbol_table->ar[array[ind].getresult()] << "(%rbp)";
			}
			if (array[ind].getop()==PTRL) {
				asmfile << "movl\t" << symbol_table->ar[result] << "(%rbp), %eax\n";
				asmfile << "\tmovl\t" << symbol_table->ar[it->getarg1()] << "(%rbp), %edx\n";
				asmfile << "\tmovl\t%edx, (%eax)";
			}
			if (array[ind].getop()==UMINUS) {
				asmfile << "negl\t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp)";
			}
			else if (it->getop()==BNOT)		asmfile << array[ind].getresult() 	<< " = ~" << array[ind].getarg1();
			if (it->getop()==LNOT)			asmfile << result 	<< " = !" << array[ind].getarg1();
			if (array[ind].getop()==ACESSR) {
				if(symbol_table->lookup(arg1)->gettype()->getcat()==_MATRIX_ && symbol_table->lookup(arg2)->gettype()->getcat()==_MATRIX_) //case like t1=m+t2 //doesn't calculated the address, just assigns t1=t2
				{
					asmfile << "# result, " << symbol_table->ar[it->getresult()] << " arg1" << symbol_table->ar[arg1];
					symbol_table->ar[result]=symbol_table->ar[array[ind].getarg1()];
				}
				else {
				asmfile << "leaq\t" << symbol_table->ar[array[ind].getarg1()] << "(%rbp), " << "%rdx" << endl;
				asmfile << "\tmovl\t" << symbol_table->ar[arg2] << "(%rbp), %eax" << endl;
				asmfile << "\tmovl\t(%rdx,%rax), %eax" <<endl;
				asmfile << "\tmovl\t%eax, " << symbol_table->ar[array[ind].getresult()] <<"(%rbp)"<<endl;
				}
			}
			else if (it->getop()==ACESSL) {
				if(symbol_table->lookup(arg1)->gettype()->getcat()==_MATRIX_ && symbol_table->lookup(result)->gettype()->getcat()==_MATRIX_) //case like t1=m+t2 //doesn't calculated the address, just assigns t1=t2
				{
					asmfile << "# result, " << symbol_table->ar[array[ind].getresult()] << " arg2" << symbol_table->ar[arg2];
					symbol_table->ar[array[ind].getresult()]=symbol_table->ar[arg2];
				}
				else {
				s=arg2;
				int flag=1;
				if(s.empty() || ((!isdigit(s[0])) && (s[0] != '-') && (s[0] != '+'))) flag=0 ;
				else{
					char * p ;
					strtol(s.c_str(), &p, 10) ;
					if(*p == 0) flag=1;
					else flag=0;
				}
				//asmfile << "\tmovl \t%eax, " << symbol_table->ar[result] << "(%rbp)" << endl;
				asmfile << "movl\t" << symbol_table->ar[it->getarg1()] << "(%rbp), "<<"%eax" << endl;
				asmfile << "\tleaq\t" << symbol_table->ar[array[ind].getresult()] << "(%rbp), " << "%rdx" << endl;
				asmfile << "\tleaq\t(%rdx,%rax), %rax" << endl;
				if(flag)
					asmfile << "movl\t$" << atoi(arg2.c_str()) << ", " << "%edx" << endl;
				else
				asmfile << "\tmovl\t" << symbol_table->ar[arg2] << "(%rbp), %edx" << endl;
				asmfile << "\tmovl\t%edx, (%rax)" <<endl;
				}
			}
			if (array[ind].getop()==_RETURN) {
				if(result!="") asmfile << "movl\t" << symbol_table->ar[it->getresult()] << "(%rbp), "<<"%eax";
				else asmfile << "nop";
			}
			if (it->getop()==PARAM) {
				params.push_back(result);
			}
			else if (array[ind].getop()==CALL) {
				// Function Table
				sym_table* t = gTable->lookup(it->getarg1())->nested_table;
				int i,j=0;	// index
				for (deque <sym_row>::iterator it = t->table.begin(); it!=t->table.end(); it++) {
					i = distance ( t->table.begin(), it);
					if (it->category.compare("param")==0) {
						if(j==0) {
							asmfile << "movl \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%eax" << endl;
							asmfile << "\tmovq \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%rdi" << endl;
							//asmfile << "\tmovl \t%eax, " << (t->ar[array[ind].name]-8 )<< "(%rsp)\n\t";
							j++;
						}
						else if(j==1) {
							asmfile << "movl \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%eax" << endl;
							asmfile << "\tmovq \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%rsi" << endl;
							//asmfile << "\tmovl \t%eax, " << (t->ar[it->name]-8 )<< "(%rsp)\n\t";
							j++;
						}
						else if(j==2) {
							asmfile << "movl \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%eax" << endl;
							asmfile << "\tmovq \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%rdx" << endl;
							//asmfile << "\tmovl \t%eax, " << (t->ar[it->name]-8 )<< "(%rsp)\n\t";
							j++;
						}
						else if(j==3) {
							asmfile << "movl \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%eax" << endl;
							asmfile << "\tmovq \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%rcx" << endl;
							//asmfile << "\tmovl \t%eax, " << (t->ar[it->name]-8 )<< "(%rsp)\n\t";
							j++;
						}
						else {
							asmfile << "\tmovq \t" << symbol_table->ar[params[i]] << "(%rbp), " << "%rdi" << endl;
						}
					}
					else break;
				}
				params.clear();
				asmfile << "\tcall\t"<< arg1 << endl;
				asmfile << "\tmovl\t%eax, " << symbol_table->ar[result] << "(%rbp)";
			}
			else if (it->getop()==FUNC) {
				asmfile <<".globl\t" << result << "\n";
				asmfile << "\t.type\t"	<< result << ", @function\n";
				asmfile << result << ": \n";
				asmfile << ".LFB" << labelCount <<":" << endl;
				asmfile << "\t.cfi_startproc" << endl;
				asmfile << "\tpushq \t%rbp" << endl;
				asmfile << "\t.cfi_def_cfa_offset 8" << endl;
				asmfile << "\t.cfi_offset 5, -8" << endl;
				asmfile << "\tmovq \t%rsp, %rbp" << endl;
				asmfile << "\t.cfi_def_cfa_register 5" << endl;
				symbol_table = gTable->lookup(result)->nested_table;
				asmfile << "\tsubq\t$" << symbol_table->table.back().offset+24 << ", %rsp"<<endl;

				// Function Table
				sym_table* t = symbol_table;
				int i=0;
				for (deque <sym_row>::iterator it = t->table.begin(); it!=t->table.end(); it++) {
					if (it->category.compare("param")==0) {
						if (i==0) {
							asmfile << "\tmovq\t%rdi, " << symbol_table->ar[it->getname()] << "(%rbp)";
							i++;
						}
						else if(i==1) {
							asmfile << "\n\tmovq\t%rsi, " << symbol_table->ar[it->getname()] << "(%rbp)";
							i++;
						}
						else if (i==2) {
							asmfile << "\n\tmovq\t%rdx, " << symbol_table->ar[it->getname()] << "(%rbp)";
							i++;
						}
						else if(i==3) {
							asmfile << "\n\tmovq\t%rcx, " << symbol_table->ar[it->getname()] << "(%rbp)";
							i++;
						}
					}
					else break;
				}
			}
			else if (it->getop()==FUNCEND) {
				asmfile << "leave\n";
				asmfile << "\t.cfi_restore 5\n";
				asmfile << "\t.cfi_def_cfa 4, 4\n";
				asmfile << "\tret\n";
				asmfile << "\t.cfi_endproc" << endl;
				asmfile << ".LFE" << labelCount++ <<":" << endl;
				asmfile << "\t.size\t"<< result << ", .-" << result;
			}
			asmfile << endl;
		}
	}
	asmfile << 	"\t.ident\t	\"Compiled by 15cs30005\"\n";
	asmfile << 	"\t.section\t.note.GNU-stack,\"\",@progbits\n";
	asmfile.close();
}

template<class T>
ostream& operator<<(ostream& os, const vector<T>& v)
{
	copy(v.begin(), v.end(), ostream_iterator<T>(os, " "));
	return os;
}

int main(int ac, char* av[]) {
	inputfile=inputfile+string(av[ac-1])+string(".c");
	asmfilename=asmfilename+string(av[ac-1])+string(".s");
	gTable = new sym_table("Global");
	symbol_table = gTable;
	yyin = fopen(inputfile.c_str(),"r");
	yyparse();
	gTable->computeOffsets();
	gTable->print(1);
	qarr.print();
	genasm();
}
