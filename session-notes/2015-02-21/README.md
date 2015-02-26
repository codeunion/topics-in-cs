# Session Notes: Topics in CS
## Saturday, February 21, 2015


op       :: + | * | / | -
zero     :: 0
non_zero :: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
letter   :: [a-z]
variable :: <letter>+

digit    :: <zero> | <non_zero>
number   :: <digit> | <non_zero><digit>*
expr     :: <number> | <op> <expr> <expr>

/a*bc*/

S → {aS}
S → ε

ε
{a}
{a{a}}
{a{a{a}}}
{a{a{a{a}}}}
{a{a{a{a{a}}}}}
...

color: #aabbcc;
color: #aabbcc;
color: #345;
color: #334455;
