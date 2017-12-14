//test file to check functioning of matrix operations
int printInt(int num);
int printStr(char *c);
int readInt(int *eP);
int main()
{
    Matrix mat[2][3]={1,2,3;4,5,6};
    Matrix p[3][2]={1,3;5,7;9,11};
    Matrix a[2][3]={2,4,6;8,10,12};
    Matrix trans[3][2];
    Matrix prod[2][2];
    Matrix add[2][3];
    Matrix sub[2][3];
    int i=0;
    int j=0;
    int t;
    //operations like matrix addition subtraction multiplication and transpose	
    add=mat+a;
    sub=mat-a;
    prod=mat*p;
    trans=mat.';

    printStr("Matrix mat:");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<3;++j)
		{
		     t=mat[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("Matrix a:");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<3;++j)
		{
		     t=a[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("Matrix p:");
    for(i=0;i<3;++i)
    {
	printStr("\n");
	for(j=0;j<2;++j)
		{
		     t=p[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("addition mat+a:");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<3;++j)
		{
		     t=add[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("subtraction mat-a:");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<3;++j)
		{
		     t=sub[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("multiplication: mat*p");
    for(i=0;i<2;++i)
    {
	printStr("\n");
	for(j=0;j<2;++j)
		{
		     t=prod[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    printStr("\n\n");
    printStr("transpose: mat.'");
    for(i=0;i<3;++i)
    {
	printStr("\n");
	for(j=0;j<2;++j)
		{
		     t=trans[i][j];
		     printInt(t);
		     printStr(" ");
		}
    }
    return 0;
}
