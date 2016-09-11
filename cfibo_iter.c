// just wanted to see how this compiles vs my handmade solution
// clang -O3 cfibo_ites.c -o cfibo_iter

#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

uint64_t fib(uint64_t n) {
  uint64_t first = 0;
  uint64_t second = 1;
  uint64_t tmp;

  if(n <= 0)
    return 0;
  if(n == 1)
    return 1;

  for(uint64_t i = 2; i <= n; ++i) {
    tmp = second;
    second = first + second;
    first = tmp;
  }
  return second;
}

int main(int argc, char const *argv[]) {
  argc--;
  if(argc != 1) {
    printf("Need exactly one arg: the number of the fibonacci number to be computed\n");
  }

  int n = atoi(argv[1]);
  printf("%llu\n", fib(n));

  return 0;
}
