#include <stdio.h>
#include <stdlib.h>

/* In C, we have to declare our function signatures separately
 * from our function definitions.
 */

// add takes two integer arguments and returns an integer
int add(int, int);

// print_usage takes a string as an argument and returns nothing
void print_usage(char *);

/* Every C program must declare a function called "main".
 * The compiler generates a binary which initializes your
 * program and then jumps to this function.
 */

/* argc: the number of command-line arguments
 * argv: an array of command-line arguments
 *
 * Note: argv[0] is the name of the command itself,
 *       making argv[1] the first user-supplied argument.
 */

int main(int argc, char **argv) {
  int i;
  int sum = 0;

  /* See above.  argv[0] is the name of the program itself,
   * so if argc == 2 that means the user has supplied our
   * program with only _one_ command-line argument.
   */

  if (argc < 2) {
    print_usage(argv[0]);
    return 1;
  }

  for(i = 1;i < argc;i++) {
    sum += atoi(argv[i]);
  }

  printf("%d\n", sum);

  return 0;
}

int add(int x, int y) {
  return x + y;
}

void print_usage(char *program_name) {
  printf("Error!  You must supply at least two numbers to add.\n");
  printf("\n");
  printf("This program returns the sum of a list of numbers.\n");
  printf("\n");
  printf("Usage:\n");
  printf("  %s <num> <num> [num num num ...]\n", program_name);
  printf("\n");
  printf("Examples:\n");
  printf("  %s 5 4\n", program_name);
  printf("  %s 10 18 -7\n", program_name);
}
