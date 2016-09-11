// just wanted to see how this compiles vs my handmade solution
// clang cfibo.c -o cfibo

#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

int64_t fib(int64_t n) {
  if(n <= 0)
    return 0;
  if(n == 1)
    return 1;
  return fib(n-1) + fib(n-2);
}

int main(int argc, char const *argv[]) {
  argc--;
  if(argc != 1) {
    printf("Need exactly one arg: the number of the fibonacci number to be computed\n");
  }

  int n = atoi(argv[1]);
  printf("%" PRIu64 "\n", fib(n));

  return 0;
}
