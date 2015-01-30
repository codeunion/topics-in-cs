/* Want to compile this program?  Run

     make all

   from the same directory. */


/* The #include directive tells the C compiler to include the
   given header file.  If the name is surrounded by <...> then the
   compiler will look for the header file in the system include
   directories.  If the name is surrounded by "..." then it will
   look for the header file in the current directory. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "person.h"

/* argc is the number of supplied command-line arguments and
   argv is the actual list of command line arguments.  In C,
   argv[0] is always the name of the current program, so
   argc == 1 when no command-line arguments are supplied. */

int main(int argc, char **argv) {
    Person *person;

    if (argc < 4) {
        printf("Usage: %s <first_name> <last_name> <age>\n", argv[0]);
        printf("\n");
        printf("Examples:\n");
        printf("  %s Jesse Farmer 32\n", argv[0]);
        printf("  %s Jane Doe 56\n", argv[0]);
        return 1;
    }

    /* atoi(char *) converts a string to an integer */
    person = person_new(argv[1], argv[2], atoi(argv[3]));

    if (person == NULL) {
        printf("person_new returned NULL.  Something went very wrong.\n");
        return 1;
    }

    printf("My name is %s %s and I am %d years old.\n",
           person->first_name, person->last_name, person->age);

    free(person);

    return 0;
}

Person *person_new(char *first_name, char *last_name, int age) {
    Person *person;

    /* Allocate enough memory to store a Person */
    person = malloc(sizeof(Person));

    /* malloc returns NULL if memory allocation fails for any reason */
    if (person == NULL) {
        return NULL;
    }

    /* strdup duplicates a string, allocating new memory as necessary */
    person->first_name = strdup(first_name);
    person->last_name  = strdup(last_name);
    person->age        = age;

    /* Like malloc, strdup returns NULL if memory allocation fails */
    if (person->first_name == NULL || person->last_name == NULL) {
        return NULL;
    }

    return person;
}

void person_delete(Person *person) {
    /* Once we free the memory we allocated for person, things like
       person->first_name no longer make sense.  We therefore have
       to free memory from the "inside out." */
    free(person->first_name);
    free(person->last_name);
    free(person);
}
