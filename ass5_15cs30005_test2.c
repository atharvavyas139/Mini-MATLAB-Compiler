//test file to check user input and matrix creation from user
//Crucial Shortcoming->was not able to implement double declarations due to difficulty in using xmm registers
int printInt(int num);
int printStr(char *c);
int readInt(int *eP);
int main()
{
    int i=0;
    int j=0;
    int temp,l,t;
    Matrix input_mat[3][2];
    printStr("we will create a 3*2 matrix rows=3 and cols=2\n");
    printStr("Type elements in row major form i.e elements of a particular row first with newline between any two numbers\n:");
     for(i=0;i<3;++i)
    {
	for(j=0;j<2;++j)
		{
		   readInt(&temp);
		   input_mat[i][j]=temp;
		}
    }

    printStr("The matrix input by user\n");
    for(i=0;i<3;++i)
    {
	printStr("\n");
	for(j=0;j<2;++j)
		{
		     t=input_mat[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    return 0;
}
