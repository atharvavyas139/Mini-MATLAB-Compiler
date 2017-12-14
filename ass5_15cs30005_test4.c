//test file to check various branching and loops
//Crucial Shortcoming->was not able to implement double declarations due to difficulty in using xmm registers
int printInt(int num);
int printStr(char *c);
int readInt(int *eP);
int main()
{
    Matrix mat[3][3]={1,2,3;4,5,6;7,8,9};
    int i=0;
    int j=0;
    int temp;
    printStr("printing 2 x 2 block of matrix through loops and conditions\n");
    while(i<2)
    {
	j=0;
	while(j<3)
	{
		if(j<2)
		{
			temp=mat[i][j];
			printInt(temp);
			printStr(",");
		}
		++j;
	}
	printStr("\n");
	++i;
    }
    return 0;
}
