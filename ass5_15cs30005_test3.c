//testfile to check functioning of functions
//Crucial Shortcoming->was not able to implement double declarations due to difficulty in using xmm registers
int printInt(int num);
int printStr(char *c);
int readInt(int *eP);
int find_sum_row(int r)
{
	int i=0;
	int sum=0;
	Matrix fmat[3][3]={1,2,3;4,5,6;7,8,9};
	for(i=0;i<3;++i)
	{
		sum=sum+fmat[r][i];
	}
	return sum;
}
int main()
{
    int i;
    int temp;
    for(i=0;i<3;++i)
    {
	temp=find_sum_row(i);
	printStr("The sum for row");
	printInt(i);
	printStr(" is:");
	printInt(temp);
	printStr("\n");
    }
    return 0;
}
