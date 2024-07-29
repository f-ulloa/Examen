#include <stdio.h>
#include <unistd.h>

int main()
{
  int id = fork();

  int n;
  if (id == 0)
  {
    n = 0;
  }
  else
  {
    n = 5;
  }

  int i;
  for (i = n; i < n + 5; i++)
  {
    printf("Hello I'm: %d, contando: %d\n", id, i);
    fflush(stdout);
  }

  return 0;
}
