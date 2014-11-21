# Topics in CS - November 13, 2014

## Summary

We explored a simple C program and then dove into Ruby's source code.

## The Sum Program

The file [sum.c](sum.c) contains the source code for a C program that reads in numbers via command-line arguments and returns their sum.  We have to compile the program before we can run it.  To do that, run

```shell-session
$ make all
```

Make, like Ruby's "Rake", is a tool for giving names to simple tasks that might depend on each other.  See the [Makefile](Makefile) for how we define the `all` task.  If the `make` command doesn't work for whatever reason, you should be able to compile the `sum` program by running

```shell-session
$ gcc sum.c -o sum
```

This produces a binary executable named `sum` which you can run directly.  Try it out:

```shell-session
$ ./sum 5 4 6 7 8 9
39
$
```

If you want `make` to recompile `sum.c` (e.g., you've made some changes to it), you will need to delete the `sum` executable first by running

```shell-session
$ make clean
```

If you look at the `Makefile`, you can see that the `clean` task is simply shorthand for `rm -f sum`.
