#include <stdio.h>
#include <stdlib.h>

int main()
{
	long long int step = 1e5;
	double sum = 0, x = 0;
	double dx = 1 / (double)step;
	int i = 0;

	for(i = 0; i < step ; i++)
	{
		x = (i + 0.5) / (double)step;

		sum += 4 / (1 + x * x) * dx;
	}

	printf("%.12f\n", sum);
	return 0;
}