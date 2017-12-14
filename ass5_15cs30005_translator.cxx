// file name:ass5_15cs30005_translator.cxx author: atharva vyas
//symbol_table used merge function used
#include "ass5_15cs30005_translator.h"

////////////////////global variables//////////////

sym_table* gTable;					
quadstore qarr;						
data_type TYPE;					
sym_table* symbol_table;					
sym_row* currentsym_row; 		
int rowison=0;
char colseperator='|';
//////////////////////////////////////////////////
int  sclass::sizeoftype (sym_type* t){//returns size of the input symbol row entry type
  if(t->getcat() == _VOID)
    return 0;
  if(t->getcat() == FUNC)
    return 0;
  if(t->getcat() == _CHAR)
    return 1;
  if(t->getcat() == _INT)
    return 4;
  if(t->getcat() == PTR)
    return 4;
  if(t->getcat() == _DOUBLE)
    return 8;
  if(t->getcat() == ARRRAY)
    return t->getwidth() *  sclass::sizeoftype (t->getptr());
  if(t->getcat() == _MATRIX_)
    return 8+(t->getrows())*(t->getcols())*8;
}
///arr printing changed as per matrix print
string sclass::convert_to_string (sym_type* t){//converts into string for the given symtype
  switch (t->getcat()) {
  case _VOID:
    return "void";
  case _CHAR:
    return "char";
  case _INT:
    return "int";
  case _DOUBLE:
    return "double";
		
  case FUNC:
    return "function";
		
  }
  if( t->getcat() ==PTR)
    return "pointer("+ sclass::convert_to_string(t->getptr())+")";
  if( t->getcat() ==ARRRAY)
    return "arr(" + tostr(t->getwidth()) + ","+ tostr(t->getptr()->getwidth()) + ",double)";
  if(t->getcat() == _MATRIX_)
  return "matrix(" + tostr(t->getrows()) + ", "+ tostr(t->getcols()) + ",double)";
  if (t==NULL) return "null";
  return "default type";
}
//changed from list to deque
sym_type::sym_type(data_type cat, sym_type* ptr, int width,int rows,int cols): 
  cat (cat), 
  ptr (ptr), 
  width (width),
  rows(rows),
  cols(cols) {};
sym_row* sym_table::lookup (string name) {
  sym_row* s;
  deque <sym_row>::iterator it;
  for (it = table.begin(); it!=table.end(); it++) {
    if (it->getname() == name ) break;
  }
  if (it!=table.end() ) {
    return &*it;
  }
  else {
    s =  new sym_row (name);
    s->setcategory("local");
    table.push_back (*s);
    return &table.back();		
  }
}
sym_row* sym_table::gentemp (data_type t,vector<string> init) {
  char n[40];
   symbol_table->settcount(symbol_table->gettcount()+1);
  sprintf(n, "t%02d",symbol_table->gettcount());
  sym_row* s = new sym_row (n, t);
 char *stringarray[]={""};
std::vector<std::string> tempinit(stringarray,stringarray+1);
 if(init.size()==101)
   s->setinit(tempinit);
 else
  s->setinit(init);
  s->setcategory("temp");
  if(t==_MATRIX_)
	symbol_table->settcount(symbol_table->gettcount()-1);
  else
  symbol_table->table.push_back ( *s);
  return &symbol_table->table.back();
}
sym_row* sym_table::gentemp (sym_type* t,vector<string> init) {
  char n[40];
  symbol_table->settcount(symbol_table->gettcount()+1);
  sprintf(n, "t%d",symbol_table->gettcount());
	
  sym_row* s = new sym_row (n,t->getcat(),NULL,0,t->getrows(),t->getcols());
  
   char *stringarray[]={""};
std::vector<std::string> tempinit(stringarray,stringarray+1);
 if(init.size()==101)
	{
	s->settype(t);
   s->setinit(tempinit);
}
 else
	{
	 if((init)[0]=="transpose")
	{
	s = new sym_row (n,t->getcat(),NULL,0,t->getcols(),t->getrows());
	s->gettype()->setistranspose(1);
	s->setsize(t->getrows()*t->getcols()*8 + 8);
	}
  if((init)[0]!="transpose")
	{
	s->settype(t);
  s-> setinit(init);
	}
}
	 
  s->setcategory("temp");
	if(init.size()>1 ||(t->getcat()==_MATRIX_ && init[0]=="matrix_temp") || (t->getcat()!=_MATRIX_ || init[0]=="transpose")){
        symbol_table->table.push_back ( *s);
    }
    else{
	 symbol_table->settcount(symbol_table->gettcount()-1);
    }
  return &symbol_table->table.back();
}
string sym_table::vectortostring(vector<string> v)
{
  string buffer="";
  for(int i=0;i<v.size();++i)
    {
      buffer=buffer+v[i];
    }
  return buffer;
}
///width changed
sym_table::sym_table (string name): table_name (name), tcount(0) {}
void sym_table::print(int all) {
  deque<sym_table*> tablelist;
  cout << "Symbol Table: " << setfill (' ') << left << setw(35)  << this -> table_name  << "\n";;
  cout << left << setw(15) << "parent: ";
  if (parent!=NULL)
    cout << parent->gettname();
  else cout << "null" ;
  cout << endl;
  cout << setfill (' ') << left << setw(16) << "Name";
  cout << left << setw(36) << "Type";
  cout << left << setw(40) << "Initial Value";
  cout << left << setw(8) << "Size";
  cout << left << setw(8) << "Offset";
  cout << left << "Nested Table" << endl;
  cout << setw(120) << setfill ('-') << "-"<< setfill (' ') << endl;
  deque <sym_row>::iterator it;
  it=table.begin();
  while(it!=table.end()) {
    
    if (it->getnest()!=NULL) 
	{tablelist.push_back (it->getnest());
	}
	cout << &*it;
    it++;
  }
  cout << endl;
  if (all) {
    deque<sym_table*>::iterator iterator;
    iterator= tablelist.begin();
    while(iterator != tablelist.end())
	{
	 
      (*iterator)->print();
	++iterator;
	}
    }		
  
}
void sym_table::computeOffsets() {
  deque<sym_table*> tablelist;
  int off;
  for (deque <sym_row>::iterator it = table.begin(); it!=table.end(); it++) {
    if (it==table.begin()) {
      it->setoffset(0);
      off = it->getsize();
    }
    else {
      it->setoffset(off);
      off = it->getoffset() + it->getsize();
    }
    if (it->getnest()!=NULL) tablelist.push_back (it->getnest());
  }
  for (deque<sym_table*>::iterator iterator = tablelist.begin(); 
       iterator != tablelist.end(); 
       ++iterator) {
    (*iterator)->computeOffsets();
  }
}
sym_row* sym_row::linkst(sym_table* t) {
  nested_table = t;
  category = "function";
  return this;
}

ostream& operator<<(ostream& os,sym_type* t) {//for printing sym_type
  data_type cat = t->getcat();
  string stype = sclass::convert_to_string(t);
  os << stype;
  return os;
}

ostream& operator<<(ostream& os,sym_row* it) {//for printing rows
  os << left << setw(16) << it->getname();
  os << left << setw(36) << it->gettype();
  if((it->getinit())[0]!="matrix_temp")
  os << left << setw(40) << sym_table::vectortostring(it->getinit());
  else
  os << left << setw(40) << "";
  os << left << setw(8) << it->getsize();
  os << left << setw(8) << it->getoffset();
  os << left;
  if (it->getnest() == NULL) {
    os << "null" <<  endl;	
  }
  else {
    os << it->getnest()->gettname() <<  endl;
  }
  return os;
}
quad::quad (string result, string arg1, optype op, string arg2):
  result (result), arg1(arg1), arg2(arg2), op (op){};

quad::quad (string result, int arg1, optype op, string arg2):
  result (result), arg2(arg2), op (op) {
  this->setarg1(sclass::NumberToString(arg1));
}
sym_row::sym_row (string name, data_type t, sym_type* ptr, int width,int rows,int cols): name(name)  {
  type = new sym_type (sym_type(t, ptr, width,rows,cols));
  nested_table = NULL;
  category = "";
  offset = 0;
  vector<string> temp;
  temp.push_back("");
  init = temp;
  size =  sclass::sizeoftype(type);
}
sym_row* sym_row::initialize (vector<string> init) {
  this->init = init;
  return this;
}
sym_row* sym_row::update(sym_type* t) {
  type = t;
  size =  sclass::sizeoftype(t);
  return this;
}
sym_row* sym_row::update(data_type t) {
  type = new sym_type(t);
  size =  sclass::sizeoftype(type);
  return this;
}
void quad::update (int addr) {	// Used for backpatching address
  result = addr;
}
void quad::print () {
  string s;
  if (op==FUNCEND) 		cout << "";
  bool binaryop=false,relationalop=false,unaryop=false,shiftop=false;
	binaryop=true;
  if(op==EQOP || op==NEOP || op==LT || op==GT || op==GE || op==LE || op==GOTOOP)
	relationalop=true;
  if(op==LEFTSHIFT || op==EQUAL || op==RIGHTSHIFT)
	shiftop=true;
  if(op==ADDRESS || op==PTRR || op==PTRL || op==UMINUS || op==BNOT || op==LNOT || op==ACESSR || op==ACESSL || op==_RETURN || op==PARAM ||op==LABEL ||op==CALL)
	relationalop=true;
  if(op==TRANSPOSEO)
	{
	cout << result << "=" << arg1 << ".'" << "\n";
	return;
	}
  if(binaryop)
	s=result+"="+arg1;
  if(relationalop)
	s="if "+arg1;
  switch(op) {
  if(binaryop){
  case ADD:			cout << s+" + " + arg2;				break;
  case SUB:			cout << s+" - " +arg2;				break;
  case MULT:			cout << s+" * " +arg2;				break;
  case DIVIDE:		        cout << s+" / " +arg2;				break;
  case MODOP:			cout << s+" % " +arg2;			break;
  case XOR:			cout << s+" ^ " +arg2;					break;
  case INOR:			cout << s+" | " +arg2;					break;
  case BAND:			cout << s+" & " +arg2;					break;
  }
  else if(relationalop){
    // Relational Operations
  case EQOP:			cout << s + " == " + arg2 + " goto " + result;				break;
  case NEOP:			cout << s + " != " + arg2 + " goto " + result;			break;
  case LT:			cout << s + " < " + arg2 + " goto " + result;				break;
  case GT:			cout << s + " > " + arg2 + " goto " + result;			break;
  case GE:			cout << s + " >= " + arg2 + " goto " + result;				break;
  case LE:			cout << s + " <= " + arg2 + " goto " + result;			break;
  case GOTOOP:		         cout << "goto " << result;								break;
  }
  else if(unaryop){
  case ADDRESS:		cout << result + " = &" + arg1;				break;
  case PTRR:			cout << result	+ " = *" + arg1 ;				break;
  case PTRL:			cout << "*" + result	+ " = " + arg1 ;		break;
  case UMINUS:		cout << result 	+ " = -" + arg1;				break;
  case BNOT:			cout << result 	+ " = ~" + arg1;				break;
  case LNOT:			cout << result 	+ " = !" + arg1;				break;

  case ACESSR:	 	if(arg1==arg2)
			cout << result + "=" +arg1;
			else	
			cout << result + " = " + arg1 + "[" + arg2 + "]";			break;
  case ACESSL:	 	if(result==arg1)
			cout << result + "="  + arg2;
			else	
			cout << result + "[" + arg1 + "]" +" = " +  arg2;			break;
  case _RETURN: 		cout << "ret " + result;				break;
  case PARAM: 		cout << "param " + result;				break;
  case CALL: 			cout << result + " = " + "call " + arg1+ ", " + arg2;				break;
  case LABEL:			cout << result + ": ";					break;
  }
  else if(shiftop){
  case LEFTSHIFT:		cout << result + " = " + arg1 + " << " + arg2;				break;
  case RIGHTSHIFT:		cout << result + " = " + arg1 + " >> " + arg2;				break;
  case EQUAL:			cout << result + " = " + arg1 ;								break;
  case EQUALSTR:  cout <<result+" "+"="+" " +arg1 ; break;
 }
  
  default:			cout << ""; break;							break;
  }
  cout << endl;
}
void sclass::backpatch (deque <int> l, int addr) {
  for (deque<int>::iterator it= l.begin(); it!=l.end(); it++) (qarr.array)[*it].setresult(tostr(addr));
}
void quadstore::print () {
  cout << setw(24) << setfill (' ') << " "<< endl;
  cout << "quad translation table" << endl;
  cout << setw(24) << setfill (' ') << " "<< setfill (' ') << endl;
  for (vector<quad>::iterator it = array.begin(); it!=array.end(); it++) {
   
	if (it->getop() ==FUNC) {
			cout << "\n";
			it->print();
			cout << "\n";
		}
		else if (it->getop() == FUNCEND) {}
		else {
			cout << "\t" << setw(4) << it - array.begin() << ":\t";
			it->print();
		}
  }
  cout << setw(24) << setfill (' ') << " "<< endl;
}
void quadstore::printtab() {
	cout << "quad table" << endl;
	cout << setw(8) << " op";
	cout << setw(15) << "arg 1";
	cout << setw(15) << "arg 2";
	cout << setw(15) << "result" << endl;
	for (vector<quad>::iterator it = array.begin(); it!=array.end(); it++) {
		cout << left << setw(8) << sclass::optostr(it->getop());
		cout << left << setw(15) << it->getarg1();
		cout << left << setw(15) << it->getarg2();
		cout << left << setw(15) << it->getresult() << endl;
	}
}
string sclass::optostr (int op) {//coverts the integer code of op to string
		if(op==ADD) return " + ";
		if(op==SUB) return " - ";
		if(op==MULT) return " * ";
		if(op==DIVIDE) return " / ";
		if(op==GOTOOP)	return " goto ";
		if(op==ADDRESS)	return " &";
		if(op==UMINUS) return " -";
		if(op==ACESSL) return "[]=";
		if(op==ACESSR) return " =[]";
		if(op==_RETURN)	return " ret";
		if(op==PARAM) return " param ";
		if(op==CALL) return " call ";
		if(op==PTRR) return " *R";
		if(op==PTRL) return " *L";
		if(op==EQUAL) return " = ";
		if(op==EQUALSTR)    return " = ";
		if(op==EQOP) return " == ";
		if(op==NEOP) return " != ";
		if(op==BNOT) return " ~";
		if(op==LNOT) return " !";
		if(op==LT) return " < ";
		if(op==GT) return " > ";
		if(op==GE) return " >= ";
		if(op==LE) return " <= ";
		return "  ";
}
void quadstore::emit(optype op, string result, string arg1, string arg2) {
	vector<quad> temp=qarr.getarray();
	
  temp.push_back(*(new quad(result,arg1,op,arg2)));
	qarr.setarray(temp);
}
void quadstore::emit(optype op, string result, int arg1, string arg2) {
	vector<quad> temp=qarr.getarray();
  temp.push_back(*(new quad(result,arg1,op,arg2)));
	qarr.setarray(temp);
}
//definitions for setter getter for data encapsulation
void statement::setnextlist(deque<int> nextlist)
		{
			this->nextlist=nextlist;
		}
deque<int> statement::getnextlist()
		{
			return this->nextlist;
		}
void expr::setnextlist(deque<int> nextlist)
		{
			this->nextlist=nextlist;
		}
deque<int> expr::getnextlist()
		{
			return this->nextlist;
		}
void expr::settruelist(deque<int> truelist)
		{
			this->truelist=truelist;
		}
deque<int> expr::gettruelist()
		{
			return this->truelist;
		}
void expr::setfalselist(deque<int> falselist)
		{
			this->falselist=falselist;
		}
deque<int> expr::getfalselist()
		{
			return this->falselist;
		}
void expr::setisbool(bool isbool)
		{
			this->isbool=isbool;
		}
bool expr::getisbool()
		{
			return this->isbool;
		}
void expr::setsymp(sym_row* symp)
		{
			this->symp=symp;
		}
sym_row* expr::getsymp()
		{
			return this->symp;
		}
void unary::setsymp(sym_row* symp)
		{
			this->symp=symp;
		}
sym_row* unary::getsymp()
		{
			return this->symp;
		}
void unary::settype(sym_type* type)
		{
			this->type=type;
		}
sym_type* unary::gettype()
		{
			return this->type;
		}
void unary::setloc(sym_row* loc)
		{
			this->loc=loc;
		}
sym_row* unary::getloc()
		{
			return this->loc;
		}
void unary::setcat(data_type cat)
		{
			this->cat=cat;
		}
data_type unary::getcat()
		{
			return this->cat;
		}
void sym_row::settype(sym_type* type)
		{
			this->type=type;
		}
sym_type* sym_row::gettype()
		{
			return this->type;
}
void sym_type::setcat(data_type cat)
		{
			this->cat=cat;
		}
data_type sym_type::getcat()
		{
			return this->cat;
		}
void quadstore::setarray(vector<quad> array)
		{
			this->array=array;
		}
vector<quad> quadstore::getarray()
		{
			return this->array;
		}
void quad::setop(optype op)
		{
			this->op=op;
		}
optype quad::getop()
		{
			return this->op;
		}
void quad::setresult(string result)
		{
			this->result=result;
		}
string quad::getresult()
		{
			return this->result;
		}
void quad::setarg1(string arg1)
		{
			this->arg1=arg1;
		}
string quad::getarg1()
		{
			return this->arg1;
		}
void quad::setarg2(string arg2)
		{
			this->arg2=arg2;
		}
string quad::getarg2()
		{
			return this->arg2;
		}
void sym_type::setwidth(int width)
{
	this->width=width;
}
int sym_type::getwidth()
{
	return this->width;
}
void sym_type::setrows(int rows)
{
	this->rows=rows;
}	
int sym_type::getrows()
{
	return this->rows;
}
void sym_type::setcols(int cols)
{
	this->cols=cols;
}
int sym_type::getcols()
{
	return this->cols;
}
void sym_type::setistranspose(int istranspose)
{
	this->istranspose=istranspose;
}
int sym_type::getistranspose()
{
	return this->istranspose;
}
void sym_type::setptr(sym_type* ptr)
{
	this->ptr=ptr;
}
sym_type* sym_type::getptr()
{
	return this->ptr;
}
void sym_table::settname(string table_name)
{
	this->table_name=table_name;
}
string sym_table::gettname()
{
	return this->table_name;
}
void sym_table::settcount(int tcount)
{
	this->tcount=tcount;
}
int  sym_table::gettcount()
{
	return this->tcount;
}
void sym_table::settable(deque<sym_row> table)
{
	this->table=table;
}
deque<sym_row> sym_table::gettable()
{
	return this->table;
}
void sym_table::setparent(sym_table* parent)
{
	this->parent=parent;
}
sym_table* sym_table::getparent()
{
	return this->parent;
}
void sym_row::setname(string name)
{
	this->name=name;
}
string sym_row::getname()
{
	return this->name;
}
void sym_row::setinit(vector<string> init)
{
	this->init=init;
}
vector<string> sym_row::getinit()
{
	return this->init;
}
void sym_row::setcategory(string category)
{
	this->category=category;
}
string sym_row::getcategory()
{
	return this->category;
}
void sym_row::setsize(int size)
{
	this->size=size;
}
int sym_row::getsize()
{
	return this->size;
}
void sym_row::setoffset(int offset)
{
	this->offset=offset;
}
int sym_row::getoffset()
{
	return this->offset;
}
void sym_row::setnest(sym_table* nested_table)
{
	this->nested_table=nested_table;
}
sym_table* sym_row::getnest()
{
	return this->nested_table;
}
deque<int>  sclass::sclass::makelist (int i) {//intialize the list with the input
  deque<int> l(1,i);
  return l;
}
deque<int>  sclass::mergeq (deque<int> a, deque <int> b) {//combine the lists and return
  merge(a.begin(),a.end(),b.begin(),b.end(),a.begin());
  return a;
}
int sclass::nextinstr() {//return the size of collection of quads that is the address of upcoming instruction
  return qarr.getarray().size();
}
string sclass::NumberToString ( int Number ) {//converts number to string
  ostringstream ss;
  ss << Number;
  return ss.str();
}
expr* expr::convert2bool (expr* e) {	// Convert any expression to bool by having conditional gotos
  if (!e->getisbool()) {
    e->setfalselist(sclass::makelist (sclass::nextinstr()));
     quadstore::emit (EQOP, "", e->getsymp()->getname(), "0");
    e->settruelist(sclass::makelist (sclass::nextinstr()));
     quadstore::emit (GOTOOP, "");
  }
  return e;
}
expr* expr::convertfrombool (expr* e) {	// Convert any expression to bool
  cout << "cfb\n";
  if (e->getisbool()) {
    e->setsymp(sym_table::gentemp(_INT));
     sclass::backpatch (e->gettruelist(), sclass::nextinstr());
     quadstore::emit (EQUAL, e->getsymp()->getname(), "true");
     quadstore::emit (GOTOOP, tostr (sclass::nextinstr()+1));
     sclass::backpatch (e->getfalselist(), sclass::nextinstr());
     quadstore::emit (EQUAL, e->getsymp()->getname(), "false");
  }
  return e;
}
bool sclass::typecheck(sym_row* s1, sym_row* s2){ 	// Check if the symbols have same type or not
  sym_type* type1 = s1->gettype();
  sym_type* type2 = s2->gettype();
  if ( sclass::typecheck (type1, type2) ) return true;
  if (s1 = sclass::conv (s1, type2->getcat()) ) return true;
  if (s2 = sclass::conv (s2, type1->getcat()) ) return true;
  return false;
}
bool sclass::typecheck(sym_type* t1, sym_type* t2){ 	// Check if the symbol types are same or not
  if (!(t1 == NULL && t2 == NULL)) {
    if (t1==NULL) return false;
    else if (t2==NULL) return false;
    else if (t1->getcat()==t2->getcat()) return (t1->getptr(), t2->getptr());
    else return false;
  }
  return true;
}

sym_row* sclass::conv (sym_row* s, data_type t) {//used in type conversion s is converted into type t
  sym_row* temp = sym_table::gentemp(t);
  switch (s->gettype()->getcat()) {
  case _INT: {
    if(t==_DOUBLE){
       quadstore::emit (EQUAL, temp->getname(), "int2double(" + s->getname() + ")");
      return temp;
    }
    else return s;
  }
  case _DOUBLE: {
    return s;
  }
  case _CHAR: {
    if(t==_INT){
       quadstore::emit (EQUAL, temp->getname(), "char2int(" + s->getname() + ")");
      return temp;
    }
    if(t==_DOUBLE){
       quadstore::emit (EQUAL, temp->getname(), "char2double(" + s->getname() + ")");
      return temp;
    }
    else return s;
  }
  }
  return s;
}
void sclass::changeTable (sym_table* newtable) {	// Change current symbol table
  symbol_table = newtable;
}
