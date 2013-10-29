#include <stdio.h>
#include <stdlib.h>
/*Closure definitions*/
typedef void *(*generic_function)(void *p,...);
typedef struct {
  generic_function function;
  void *environment;
} closure;

int nextval(void *environment);
closure make_counter(int starval)
{
  closure c;
  int *value = malloc(sizeof(int));
  *value = startval;
  c.funtion = (generic_function)nextval;
  c.environment = value;
  return c;
}

int nextval(void *environment)
{
  int *value = environment;
  (*value)++;
  return (*value);
}

int main()
{
  closure my_counter = make_counter(2);
  closure my_other_counter = make_counter(3);
  printf("The next value is %d\n",((generic_function)my_counter.funtion)(my_counter.environment));
  printf();
  printf();
}
