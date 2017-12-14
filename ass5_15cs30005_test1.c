//test file to check functioning of declaration
//Crucial Shortcoming->was not able to implement double declarations due to difficulty in using xmm registers
int printInt(int num);
int printStr(char *c);
int readInt(int *eP);
int main()
{
    int i=3;
    char ch='a';
    printStr("value of i:\n");
    printInt(i);
    printStr("\n");
    Matrix m[3][3]={11,12,13;14,15,16;17,18,19};
    m[0][1]=12221;
    int r=0;
    int c=0;
    printStr("Matrix m:");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<3;++j)
		{
		     t=m[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n");
    return 0;
}
