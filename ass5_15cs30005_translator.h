//	file name:ass5_15cs30005_translator.h	author: atharva vyas
#ifndef TRANSLATORH
#define TRANSLATORH
#define size_of_char 		1
#define size_of_int  		4
#define size_of_double		8
#define size_of_pointer		4
#include <bits/stdc++.h>
extern  char* yytext;
extern  int yyparse();

using namespace std;

//class declarations

class sym_row;						
class sym_table;
class sym_type;									
class quad;						
class quadstore;		

////////////////////////////////////////////////////////////

enum data_type {
_VOID, _CHAR, _INT, _DOUBLE, PTR, ARRRAY,_MATRIX_}; 	
enum optype { EQUAL, 
LT, GT, LE, GE, EQOP, NEOP,
GOTOOP, _RETURN,
ADD, SUB, MULT, DIVIDE, RIGHTSHIFT, LEFTSHIFT, MODOP,
UMINUS, UPLUS, ADDRESS, RIGHT_POINTER, BNOT, LNOT,
BAND, XOR, INOR,
PTRL, PTRR,
ACESSR, ACESSL,//acess elements according to address
PARAM, CALL, LABEL,
TRANSPOSEO,FUNCEND,EQUALSTR,EQUALCHAR,FUNC
};


////////////////////////////////////////////////////////////
class sym_type { // Type of an element in symbol table
private:
	
	data_type cat; //represents the data_type like _Double ,_Matrix_ etc
	int width; //for handling arrays which is not done		
	int rows; //rows and cols attribute to handle matrices
	int cols;
	int istranspose; //if transpose operation is just after the variable
	sym_type* ptr; //if it is a pointer pointing to other kind of sym_type object			 
public:
	void setwidth(int width);//setter gettter functions
	int getwidth();
	void setrows(int rows);
	int getrows();
	void setcols(int cols);
	int getcols();
	void setistranspose(int istranspose);
	int getistranspose();
	void setptr(sym_type* ptr);
	sym_type* getptr();
	sym_type(data_type cat, sym_type* ptr = NULL, int width = 1,int rows=0,int cols=0);//constructor
	void setcat(data_type cat);
	data_type getcat();
	friend ostream& operator<<(ostream&,sym_type);//operator overloading for printing
};
//represents a particular row
class sym_row {
private:
	string name;//attributes needed to display for a table				
	sym_type *type;			
public://attributes needed for symbol table can be public
	vector<string> init;					
	string category;			
	int size;				
	int offset;				
	sym_table* nested_table;		

	void setname(string name);//setter and getter functions
	string getname();
	void setinit(vector<string> init);
	vector<string> getinit();
	void setcategory(string category);
	string getcategory();
	void setsize(int size);
	int getsize();
	void setoffset(int offset);
	int getoffset();
	void setnest(sym_table* nested_table);
	sym_table* getnest();
	sym_row (string, data_type t=_INT, sym_type* ptr = NULL, int width = 0,int rows=0,int cols=0); // constructor
	sym_row* update(sym_type * t); 	// Update the type and size using type object 
	sym_row* update(data_type t); 	// Update the type and size using raw data type
	sym_row* initialize (vector<string>);
	friend ostream& operator<<(ostream&,sym_row*);
	sym_row* linkst(sym_table* t);//updates the nested table attribute

	void settype(sym_type* type);
	sym_type* gettype();
};

class sym_table { // Symbol Table
public:
	string table_name;			// Name of Table
	int tcount;				// last count of temporary variable used by symbol_table
	deque <sym_row> table; 			// The collection of rows 
	sym_table* parent;
///
	map<string, int> ar;			//activation record
	void settname(string table_name);      //setter and getter
	string gettname();
	void settcount(int tcount);
	int  gettcount();
	void settable(deque<sym_row> table);
	deque<sym_row> gettable();
	void setparent(sym_table* parent);
	sym_table* getparent();
	sym_table (string name="");
	sym_row* lookup (string name);		// Lookup for a symbol in symbol table
	static sym_row* gentemp (data_type t=_INT,vector<string> init=vector<string>(101));// Generate a temporary variable using dat_type and insert it in symbol table  returning the corresponding sym_row inserted
	static sym_row* gentemp (sym_type* t, vector<string> init=vector<string>(101));	// Generates a temporary variable using symtype object and insert it in symbol table returning the corresponding sym_row inserted
	static string vectortostring(vector<string> v);			//function to print vector
	void print(int all = 0);					// Print the symbol table
	void computeOffsets();						// Compute offset of the whole symbol table recursively
};

class quad { // single quad
private:
	optype op;					
	string arg1;				
	string arg2;				
	string result;				
public:
	void setop(optype op);
	optype getop();
	void setresult(string result);
	string getresult();
	void setarg1(string arg1);
	string getarg1();	
	void setarg2(string arg2);
	string getarg2();		
	void print ();				// Print Quads
	void update (int addr);			// Used for backpatching address the value of the target of goto is updated
	quad (string result, string arg1, optype op = EQUAL, string arg2 = "");//constructor
	quad (string result, int arg1, optype op = EQUAL, string arg2 = "");//constructor
};

class quadstore { // Quad Array
public:
	vector <quad> array;;		// Vector of quad i.e consists of all quads in table
	quadstore () {array.reserve(500);}
	void print ();	// Prints all the quads in instruction format
	void printtab();
	static void emit(optype opL, string result, string arg1="", string arg2 = "");//adds the appropriate quad in the table
        static void emit(optype op, string result, int arg1, string arg2 = "");	//overloaded constructor
	void setarray(vector<quad> array);
	vector<quad> getarray();				
};

class expr {
public:
	bool isbool;					// describes if the expression is boolean or not
	sym_row* symp;					// Pointer to the symbol table entry
	deque<int> truelist;				// Truelist contains instruction line to go if bool expr is true
	deque<int> falselist;				// Falselist contains instruction line to go if bool expr is false
	deque<int> nextlist;
public:
		
	void setnextlist(deque<int> nextlist);		//setter and getter
	deque<int> getnextlist();
	void settruelist(deque<int> truelist);
	deque<int> gettruelist();
	void setfalselist(deque<int> falselist);
	deque<int> getfalselist();
	void setisbool(bool isbool);
	bool getisbool();
	void setsymp(sym_row* symp);
	sym_row* getsymp();	
	static expr* convert2bool (expr*);				// convert any expression to bool
	static expr* convertfrombool (expr*);				// convert bool to expression
};
class statement {
public:
		deque<int> nextlist;				// Nextlist denotes the instruction line corresponding goto 
public:
		void setnextlist(deque<int> nextlist);		//setter and getter
		deque<int> getnextlist();
};

class unary {
public:
	data_type cat;				//the data type category coreesponding to unary expression	
	sym_row* loc;				// attribute used for computing address to be extracted from matrix
	sym_row* symp;				// Pointer to symbol table
	sym_type* type;				// type of the matrix generated here it is double
public:
	void setsymp(sym_row* symp);
	sym_row* getsymp();
	void settype(sym_type* type);
	sym_type* gettype();
	void setloc(sym_row* loc);
	sym_row* getloc();
	void setcat(data_type cat);
	data_type getcat();
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class sclass//class consisting of all static functions
{
public:
	static string NumberToString(int);		// Converts a number to string mainly used for storing numbers
	static sym_row* conv (sym_row*, data_type);	// Conversion of symbol row type to different type
	static int sizeoftype (sym_type*); 		// Calculates size of type of entry in symbol_row 
	static deque<int> mergeq (deque<int> , deque <int> );// Merge two lists	
	static void backpatch (deque <int>, int);	//update every element in the goto list with target instruction 
	static deque<int> makelist (int);		//makes a new target list with just one instruction containing that given in constructor
	static string convert_to_string (sym_type*);		// For printing type structure
	static bool typecheck(sym_row* s1, sym_row* s2);	// Checks if two symbbol table entries have same type
	static bool typecheck(sym_type* s1, sym_type* s2);	// Check if the type objects are equivalent	
	static void changeTable (sym_table* newtable);		//Changes the current symbol table
	static int nextinstr();					// Returns the address of the next instruction
	static string optostr(int op);				//prints operator in string format
};

////////////////////////////////////////////////////////////////////////
extern sym_table* gTable;			// Global Symbbol Table
extern sym_table* symbol_table;			// Global Current Symbbol Table
extern quadstore qarr;				// Global Quad Storage
extern sym_row* currentsym_row;			// Pointer to just encountered symbol
////////////////////////////////////////////////////////////////////////
// Utility function
template <typename T> string tostr(T t) { //converts any input to string type
   ostringstream os; 
   os<<t; 
   return os.str(); 
} 
#endif
