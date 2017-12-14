 %{ 
//	file name:ass5_15cs30005_parse.y 	author: atharva vyas
	#include <bits/stdc++.h>
	#include "ass5_15cs30005_translator.h"
	extern	int yylex();
	void yyerror(const char *s);
	extern data_type TYPE;
	extern int rowison;
	vector <string> allstrings;
	using namespace std;
%}
/*augmentations:
1.The constant non terminal is added ending in the given terminals augmentation was necesaary because different temporary generation and initial value has to be set according to the type of constant
2.In the logical expressions the non terminals M and N are augmented so as to specify proper labels in backpatching
3.grammar rule changed for postfix_expression->postfix_expression '[' expression ']' '[' expression ']' to handle matrices
*/
///type casting has not been done properly
%union {
	char unaryop;
	int intval;
	int instruction;
	char* strval;
	sym_row* symp;
	expr* exp;
	sym_type* stype;
	statement* stat;
	unary* unaryval;
}
//for the tokens whose type has not been defined is just used for parsing and no operations are done on it
%token BOOL CHAR SHORT INT LONG SIGNED UNSIGNED FLOAT DOUBLE  
%token BREAK CASE CONTINUE DEFAULT DO IF ELSE FOR GOTO WHILE SWITCH
%token RETURN CONST VOID
%token MATRIX
%token ELLIPSIS RIGHT_SHIFT_EQUAL LEFT_SHIFT_EQUAL ADD_EQUAL SUB_EQUAL MUL_EQUAL
%token DIV_EQUAL MOD_EQUAL AND_EQUAL XOR_EQUAL OR_EQUAL SHIFT_RIGHT SHIFT_LEFT 
%token INCREMENT_OP DECREMENT_OP POINTER_OP LOGAND LOGOR LESS_EQUAL GREATER_EQUAL EQUAL_OP NOTEQUAL_OP TRANSPOSE

//the types of token here is essential because the value of tokens are analyzed
%token <symp>IDENTIFIER //identifier will be stores in symnol_table row and pointed by symp;
%token <intval>INT_CONSTANT ZERO_CONSTANT//This constants will be of form integers
%token <strval> FLOAT_CONSTANT ENU_CONSTANT STRING_LITERAL CHAR_CONSTANT//This constants will of string type float_constant will be converted from string to floating using inbuilt library function

%type <unaryval> postfix_expression //assigned unary class because this non terminals are involved when we are also interested in address of element of matrix
	unary_expression
	cast_expression
	emptytkn
%type <exp> //in exp we also store nextlist truelist and false list which is important for backpatching in case of expressions
	expression
	primary_expression 
	multiplicative_expression
	additive_expression
	shift_expression
	relational_expression
	equality_expression
	and_expression
	exclusive_or_expression
	inclusive_or_expression
	logical_and_expression
	logical_or_expression
	conditional_expression
	assignment_expression
	expression_statement

%type <unaryop> unary_operator //we need to know exactly the type of unary_operator represented by character
%type <symp> constant initializer initializer_row_list initializer_row //only redirection of poiinters in required as the symbol rows are already created on right side
%type <instruction> M //M is just used to provide labels for backpatching in form of integer(line number of quad translation)
%type <exp> N //N also helps in branching with labelling
%type <stype> pointer //pointer is nothing but a pointer to data_type
%type <symp> direct_declarator init_declarator declarator //similar argument need to initializer
%type <stat>  statement //only the next line of instruction matters for this non terminals as direct jump is involved without condition
	labeled_statement 
	compound_statement
	selection_statement
	iteration_statement
	jump_statement
	block_item
	block_item_list
%type <intval> argument_expression_list //intval because we will store the number of arguments here
%start translation_unit
%%
primary_expression//if the grammar rule leads to terminal or constant a new expression is created and pointed towards the new syblo row created by terminal
	: IDENTIFIER {
		$$ = new expr();
		$$->setsymp($1);
		$$->setisbool(false);
	}
	| constant {
		$$ = new expr();
		$$->setsymp($1);
	}
	| STRING_LITERAL {
		$$ = new expr();
		vector<string> temp;
		temp.push_back($1);
		$$->setsymp(sym_table::gentemp(PTR,temp));
		$$->getsymp()->initialize(temp);
		$$->getsymp()->gettype()->setptr(new sym_type(_CHAR));//since string is determined by pointer having collection of characters
		allstrings.push_back($1);
	quadstore::emit(EQUALSTR, $$->getsymp()->getname(), tostr (allstrings.size()-1));

	}
	| '(' expression ')' {//expression not a terminal so simpy equated
		$$ = $2;
	}
	;
postfix_expression
	: primary_expression  {
		$$ = new unary ();
		$$->setsymp($1->getsymp());//
		$$->setloc($1->getsymp());
		$$->settype($1->getsymp()->gettype());
		$$->setcat($$->gettype()->getcat());//setting all the attributes right
	}
	///grammar rule changed here to specifically handle Matrices ,in this way we will not be able to handle aarrays
	| postfix_expression '[' expression ']' '[' expression ']'{
		$$ = new unary();
		$$->setsymp($1->getsymp());			// pointing to symbol entry of identifier (matrix name)
		$$->settype($1->gettype()->getptr());		// type = type of identifier (matrix name)
		
		$$->setcat(_MATRIX_);
		if ($1->getcat()==_MATRIX_) {		//we generate all the quads related to accessing matrix element here
			sym_row* tt= sym_table::gentemp(_INT);
 				quadstore::emit(EQUAL, tt->getname(),sclass::NumberToString(8), sclass::NumberToString(8));
			sym_row* t1= sym_table::gentemp(_INT);
 				quadstore::emit(MULT, t1->getname(), $3->getsymp()->getname(),tt->getname());
			sym_row *t2= sym_table::gentemp(_INT);
				quadstore::emit (EQUAL, t2->getname(),tostr($1->getsymp()->gettype()->getcols()),tostr($1->getsymp()->gettype()->getcols()));
			sym_row *t3= sym_table::gentemp(_INT);
				quadstore::emit (EQUAL, t3->getname(), t1->getname(), t1->getname());
			sym_row *t4= sym_table::gentemp(_INT);
				quadstore::emit (MULT, t4->getname(), t3->getname(),t2->getname());
			sym_row *t5= sym_table::gentemp(_INT);
				quadstore::emit (MULT, t5->getname(), $6->getsymp()->getname(),tt->getname());
			sym_row *t6= sym_table::gentemp(_INT);
				quadstore::emit (ADD, t6->getname(), t5->getname(),t4->getname());
			sym_row *t7= sym_table::gentemp(_INT);
				quadstore::emit (ADD, t7->getname(),t6->getname(),tt->getname());
			$$->setloc(t7);
		}
 		else {
	 			quadstore::emit(MULT, $$->getloc()->getname(), $3->getsymp()->getname(), sclass::NumberToString(sclass::sizeoftype($$->gettype())));//needed for array but not been handled now
 		}
	}
	| postfix_expression '(' ')'
	| postfix_expression '(' argument_expression_list ')' {//grammar rule corresponding to function call
		$$ = new unary();
		$$->setsymp(sym_table::gentemp($1->gettype()->getcat()));
		quadstore::emit(CALL, $$->getsymp()->getname(), $1->getsymp()->getname(), tostr($3));//since argument_expression list is intval containing number of arguments
	}
	| postfix_expression '.' IDENTIFIER
	| postfix_expression POINTER_OP IDENTIFIER
	| postfix_expression INCREMENT_OP {
		$$ = new unary();
		if($1->getsymp()->gettype()->getcat()!=_MATRIX_)//handling the cases of matrix and non matrix seperately because accesing differs
		{

		$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			quadstore::emit (EQUAL, $$->getsymp()->getname(), $1->getsymp()->getname());

		
			quadstore::emit (ADD, $1->getsymp()->getname(), $1->getsymp()->getname(), "1");
		}
		else
		{
			sym_row* t1= sym_table::gentemp(_INT);
			sym_row* t2= sym_table::gentemp(_INT);
            		quadstore::emit(ACESSR,t1->getname(),$1->getsymp()->getname(),$1->getloc()->getname());//first acessing,adding and then increment
			quadstore::emit(EQUAL,t2->getname(),t1->getname(),t1->getname());
            		quadstore::emit(ADD,t1->getname(),t1->getname(), "1");
            		quadstore::emit(ACESSL,$1->getsymp()->getname(),$1->getloc()->getname(),t1->getname());
            		$$->setsymp(t2); 
		}
	}
	|postfix_expression TRANSPOSE {
			vector<string> temp;
			temp.push_back("transpose");//transpose operation is handled seperately with interchange of rows and cols
			sym_row* t1= sym_table::gentemp($1->gettype(),temp);
            		//quadstore::emit(TRANSPOSEO,t1->getname(),$1->getsymp()->getname(),$1->getsymp()->getname());
            		
			int rows=$1->getsymp()->gettype()->getrows();
	       		int cols=$1->getsymp()->gettype()->getcols();
			sym_row **tarray=new sym_row*[3*rows*cols];
			int cntt=0;
			for(int i=0;i<rows;++i)
   			for(int j=0;j<cols;++j)
			{
			tarray[cntt]= sym_table::gentemp(_INT);
			tarray[cntt+1]=sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+1]->getname(),tostr(8+8*(cols*i+j)),tostr(8+8*(cols*i+j)));
 			quadstore::emit(ACESSR, tarray[cntt]->getname(),$1->getsymp()->getname(),tarray[cntt+1]->getname());
			tarray[cntt+2]= sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+2]->getname(),tostr(8+8*(rows*j+i)),tostr(8+8*(rows*j+i)));
			quadstore::emit(ACESSL,t1->getname(),tarray[cntt+2]->getname(),tarray[cntt]->getname());
			cntt=cntt+3;
			}
			$$->setsymp(t1);
			}
	| postfix_expression DECREMENT_OP {//procedure similar to increment op
		$$ = new unary();

		if($1->getsymp()->gettype()->getcat()!=_MATRIX_)
		{
	
		$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			quadstore::emit (EQUAL, $$->getsymp()->getname(), $1->getsymp()->getname());


			quadstore::emit (SUB, $1->getsymp()->getname(), $1->getsymp()->getname(), "1");
		}
		else
		{
			sym_row* t1= sym_table::gentemp(_INT);
			sym_row* t2= sym_table::gentemp(_INT);
            		quadstore::emit(ACESSR,t1->getname(),$1->getsymp()->getname(),$1->getloc()->getname());
			quadstore::emit(EQUAL,t2->getname(),t1->getname(),t1->getname());
            		quadstore::emit(SUB,t1->getname(),t1->getname(), "1");
            		quadstore::emit(ACESSL,$1->getsymp()->getname(),$1->getloc()->getname(),t1->getname());
            		$$->setsymp(t2); 
		}
	}
	;
argument_expression_list
	: assignment_expression {//will be used  in function call
		quadstore::emit (PARAM, $1->getsymp()->getname());
		$$ = 1;//start so count of argument=1
	}
	| argument_expression_list ',' assignment_expression {
		quadstore::emit (PARAM, $3->getsymp()->getname());
		$$ = $1+1;//increment of count with number of arguments
	}
	;
unary_expression
	: postfix_expression {
		$$ = $1;
	}
	| INCREMENT_OP unary_expression {
		
		if($2->getsymp()->gettype()->getcat()!=_MATRIX_)
		{
		
			quadstore::emit (ADD, $2->getsymp()->getname(), $2->getsymp()->getname(), "1");

		
		}
		else//here the value on left will also change as it is ++_ and not _++
		{
			sym_row* t1= sym_table::gentemp(_INT);
			sym_row* t2= sym_table::gentemp(_INT);
            		quadstore::emit(ACESSR,t1->getname(),$2->getsymp()->getname(),$2->getloc()->getname());
			quadstore::emit(EQUAL,t2->getname(),t1->getname(),t1->getname());
            		quadstore::emit(ADD,t1->getname(),t1->getname(), "1");
            		quadstore::emit(ACESSL,$2->getsymp()->getname(),$2->getloc()->getname(),t1->getname());
            		
		}
	
		$$ = $2;
	}
	| DECREMENT_OP unary_expression { //similar to increment op above
		
		if($2->getsymp()->gettype()->getcat()!=_MATRIX_)
		{
	
			quadstore::emit (SUB, $2->getsymp()->getname(), $2->getsymp()->getname(), "1");		
		}
		else
		{
			sym_row* t1= sym_table::gentemp(_INT);
			sym_row* t2= sym_table::gentemp(_INT);
            		quadstore::emit(ACESSR,t1->getname(),$2->getsymp()->getname(),$2->getloc()->getname());
			quadstore::emit(EQUAL,t2->getname(),t1->getname(),t1->getname());
            		quadstore::emit(SUB,t1->getname(),t1->getname(), "1");
            		quadstore::emit(ACESSL,$2->getsymp()->getname(),$2->getloc()->getname(),t1->getname());
		}
	
		$$ = $2;
	}
	| unary_operator cast_expression {//unary operator will determine the quad operation and the type of right side
		$$ = new unary();
		switch ($1) {
			case '&':
				$$->setsymp(sym_table::gentemp(PTR));
				$$->getsymp()->gettype()->setptr($2->getsymp()->gettype()) ; //determining the non terminal it will point to
				quadstore::emit (ADDRESS, $$->getsymp()->getname(), $2->getsymp()->getname());
				break;
			case '*':
				$$->setcat(PTR);
				$$->setloc(sym_table::gentemp ($2->getsymp()->gettype()->getptr()));
				quadstore::emit (PTRR, $$->getloc()->getname(), $2->getsymp()->getname());
				$$->setsymp($2->getsymp());
				break;
			case '+':
				$$ = $2;//basically no effect
				break;
			case '-'://in the cases below the type of temp created will be that of right side
				$$->setsymp(sym_table::gentemp($2->getsymp()->gettype()->getcat()));
				quadstore::emit (UMINUS, $$->getsymp()->getname(), $2->getsymp()->getname());
				break;
			case '~':
				$$->setsymp(sym_table::gentemp($2->getsymp()->gettype()->getcat()));
				quadstore::emit (BNOT, $$->getsymp()->getname(), $2->getsymp()->getname());
				break;
			case '!':
				$$->setsymp(sym_table::gentemp($2->getsymp()->gettype()->getcat()));
				quadstore::emit (LNOT, $$->getsymp()->getname(), $2->getsymp()->getname());
				break;
			default:
				break;
		}
	}
	;
//the constant non terminal is added ending in the given terminals augmentation was necesaary because differnt temporary generation and initial value has to be set according to the type of constant
constant
	: INT_CONSTANT {
		if (rowison==0)//since the init attribute is vector of strings we need to convert int to string first
        {
		vector<string> temp;
		temp.push_back(sclass::NumberToString($1));
		$$ = sym_table::gentemp(_INT,temp);
		quadstore::emit(EQUAL, $$->getname(),sclass::NumberToString($1),sclass::NumberToString($1));
        }
        else//no need to print temporary variables created during row formation for matrix
         {
            $$=new sym_row(sclass::NumberToString($1),_INT);
		vector<string> temp;
		temp.push_back(sclass::NumberToString($1));
            $$->setinit(temp);
           }
	}
	| FLOAT_CONSTANT {//float constant was earlier defined as string and not int,else everything similar as above
		if (rowison==0)
        {
		
		vector<string> temp;
		temp.push_back(*new string ($1));
		$$ = sym_table::gentemp(_DOUBLE,temp);
			quadstore::emit(EQUAL, $$->getname(), *new string($1),*new string($1));
		$$ = sym_table::gentemp(_DOUBLE,temp);
			quadstore::emit(EQUAL, $$->getname(), *new string($1),*new string($1));
        }
        else
         {
            $$=new sym_row(*new string($1),_DOUBLE);
		vector<string> temp;
		temp.push_back(*new string ($1));
            $$->setinit(temp);
           }
		
	}
	| ENU_CONSTANT {
	}
	| CHAR_CONSTANT{//There is a problem in this segment of code
		vector<string> temp;
		string ss=*new string($1);
		string temps;
		temps.push_back(ss[1]);
		temp.push_back(temps);
		$$ = sym_table::gentemp(_CHAR);
		quadstore::emit(EQUALCHAR, $$->getname(),temps,temps);
	}
	| ZERO_CONSTANT{//totally similar to INT_CONSTANT
		if (rowison==0)
        {
		vector<string> temp;
		temp.push_back(sclass::NumberToString($1));
		$$ = sym_table::gentemp(_INT,temp);
			quadstore::emit(EQUAL, $$->getname(),sclass::NumberToString($1),sclass::NumberToString($1));
        }
        else
         {
            $$=new sym_row(sclass::NumberToString($1),_INT);
		vector<string> temp;
		temp.push_back(sclass::NumberToString($1));
            $$->setinit(temp);
           }
	}
	;
unary_operator//simple assignment done here
	: '&' {
		$$ = '&';
	}
	| '*' {
		$$ = '*';
	}
	| '+' {
		$$ = '+';
	}
	| '-' {
		$$ = '-';
	}
	;
cast_expression
	: unary_expression  {
		$$ = $1;
	}
	
	;
multiplicative_expression
	: cast_expression {//cast expression plays the role in assignment
		$$ = new expr();
		if ($1->getcat()==_MATRIX_) {//temperory variable will also need to be of the form of matrix
			sym_type *ts=new sym_type($1->getcat(),NULL,0,$1->getsymp()->gettype()->getrows(),$1->getsymp()->gettype()->getcols());//used for production of matrix temp variable
			vector<string> tv;
			tv.push_back("matrix_temp");
			
			if($1->getsymp()->gettype()->getistranspose()!=1)
				{
				if($1->getloc()->gettype()->getcat()==_INT)
					$$->setsymp(sym_table::gentemp(_INT));//if we are acessing a specific element of matrix then the temp variable need not be of matrix type
				else $$->setsymp(sym_table::gentemp(ts,tv));
				quadstore::emit(ACESSR, $$->getsymp()->getname(), $1->getsymp()->getname(), $1->getloc()->getname());
				}
			else{
				$$->setsymp(sym_table::gentemp(ts,tv));
				quadstore::emit(EQUAL,$$->getsymp()->getname(),$1->getsymp()->getname(),$1->getsymp()->getname());
				}
		}
		else if ($1->getcat()==PTR) {
			$$->setsymp($1->getloc());
		}
		else {
			$$->setsymp($1->getsymp());
		}
	}
	| multiplicative_expression '*' cast_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {//checking if the two expression involved have the same type first
			$$ = new expr();
			if ($3->getcat()==_MATRIX_) {//temperory variable will also need to be of the form of matrix
			int rows1=$1->getsymp()->gettype()->getrows();
	       int cols2=$3->getsymp()->gettype()->getcols();
		int cols1=$1->getsymp()->gettype()->getcols();
		sym_type *ts=new sym_type(_MATRIX_,NULL,0,rows1,cols2);
		sym_row *tt = sym_table::gentemp(ts);
		$$->setsymp(tt);
			//$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			int cc=0;
			sym_row **tarray=new sym_row*[400];
			int cntt=0;
			for(int i=0;i<rows1;++i)
   			for(int j=0;j<cols2;++j)
			{
			      tarray[cntt]= sym_table::gentemp(_INT);
			      quadstore::emit(EQUAL, tarray[cntt]->getname(),tostr(8+8*(cols2*i+j)),tostr(8+8*(cols2*i+j)));//=[i][j]
			      tarray[cntt+1]=sym_table::gentemp(_INT);
			      quadstore::emit(EQUAL, tarray[cntt+1]->getname(),tostr(0),tostr(0));//temp=0
 			      quadstore::emit(ACESSL,$$->getsymp()->getname(),tarray[cntt+1]->getname(),tarray[cntt+1]->getname());//result[i][j]=0;
			for(int k=0;k<cols1;++k)
			{
			tarray[cntt+2]= sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+2]->getname(),tostr(8+8*(cols1*i+k)),tostr(8+8*(cols1*i+k)));//=[i][k]
			tarray[cntt+3]= sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+3]->getname(),tostr(8+8*(cols2*k+j)),tostr(8+8*(cols2*k+j)));//=[k][j] 
			tarray[cntt+4]= sym_table::gentemp(_INT);  
			quadstore::emit(ACESSR, tarray[cntt+4]->getname(),$1->getsymp()->getname(),tarray[cntt+2]->getname());//a[i][k]
			tarray[cntt+5]= sym_table::gentemp(_INT);  
			quadstore::emit(ACESSR, tarray[cntt+5]->getname(),$3->getsymp()->getname(),tarray[cntt+3]->getname());//b[k][j]
			tarray[cntt+6]= sym_table::gentemp(_INT);
			quadstore::emit(MULT, tarray[cntt+6]->getname(),tarray[cntt+4]->getname(),tarray[cntt+5]->getname());//a[i][k]*b[k][j]
			quadstore::emit(ADD, tarray[cntt+1]->getname(),tarray[cntt+1]->getname(),tarray[cntt+6]->getname());//t=t+a[i][k]*b[k][j]
 			quadstore::emit(ACESSL,$$->getsymp()->getname(),tarray[cntt]->getname(),tarray[cntt+1]->getname());//result[i][j]=t
			}
			}
			}	
			else{
			$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			quadstore::emit (MULT, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());//can be easily translated into quad
			}
		}
		else cout << "Type Error"<< endl;
	}
	| multiplicative_expression '/' cast_expression{
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
				quadstore::emit (DIVIDE, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	| multiplicative_expression '%' cast_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
				quadstore::emit (MODOP, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	;

additive_expression
	: multiplicative_expression {$$ = $1;}
	| additive_expression '+' multiplicative_expression {
		if($1->getsymp()->gettype()->getcat()==_MATRIX_)
		{
		
		$$ = new expr();
		int rows=$1->getsymp()->gettype()->getrows();
	       int cols=$1->getsymp()->gettype()->getcols();
		sym_type *ts=new sym_type(_MATRIX_,NULL,0,rows,cols);
			
		sym_row *tt = sym_table::gentemp(ts);

		$$->setsymp(tt);
			//$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			
			sym_row **tarray=new sym_row*[4*rows*cols];
			int cntt=0;
			for(int i=0;i<rows;++i)
   			for(int j=0;j<cols;++j)
			{
			tarray[cntt]= sym_table::gentemp(_INT);
			tarray[cntt+3]=sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+3]->getname(),tostr(8+8*(cols*i+j)),tostr(8+8*(cols*i+j)));
 			quadstore::emit(ACESSR, tarray[cntt]->getname(),$1->getsymp()->getname(),tarray[cntt+3]->getname());
			tarray[cntt+1]= sym_table::gentemp(_INT);
 			quadstore::emit(ACESSR, tarray[cntt+1]->getname(),$3->getsymp()->getname(),tarray[cntt+3]->getname());
			tarray[cntt+2]= sym_table::gentemp(_INT);
 			quadstore::emit(ADD, tarray[cntt+2]->getname(),tarray[cntt+1]->getname(),tarray[cntt]->getname());
			quadstore::emit(ACESSL,$$->getsymp()->getname(),tarray[cntt+3]->getname(),tarray[cntt+2]->getname());
			cntt=cntt+4;
			}
		 }
		else if (sclass::typecheck($1->getsymp(), $3->getsymp())) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			quadstore::emit (ADD, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	| additive_expression '-' multiplicative_expression {
		if($1->getsymp()->gettype()->getcat()==_MATRIX_)
		{
		
		$$ = new expr();
		int rows=$1->getsymp()->gettype()->getrows();
	       int cols=$1->getsymp()->gettype()->getcols();
		sym_type *ts=new sym_type(_MATRIX_,NULL,0,rows,cols);
			
		sym_row *tt = sym_table::gentemp(ts);

		$$->setsymp(tt);
			//$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			
			sym_row **tarray=new sym_row*[4*rows*cols];
			int cntt=0;
			for(int i=0;i<rows;++i)
   			for(int j=0;j<cols;++j)
			{
			tarray[cntt]= sym_table::gentemp(_INT);
			tarray[cntt+3]=sym_table::gentemp(_INT);
			quadstore::emit(EQUAL, tarray[cntt+3]->getname(),tostr(8+8*(cols*i+j)),tostr(8+8*(cols*i+j)));
 			quadstore::emit(ACESSR, tarray[cntt]->getname(),$1->getsymp()->getname(),tarray[cntt+3]->getname());
			tarray[cntt+1]= sym_table::gentemp(_INT);
 			quadstore::emit(ACESSR, tarray[cntt+1]->getname(),$3->getsymp()->getname(),tarray[cntt+3]->getname());
			tarray[cntt+2]= sym_table::gentemp(_INT);
 			quadstore::emit(SUB, tarray[cntt+2]->getname(),tarray[cntt]->getname(),tarray[cntt+1]->getname());
			quadstore::emit(ACESSL,$$->getsymp()->getname(),tarray[cntt+3]->getname(),tarray[cntt+2]->getname());
			cntt=cntt+4;
			}
		 }
		else if (sclass::typecheck($1->getsymp(), $3->getsymp())) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp($1->getsymp()->gettype()->getcat()));
			quadstore::emit (SUB, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
		
	}
	;

shift_expression
	: additive_expression {$$ = $1;}
	| shift_expression SHIFT_LEFT additive_expression {
		if ($3->getsymp()->gettype()->getcat() == _INT) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp (_INT));
				quadstore::emit (LEFTSHIFT, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	| shift_expression SHIFT_RIGHT additive_expression {
		if ($3->getsymp()->gettype()->getcat() == _INT) {
			$$ = new expr();
			$$->setsymp(sym_table::gentemp (_INT));
				quadstore::emit (RIGHTSHIFT, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	;

relational_expression
	: shift_expression { $$ = $1;}//all expressions below are boolean
	| relational_expression '<' shift_expression {//since boolean operator involved creation of new bool expression is done here
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setisbool(true);//setting the flag isbool 

			$$->settruelist(sclass::makelist (sclass::nextinstr()));//if true goto is involved
			$$->setfalselist(sclass::makelist (sclass::nextinstr()+1));//else next line will be used
			quadstore::emit(LT, "", $1->getsymp()->getname(), $3->getsymp()->getname());
			quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	| relational_expression '>' shift_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setisbool(true);

			$$->settruelist(sclass::makelist (sclass::nextinstr()));
			$$->setfalselist(sclass::makelist (sclass::nextinstr()+1));
			quadstore::emit(GT, "", $1->getsymp()->getname(), $3->getsymp()->getname());
			quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	| relational_expression LESS_EQUAL shift_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setisbool(true);

			$$->settruelist(sclass::makelist (sclass::nextinstr())); 
			$$->setfalselist(sclass::makelist (sclass::nextinstr()+1));
				quadstore::emit(LE, "", $1->getsymp()->getname(), $3->getsymp()->getname());
				quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	| relational_expression GREATER_EQUAL shift_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setisbool(true);
			$$->settruelist(sclass::makelist (sclass::nextinstr()));
			$$->setfalselist(sclass::makelist (sclass::nextinstr()+1));
				quadstore::emit(GE, "", $1->getsymp()->getname(), $3->getsymp()->getname());
				quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	;

equality_expression
	: relational_expression {$$ = $1;}
	| equality_expression EQUAL_OP relational_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
		
			expr::convertfrombool ($1);//we first convert the two conditional expressions into intermediate codes
			expr::convertfrombool ($3);
			
			$$ = new expr();
			$$->setisbool(true);
			
			$$->settruelist( sclass::makelist (sclass::nextinstr()));
			$$->setfalselist( sclass::makelist (sclass::nextinstr()+1));
				quadstore::emit (EQOP, "", $1->getsymp()->getname(), $3->getsymp()->getname());
				quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	| equality_expression NOTEQUAL_OP relational_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
		
			expr::convertfrombool ($1);
			expr::convertfrombool ($3);
			
			$$ = new expr();
			$$->setisbool(true);
			
			$$->settruelist(sclass::makelist (sclass::nextinstr()));
			$$->setfalselist(sclass::makelist (sclass::nextinstr()+1));
				quadstore::emit (NEOP, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
				quadstore::emit (GOTOOP, "");
		}
		else cout << "Type Error"<< endl;
	}
	;

and_expression
	: equality_expression {$$ = $1;}
	| and_expression '&' equality_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			$$ = new expr();
			$$->setisbool(false);

			$$->setsymp(sym_table::gentemp (_INT));
				quadstore::emit (BAND, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	;

exclusive_or_expression
	: and_expression {$$ = $1;}
	| exclusive_or_expression '^' and_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			
			expr::convertfrombool ($1);
			expr::convertfrombool ($3);

			$$ = new expr();
			$$->setisbool(false);

			$$->setsymp(sym_table::gentemp (_INT));
				quadstore::emit (XOR, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	;

inclusive_or_expression
	: exclusive_or_expression {$$ = $1;}
	| inclusive_or_expression '|' exclusive_or_expression {
		if (sclass::typecheck ($1->getsymp(), $3->getsymp()) ) {
			
			expr::convertfrombool ($1);
			expr::convertfrombool ($3);

			$$ = new expr();
			$$->setisbool(false);
			
			$$->setsymp(sym_table::gentemp (_INT));
				quadstore::emit (INOR, $$->getsymp()->getname(), $1->getsymp()->getname(), $3->getsymp()->getname());
		}
		else cout << "Type Error"<< endl;
	}
	;
//Augmentation-In the logical expressions the non terminals M and N are augmented so as to specify proper label in backpatching
logical_and_expression
	: inclusive_or_expression {$$ = $1;}
	| logical_and_expression N LOGAND M inclusive_or_expression {
		expr::convert2bool($5);//converting the two conditional expressions into intermeddiate code 

		sclass::sclass::backpatch($2->getnextlist(), sclass::nextinstr());
		expr::convert2bool($1);

		$$ = new expr();
		$$->setisbool(true);

		sclass::sclass::backpatch($1->gettruelist(), $4);
		$$->settruelist($5->gettruelist());
		$$->setfalselist(sclass::mergeq ($1->getfalselist(), $5->getfalselist()));//if either of the the expressions surrounding and false the whole expression will move to same line
	}
	;
logical_or_expression// M and N are combined here
	: logical_and_expression {$$ = $1;}
	| logical_or_expression N LOGOR M logical_and_expression {
		expr::convert2bool($5);

			sclass::sclass::backpatch($2->getnextlist(), sclass::nextinstr());
		expr::convert2bool($1);

		$$ = new expr();
		$$->setisbool(true);

			sclass::sclass::backpatch ($$->getfalselist(), $4);
		$$->settruelist(sclass::mergeq ($1->gettruelist(), $5->gettruelist()));
		$$->setfalselist($5->getfalselist());
	}
	;
///M acts as a lable for goto
M 	: %empty{	
		$$ = sclass::nextinstr();
	};
N 	: %empty { 	// N provides label as well as direction for the next statement
		$$  = new expr();
		$$->setnextlist(sclass::makelist(sclass::nextinstr()));
			quadstore::emit (GOTOOP,"");
	};

conditional_expression
	: logical_or_expression {$$ = $1;}
	| logical_or_expression N '?' M expression N ':' M conditional_expression {//some problem one goto does not backpatch 
		$$->setsymp(sym_table::gentemp());
		$$->getsymp()->update($5->getsymp()->gettype());
		quadstore::emit(EQUAL, $$->getsymp()->getname(), $9->getsymp()->getname());
		deque<int> l = sclass::makelist(sclass::nextinstr());
		quadstore::emit (GOTOOP, "");
		sclass::backpatch($6->getnextlist(), sclass::nextinstr());
		quadstore::emit(EQUAL, $$->getsymp()->getname(), $5->getsymp()->getname());
		deque<int> m = sclass::makelist(sclass::nextinstr());
		l = sclass::mergeq (l, m);
		quadstore::emit (GOTOOP, "");
		sclass::backpatch($2->getnextlist(), sclass::nextinstr());
		expr::convert2bool ($1);
		sclass::backpatch ($1->gettruelist(), $4);
		sclass::backpatch ($1->getfalselist(), $8);
		sclass::backpatch (l, sclass::nextinstr());
	}
	;

assignment_expression
	: conditional_expression {
		$$ = $1;
	}
	| unary_expression assignment_operator assignment_expression {
		switch ($1->getcat()) {
			case _MATRIX_:
				$3->setsymp(sclass::conv($3->getsymp(), $1->gettype()->getcat())) ;
					quadstore::emit(ACESSL, $1->getsymp()->getname(), $1->getloc()->getname(), $3->getsymp()->getname());	
				break;
			case PTR:
					quadstore::emit(PTRL, $1->getsymp()->getname(), $3->getsymp()->getname());	
				break;
			default:
				$3->setsymp(sclass::conv($3->getsymp(), $1->getsymp()->gettype()->getcat()));
					quadstore::emit(EQUAL, $1->getsymp()->getname(), $3->getsymp()->getname());
				break;
		}
		$$ = $3;
	}
	;

assignment_operator
	: '='
	| MUL_EQUAL
	| DIV_EQUAL
	| MOD_EQUAL
	| ADD_EQUAL
	| SUB_EQUAL
	| LEFT_SHIFT_EQUAL
	| RIGHT_SHIFT_EQUAL
	| AND_EQUAL
	| XOR_EQUAL
	| OR_EQUAL
	;

expression
	: assignment_expression {
		$$ = $1;
	}
	| expression ',' assignment_expression
	{}
	;

constant_expression
	: conditional_expression
	{}
	;

///////////////DECLARATION

declaration
	: declaration_specifiers ';' {

	}
	| declaration_specifiers init_declarator_list ';' {
	}
	;

declaration_specifiers
	: type_specifier
	| type_specifier declaration_specifiers
	{}
	;
///declarator list not handled
init_declarator_list
	: init_declarator
	| init_declarator_list ',' init_declarator {
	}
	;

init_declarator
	: declarator {
		$$ = $1;
	}
	| declarator '=' initializer {
		 $1->initialize($3->getinit());
		quadstore::emit (EQUAL, $1->getname(), $3->getname());
	}
	;
type_specifier
	: VOID {
		TYPE = _VOID;
	}
	| CHAR {
		TYPE = _CHAR;
	}
	| SHORT
	| INT {
		TYPE = _INT;
	}
	| LONG
	| FLOAT
	| DOUBLE {
		TYPE = _DOUBLE;
	}
	| MATRIX{
		TYPE =_MATRIX_;
	}
	| SIGNED
	| UNSIGNED
	| BOOL
	{}
	;
declarator
	: pointer direct_declarator {
		sym_type * t = $1;
		while (t->getptr() !=NULL) t = t->getptr();
		t->setptr($2->gettype());
		$$ = $2->update($1);
	}
	| direct_declarator
	;
//augmentation of CST for change symbol table execution
direct_declarator
	: IDENTIFIER {
		$$ = $1->update(TYPE);
		currentsym_row = $$;
	}
	| '(' declarator ')' {
		$$ = $2;
	}
	| direct_declarator '[' assignment_expression ']' '[' assignment_expression ']'{//when matrix is declared we need to update the dimension of identifier representing matrix
		sym_type * t = $1 -> gettype();
		if(t->getcat() == _MATRIX_)
		{
			int r = atoi(($3->getsymp()->getinit())[0].c_str());
			int c = atoi(($6->getsymp()->getinit())[0].c_str());
			sym_type* s = new sym_type(_MATRIX_, $1->gettype(), 0,r,c);
			$$ = $1->update(s);
		}
	}
	| direct_declarator '[' ']' {//for arrays no need of handling
	}
	| direct_declarator '(' CST parameter_type_list ')' {
		symbol_table->settname($1->getname());

		if ($1->gettype()->getcat() !=_VOID) {
			sym_row *s = symbol_table->lookup("retVal");
			s->update($1->gettype());		
		}

		$1 = $1->linkst(symbol_table);

		symbol_table->setparent(gTable);
		sclass::changeTable (gTable);	// switch back to globalsymbol symbol_table
	
		currentsym_row = $$;						
	}
	| direct_declarator '(' identifier_list ')' { 

	}
	| direct_declarator '(' CST ')' {		
		symbol_table->settname($1->getname());	// Update the name of symbol table name with function name 

		if ($1->gettype()->getcat() !=_VOID) {
			sym_row *s = symbol_table->lookup("retVal");// update type of return value
			s->update($1->gettype());
		}
		
		$1 = $1->linkst(symbol_table);		// since function is declared here we link new symbol table to the st containing the function
	
		symbol_table->setparent(gTable);
		sclass::changeTable (gTable);		// back to globalsymbol symbol_table
	
		currentsym_row = $$;
	}
	;

CST : %empty { // change in symbol table according to function according to if symbol table exits or not
		if (currentsym_row->nested_table==NULL) sclass::changeTable(new sym_table(""));
		else {
			sclass::changeTable (currentsym_row ->nested_table);
			quadstore::emit (FUNC, symbol_table->gettname());
		}
	}
	;

pointer
	: '*' {
		$$ = new sym_type(PTR);
	}
	| '*' pointer {
		$$ = new sym_type(PTR, $2);
	}
	;



parameter_type_list
	: parameter_list
	{}
	;

parameter_list
	: parameter_declaration
	| parameter_list ',' parameter_declaration {
	}
	;

parameter_declaration
	: declaration_specifiers declarator {
		$2->setcategory("param");
	}
	| declaration_specifiers
	{}
	;

identifier_list
	: IDENTIFIER 
	| identifier_list ',' IDENTIFIER
	{}
	;

initializer:assignment_expression {$$ = $1->getsymp();}
|'{' emptytkn initializer_row_list '}' {rowison=0;
										
$$=$3;
$$->init=$3->init;
$$->init.push_back("}");
$$->init.insert($$->init.begin(),"{");
int rows=1,cols=1;
vector<string> matrixv=$$->getinit();//here we determine the number of rows and cols according to initializer row list for temp variable to get proper dimensions
bool colstatus=true;
//$$->setsymp(sym_table::gentemp());
//$$->getsymp()->update($5->getsymp()->gettype());
vector<string> matrix_values;
for(int i=0;i<matrixv.size();++i)
{
	if(matrixv[i]=="," &&colstatus)
		++cols;
	else if(matrixv[i]==";")
		{
		colstatus=false;
		++rows;
		}
	else if(matrixv[i]!="{" && matrixv[i]!="}" && matrixv[i]!=";" && matrixv[i]!="," )
		{
		matrix_values.push_back(matrixv[i]);
		}
}

sym_type *ts=new sym_type(_MATRIX_,NULL,0,rows,cols);
			
sym_row *tt = sym_table::gentemp(ts,$$->getinit());

$$->setname(tt->getname());
sym_row **tarray=new sym_row*[rows*cols];
int cntt=0;
for(int i=0;i<rows;++i)
   for(int j=0;j<cols;++j)
	{
		tarray[cntt]= sym_table::gentemp(_INT);
 		quadstore::emit(EQUAL, tarray[cntt]->getname(),tostr(8+8*(cols*i+j)),tostr(8+8*(cols*i+j)));
		quadstore::emit(ACESSL,tt->getname(),tarray[cntt]->getname(),matrix_values[cols*i+j]);
		++cntt;
	}} ;
emptytkn:%empty{rowison=1;};
///initializer row list added which is updated
initializer_row_list:
			initializer_row {$$=$1;} 
			|initializer_row_list ';' initializer_row {//in this case we need to concatenate(rows) the initial values 
						vector<string> temp1=$1->getinit();
						vector<string> temp2=$3->getinit();
						vector<string> temp4;
						temp4.push_back(";");
						vector<string> temp3;
						temp3.insert( temp3.end(), temp1.begin(), temp1.end() );
						temp3.insert( temp3.end(), temp4.begin(), temp4.end() );
						temp3.insert( temp3.end(), temp2.begin(), temp2.end() );
						$$=$1;
						$$->setinit(temp3);
					   };

initializer_row:designation_opt initializer {$$=$2;}
|initializer_row ',' designation_opt initializer {vector<string> temp1=$1->getinit();//in this case we need to concatenate(cols of a particular row) the initial values 
						vector<string> temp2=$4->getinit();
						vector<string> temp4;
						temp4.push_back(",");
						vector<string> temp3;
						temp3.insert( temp3.end(), temp1.begin(), temp1.end() );
						temp3.insert( temp3.end(), temp4.begin(), temp4.end() );
						temp3.insert( temp3.end(), temp2.begin(), temp2.end() );
						$$=$1;
						$$->setinit(temp3);};

designation_opt: {}
|designation {};

designation:designator_list '=' {};

designator_list:designator  {}
|designator_list designator {};

designator:'[' constant_expression ']' {}
|'.' IDENTIFIER {};


statement
	: labeled_statement 
	| compound_statement {
		$$ = $1;
	}
	| expression_statement {
		$$ = new statement();
		$$->setnextlist( $1->getnextlist());
	}
	| selection_statement {
		$$ = $1;
	}
	| iteration_statement {
		$$ = $1;
	}
	| jump_statement {
		$$ = $1;
	
	}
	;

labeled_statement 
	: IDENTIFIER ':' statement {}
	| CASE constant_expression ':' statement {}
	| DEFAULT ':' statement {}
	;

compound_statement
	: '{' '}' { $$ = new statement();}
	| '{' block_item_list '}' {
		$$ = $2;
	}
	;
//augmentation done here with inclusion of M
block_item_list
	: block_item {
		$$ = $1;		
	}
	| block_item_list M block_item {
		$$ = $3;
		sclass::backpatch ($1->getnextlist(), $2);//after execution of one block item we write the statements for next block statement
	
	}
	;

block_item
	: declaration { 
		$$ = new statement();
	}
	| statement {
		$$ = $1;
	}
	;

expression_statement
	: ';' {	$$ = new expr();}
	| expression ';' {
		$$ = $1;
	}
	;

selection_statement
	: IF '(' expression ')' M statement N {
		int n=sclass::nextinstr();
		sclass::backpatch ($7->getnextlist(),n);//after statement the execution goes on
		expr::convert2bool($3);//condition to intermediate code
		$$ = new statement();
		sclass::backpatch ($3->gettruelist(), $5);//if condition is true we execute statement
		//cout << "backpatch of expression" << n << "\n";
		 
		deque<int> temp = sclass::mergeq ($3->getfalselist(), $6->getnextlist());//if the condition fails we avoid execution of statement
		sclass::backpatch ($3->getfalselist(),n);
		$$->setnextlist(sclass::mergeq ($7->getnextlist(), temp));//exection of the whole block corresponds to execution of non terminal
		
	}
	| IF '(' expression ')' M statement N ELSE M statement {
		sclass::backpatch ($7->getnextlist(), sclass::nextinstr());
		expr::convert2bool($3);
		$$=new statement();
		sclass::backpatch ($3->gettruelist(), $5);
		sclass::backpatch ($3->getfalselist(), $9);//if condition false statement after M is executed
			deque<int> temp = sclass::mergeq ($6->getnextlist(), $7->getnextlist());
		$$->setnextlist(sclass::mergeq (temp, $10->getnextlist()));
	}
	| SWITCH '(' expression ')' statement
	{}
	;

iteration_statement 	
	: WHILE M '(' expression ')' M statement { 
		$$ = new statement();
		expr::convert2bool($4);//we first convert the condition within for loop to intermediate code
		sclass::backpatch($7->getnextlist(), $2);//since after statement we need to get back to loop
		sclass::backpatch($4->gettruelist(), $6);//if condition true goto statement
		sclass::backpatch($4->getfalselist(),sclass::nextinstr()+1);
		$$->setnextlist($4->getfalselist());//if condition false break out of loop
		quadstore::emit (GOTOOP, tostr($2));
	}
	| DO M statement M WHILE '(' expression ')' ';' {//similar to above
		$$ = new statement();
		expr::convert2bool($7);
		sclass::backpatch ($7->gettruelist(), $2);
		sclass::backpatch ($3->getnextlist(), $4);
		//sclass::backpatch($7->getfalselist(),sclass::nextinstr()+1);
		$$->setnextlist($7->getfalselist());

	}
	| FOR '(' expression_statement M expression_statement ')' M statement {
		$$ = new statement();
		expr::convert2bool($5);//we first convert the condition within for loop to intermediate code
		sclass::backpatch ($5->gettruelist(), $7);//go to statement after execution of expression_statement 
		sclass::backpatch ($8->getnextlist(), $4);//return to condition after statement
		sclass::backpatch($5->getfalselist(),sclass::nextinstr()+1);
		quadstore::emit (GOTOOP, tostr($4));
		$$->setnextlist( $5->getfalselist());//when condition is false break out of for loop
	}
	| FOR '(' expression_statement M expression_statement M expression N ')' M statement {//similar to above
		$$ = new statement();
		expr::convert2bool($5);
		sclass::backpatch ($5->gettruelist(), $10);
		sclass::backpatch ($8->getnextlist(), $4);
		sclass::backpatch($5->getfalselist(),sclass::nextinstr()+1);
		sclass::backpatch ($11->getnextlist(), $6);
		quadstore::emit (GOTOOP, tostr($6));
		$$->setnextlist($5->getfalselist());

	}
	;

jump_statement 
	: GOTO IDENTIFIER ';' {}
	| CONTINUE ';' {}
	| BREAK ';' {}
	| RETURN ';' {
		$$ = new statement();
			quadstore::emit(_RETURN,"");
	}
	| RETURN expression ';'{
		$$ = new statement();
		quadstore::emit(_RETURN,$2->getsymp()->getname());			

	}
	;

translation_unit
	: external_declaration 
	| translation_unit external_declaration {
	}
	;

external_declaration
	: function_definition
	| declaration
	;

function_definition
	: declaration_specifiers declarator declaration_list CST compound_statement {

	}
	| declaration_specifiers declarator CST compound_statement {
		quadstore::emit (FUNCEND, symbol_table->gettname());
		symbol_table->setparent(gTable);
		sclass::changeTable (gTable);
	}
	;
declaration_list
	: declaration
	| declaration_list declaration
	{}
	;

%%

void yyerror(const char *s) {
	printf ("ERROR: %s",s);
}
