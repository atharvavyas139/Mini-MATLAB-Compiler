int printStr(char *str)
{
  //char buffer[30];
  int i=0;
  int b=1;
  while(str[i]!='\0')
    {
      ++i;
    }
  __asm__ __volatile__("movq $1, %%rax \n\t"
		       "movq $1, %%rdi \n\t"
		       "syscall\n\t"
		       :
		       :"S"(str),"d"(i)
		       );
  return i;//length of string is returned
}
int printInt(int n){
  char bufferr[20];//right alignment storage in buffer
  char bufferl[20];//left alignment storage in buffer
  int i=0,j,sz,bytes;
  if(n == 0)
    {
      bufferl[i]='0';
      ++i;
    }
  else
    {
      if(n < 0) 
	{
	  bufferr[i]='-';
	  ++i;
	  n=-n;
	}
      while(n!=0)
	{
	  bufferr[i] = (char)('0'+n%10);
	  n=n/10;
	  ++i;
	}
      if(bufferr[0]=='-')
	{
	  sz=i-1;
	  bufferl[0]=bufferr[0];
	  for(j=1;j<=sz;++j)
	    {
	      bufferl[j]=bufferr[sz-j+1];
	    }
	}
      else 
	{
	  sz=i-1;
	  for(j=0;j<=sz;++j)
	    {
	      bufferl[j]=bufferr[sz-j];
	    }
	}
    }
  bytes = i;
  __asm__ __volatile__ (
			"movq $1, %%rax \n\t"
			"movq $1, %%rdi \n\t"
			"syscall\n\t"
			:
			:"S"(bufferl), "d"(bytes)
			) ;  // $4: write, $1: on stdin
  return i;
}
int printFlt(double fl)
{
  char bufferr[20];//right alignment buffer
  char bufferl[20];//left alignment buffer
  char buffert[1];//buffer transform
  char bufferf[10];//storage for decimal parts
  int ds=0;//to detemine if decimal point has occured or not
  int i=0,j,sz,bytes;
  int countb=0,ns=0,x,tcount=0;
  long long iflt;//stores after decimal places are converted into long
  double flt=fl;
  if(flt<0)
    {
      ns=1;
    }
  if(ns==1)
    {
      flt=-flt;
    }
  if(flt>1)
    {
      while(flt-(int)flt > 0.000001)
	{
	  flt=flt*10;
	  ++countb;
	}
      
      iflt=(long)flt;
      if(flt<0.0000001)
	{
	  bufferl[i]='0';
	  ++i;
	}
      else
	{
	  while(iflt!=0)
	    {
	      bufferr[i] = (char)('0'+iflt%10);
	      iflt=iflt/10;
	      ++i;
	    } 
	  sz=i-1;
	  for(j=0;j<=sz;++j)
	    {
	      bufferl[j]=bufferr[sz-j];
	    }
	
	}
      for(x=i-countb;x<i;++x)
	{
	  bufferf[tcount]=bufferl[x];
	  ++tcount;
	}
  
      if(ns==1)//denotes that the number is negative
	{
	  bytes = 1;
	  buffert[0]='-';
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(buffert), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	}
      if(flt>0)
	{
	  bytes = i-countb;
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(bufferl), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	}
      if(countb>0)//prints number afer decimal point
	{
	  bytes = 1;
      
	  buffert[0]='.';
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(buffert), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	  bytes=countb;
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(bufferf), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	}
    }
  else
    {
      countb=7;
      flt=flt*10000000;
      iflt=(long)flt;
      if(flt<0.0000001)
	{
	  bufferl[i]='0';
	  ++i;
	}
      else
	{
	  while(i!=7)
	    {
	      bufferr[i] = (char)('0'+iflt%10);
	      iflt=iflt/10;
	      ++i;
	    }
	  sz=i-1;
	  for(j=0;j<=sz;++j)
	    {
	      bufferl[j]=bufferr[sz-j];
	    }
	
	}
      for(x=0;x<i;++x)
	{
	  bufferf[tcount]=bufferl[x];
	  ++tcount;
	}
  
      if(ns==1)
	{
	  bytes = 1;
	  buffert[0]='-';
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(buffert), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	}
      if(countb>0)
	{
	  bytes = 1;
      
	  buffert[0]='.';
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(buffert), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	  bytes=countb;
	  __asm__ __volatile__ (
				"movq $1, %%rax \n\t"
				"movq $1, %%rdi \n\t"
				"syscall\n\t"
				:
				:"S"(bufferf), "d"(bytes)
				) ;  // $4: write, $1: on stdin
	}
      
    }
  return i;//The number of characters in floating
}
int readInt(int *number)
{
  int sum=0;
  int count=0,ns=0,tsum=0,lcount=0,ans=0;
  int i=0;
  int nl=0;//newline character encountered or not
  while(1)
    {
      char buff[1];
      __asm__ __volatile__(
			   "movq $0, %%rax \n\t"
			   "movq $1, %%rdi \n\t"
			   "movq $1, %%rdx \n\t"
			   "syscall\n\t"
			   :
			   :"S"(buff)
			   );
      if(lcount==0)
	{
	  if(buff[0]=='-')
	    ns=1;
	  else if((int)buff[0]<48 || (int)buff[0]>57)
	    {
	      if(buff[0]=='\n')
		nl=1;
	      break;
	    }
	  else 
	    {
	      sum=sum+buff[0]-'0';
	      ++count;
	    }
	  ++lcount;
	}
      else
	{
	  if((int)buff[0]<48 || (int)buff[0]>57)
	    {
	      if(buff[0]=='\n')
		nl=1;
	      break;
	    }
	  else
	    {
	      tsum=buff[0]-'0';
	      for(i=0;i<count;++i)
		{
		  tsum=tsum*10;
		}
	      ++count;
	      sum=sum+tsum;
	    }
	}
    }
  // *number=sum;
  ans=0;
  lcount=0;
  count=count-1;
  while(sum!=0)
    {
      tsum=sum%10;
      sum=sum/10;
      for(i=0;i<count-lcount;++i)
	{
	  tsum=tsum*10;
	}
      ++lcount;
      ans=ans+tsum;
    }
  if(ns==1)
    ans=-ans;
  *number=ans;
  if(!nl)
    {
      while(1)
	{
	  char buff[1];
	  __asm__ __volatile__(
			       "movq $0, %%rax \n\t"
			       "movq $1, %%rdi \n\t"
			       "movq $1, %%rdx \n\t"
			       "syscall\n\t"
			       :
			       :"S"(buff)
			       );
      
	  if(buff[0]=='\n')
	    break;
	}
      return -1;
    }
  return count+1;
}
