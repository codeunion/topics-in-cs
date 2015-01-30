typedef struct {
    char *first_name;
    char *last_name;
    int age;
} Person;

/* In C, you have to declare your function signatures separately
   from your function definitions.  This is so that the compiler
   knows what arguments to expect and so other files can call
   functions defined in person.c */

Person *person_new(char *, char *, int);
void person_delete(Person *);
