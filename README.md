# elm.vim

Vim plugin for the [Elm programming language](http://elm-lang.org/).

## System Requirements

Nothing other than vim is needed for the syntax highlighting.

However, for the special commands and aliases (for compilation, etc), the plugin expects the following programs to be available:

* `elm`: The Elm compiler.
* `elm-repl`: The Elm REPL.

## Normal Mode Commands

* `\c` - Compile the current file.
* `\m` - `elm --make Main.elm`.
* `\t` - Print types of names in the current file.
* `\r` - Go to the REPL

Where `\` is your local leader key (`\` by default).

## TODO

* Integration with Elm docs.
* More useful integration with `elm-repl`.
