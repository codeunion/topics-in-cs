# Session Notes: Topics in CS
## Thursday, January 29, 2015

## Data Structures!

Start by looking at
[CodeUnion's data structure exercises][codeunion-data-structures].

## Core Data Structures

Data structures are names for abstract patterns of representing and organizing
information.  How and why we organize information in certain ways is a
function of two things: common patterns we've observed over time and the
constraints and requirements placed upon us by differing contexts.

No matter how complex or abstract the data structures we talk about become,
remember the above: we're just talking about different ways of organizing
information.

As a simple example, consider a phone book.  We could organize the information
in this book in any number of ways.  Given that we need to put the information
in a physical book, there are already certain ways of organizing this
information that don't make sense or are outright impossible.

But even given that constraint, we have many choices.  Do we organizing the
information as a list?  If so, do we sort it?  If so, how do we sort it?  By
first name?  Last name?  Street name?  Numerically by phone number?

Ultimately, how we decide to organize it depends on how we want to interact
with that information.  If we care first and foremost about looking up
phone numbers by first name, it would make good sense to sort the information
by first name, even if it made it harder to look up phone numbers by last name.

## Data Types

The language we most commonly use to talk about data structures is the language
of [data types][wiki-data-type].  At the most
fundamental, physical level, computers have no concept of information.  
Everything is a complex arrangement of electrical circuits and storage.  The
memory (RAM) in your computer is literally a big grid of charged and uncharged
capacitors.  We build machines to recognize and manipulate those patterns of
electrical charge, but it's we _humans_ who decide what those patterns mean.

Conventionally, data types are divided into two buckets: primitive types and
composite types.  In any given program language, the collection of all
supported data types and the language-specific rules for interacting with them
is called the language's _[type system][wiki-type-system]_.

### Primitive Types

These are common "primitive types."  A primitive type is a piece of information
that can't be expressed in terms of other, more fundamental data type.  Just
like there are fundamentals units of physical matter, primitive types are the
fundmental, indivisible units in a given language's type system.

The types below aren't present at the syntactic level in _every_ programming
language, although we often find ways to represent them indirectly.  Data
types that are directly supported by a language are called "native types" in
that language.

-  Numeric Types
  -  Integer
  -  Decimal
-  String
-  Boolean
-  NULL / nil / empty type

### Composite Types

These are common "composite types."  Like the primitive types above, a given
programming language may or may not support them natively.  Most programming
languages have ways of building custom composite types, though.

Every composite type has a common feature: they consist of abstract
containers intended to hold other information.  They differ in how those
containers are organized, how we reference them, what operations they are
designed to support, and what constraints we place on all of the above.

-   **Array**

    Conceptually, an array is an arbitrary-length sequence of containers
    each containing the same type of thing, e.g., an array of integers.
    We reference individual containers by their position, e.g., the
    1st element, the 5th element, the 42nd element, and so on.

-  **List**

    Conceptually, a list is an arbitrary-length sequence of containers, each of
    which can contain _any_ kind of information.  The list is divided into
    two parts: the first element of the list and the remainder ("rest") of
    the list.

-   **Tuple**

    Conceptually, a tuple is a fixed-length sequence of containers, each
    of which can contain any type of information.  That is, the length of
    a tuple is declared up-front and can't be changed.

    Each position is called a "coordinate" has a specific meaning.  For example,
    latitude/longitude coordinated might be represented by a 2-element tuple.
    The first coordinate would _always_ be the latitude and the second
    coordinate would _always_ be the longitude.

-  **Map** (or associative array or "hash")

   Conceptually, a map is a collection of containers with no inherent notion
   of order or linearity.  Instead, each container is given a unique label,
   called a "key" and we use that label to refer to a given container.  For
   this reason we often talk about "key/value pairs" when talking about maps.

   Like a list, the size and type of information in a map isn't fixed
   beforehand.

-  **Record** (or struct)

    Like a map, we refer to the containers in a record by name and not by
    position.  Unlike a map, however, the collection of container labels
    is fixed beforehand.  In this context, the labels are often called
    "fields."  That is, part of declaring a new record type involves providing
    a hard-coded list of field names.

Imagine a 2x2 grid with two axes: arbitrary size / fixed size and
reference by position / reference by name.

- Maps don't have a fixed size and we reference individual containers by name.
- Records have a fixed size and we reference individual containers by name
- Arrays don't have a fixed size and we reference individual containers by
  position.
- Tuples have a fixed size and we reference individual containers by position.

In other words, arrays are to tuples as maps are to records.

### Other Common Composite Types

We'll talk about these other common composite types later.

-  **Set**
-  **Tree**
-  **Graph**

### Abstractions Everywhere

We deal with abstractions every day.  The best ones feel so natural that
we think of them as honest-to-goodness real things.  This "mistake" is
called [reification][wiki-reification].

For example, numbers are an abstraction we deal with every day starting from a
very young age. Consider the number 5. You can't point to the number 5. You
can't touch, smell, or taste the number 5. You have never once encountered the
number 5 walking around outside.

That said, the number 5 is an abstraction of many concrete every day
experiences. You can't touch the number 5, but you can touch 5 apples. You
can't smell the number 5, but you can smell 5 cows (and how!). You can draw me
5 smiley faces or 5 hearts.

What is 5 except something that all these groups-of-five have in common? It's
an abstraction that isolates some aspects of these groups-of-five that we find
relevant and only those aspects, discarding the particulars. It's powerful
because it encapsulates 5-ness per se without needing to answer "5 of what?"
It's not 5 of anything — it's just 5.

Even that symbol, "5", is still just a picture of the number 5. 5 is prime
whether we write is as 5 (decimal) or 101 (binary) or V (roman numerals) or
IIIII (tally marks) or 五 (Japanese). The number 5 is not an interface. It is
not "hiding details." It is a pure expression of a pattern we've isolated and
elevated to a thing-in-itself.

> The acts of the mind, wherein it exerts its power over simple ideas, are
> chiefly these three: 1. Combining several simple ideas into one compound one,
> and thus all complex ideas are made. 2. The second is bringing two ideas,
> whether simple or complex, together, and setting them by one another so as to
> take a view of them at once, without uniting them into one, by which it gets
> all its ideas of relations. 3. The third is separating them from all other
> ideas that accompany them in their real existence: this is called
> abstraction, and thus all its general ideas are made.
>
> — John Locke, _[An Essay Concerning Human Understanding][locke-essay]_ (1690)


  [codeunion-data-structures]: https://github.com/codeunion/data-structures
  [wiki-data-type]: http://en.wikipedia.org/wiki/Data_type
  [wiki-type-system]: http://en.wikipedia.org/wiki/Type_system
  [wiki-reification]: http://en.wikipedia.org/wiki/Reification_%28fallacy%29
  [locke-essay]: http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-9.html]
