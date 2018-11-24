
#include <stdio.h>
#include <sys/time.h>


void t1()
{
	int a = 0;
	int b = 1;
	int c = 2;

	for(int i=0; i < 11; i++)
	{	
		a = a +1;
		a = a +b;
	}
}

int main()
{
	struct timeval begTick;
	struct timeval endTick;
	gettimeofday(&begTick, NULL);

	int a = 0;
	int b = 1;
	int c = 2;

	for(int i=0; i<5000; i++)
	{
		a = a +1;
		b = b /a;
		c = a + c;
		t1();
		a = a +b;
		b = b *c;
		c = a + a;
	}
	
	printf(" [target finished!]\n");
	gettimeofday(&endTick, NULL);
	printf(" [target] Execution Time: %ld\n", (endTick.tv_sec - begTick.tv_sec) * 1000000 + (endTick.tv_usec - begTick.tv_usec));

	
}

