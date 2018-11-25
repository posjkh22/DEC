
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

void t2()
{
	int a = 1;
	int b = 2;
	int c = 3;

	a = a + 1;
	a = a * 3;
	b = b /a;
	c = a + c;
	a = a + 1;
	b = b /a;
	b = a + c;
	a = a + 1;
	a = c * 1;
	b = b /a;
	c = a + c;
	a = c + 1;
	a = c * 1;
	b = b /a;
	c = a + c;
	a = c + 1;


}

int main()
{
	struct timeval begTick;
	struct timeval endTick;
	gettimeofday(&begTick, NULL);

	int a = 0;
	int b = 1;
	int c = 2;

	for(int i=0; i<50; i++)
	{
		a = a +1;
		b = b /a;
		c = a + c;
		t1();
		a = a +b;
		b = b *c;
		c = a + a;
		t2();
	}
	
	printf(" [target finished!]\n");
	gettimeofday(&endTick, NULL);
	printf(" [target] Execution Time: %ld\n", (endTick.tv_sec - begTick.tv_sec) * 1000000 + (endTick.tv_usec - begTick.tv_usec));

	
}

