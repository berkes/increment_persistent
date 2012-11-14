# About

Increments numbers and stores them in $HOME/.increment

# Usage

Simple incrementing

    $ increment
    #=> 1
    $ increment
    #=> 2
    $ exit
    #=> log out, log off, power off or such.
    $ increment
    #=> 4

Named incrementing

    $ increment -n invoice
    # => 1
    $ increment --name invoice
    # => 2

(pre)set, write, a number

    $ increment -w 1337
    # => 1337
    $ increment
    # => 1338
    $ increment -w 42 -n invoice
    # => 42

Or read out without incrementing

    $ increment -n
    # => 1338

List all named numbers

    $ increment --list
      (unnamed) : 1338
      invoice   : 42

# Author

Bèr ```[berkes](http://berk.es)``` Kessels <ber webschuur com >

# Requirements

A POSIX complient system (AKA: will probably not work properly on windows)

# TODOs

Make more racecondition-safe with locking.
