#include <stdio.h>

#include "func.h"

int main(int argc, char *argv[]) {
  if (argc > 1) {
    printf("%d arguments: ", argc - 1);
    for (int i = 1; i < argc; i++) {
      printf("%s ", argv[i]);
    }
    printf("\n");
  }
  printf("Hello, world!\n");
  printf("func return %d\n", GiveMeFive());
  return 0;
}
