# elm.vim

Vim plugin for the [Elm programming language](http://elm-lang.org/).

## System Requirements

Nothing other than vim is needed for the syntax highlighting.

However, for the special commands and aliases (for compilation, etc), the plugin expects the following programs to be available:

* `elm`: The Elm compiler.
* `elm-repl`: The Elm REPL.

## Usage

The following are the existing commands. Create keyboard mappings for 
them according to your needs, for a better experience.

### Compilation

* `:ElmMakeCurrentFile` compiles the current file.
* `:ElmMakeMain` compiles an assumed `Main.elm` file.

### Evaluation

* `:ElmEvalLine` evaluates the current line and puts the result as a
  comment in a new line below it.
* `:ElmPrintTypes` displays the types of the current file in a new split window.

### REPL

* `:ElmRepl` switches to `elm-repl`, when closing the REPL you'll get back to vim.

## TODO

* Integration with Elm docs.
* More useful integration with `elm-repl`.
