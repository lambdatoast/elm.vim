# elm.vim

Vim plugin for the [Elm programming language](http://elm-lang.org/).

## System Requirements

Nothing other than vim is needed for the syntax highlighting.

For the special commands and aliases (for compilation, etc), the plugin expects the following programs to be available:

* `elm`: The Elm compiler.
* `elm-repl`: The Elm REPL. The plugin sends it bits of code for evaluation.

## Usage

These are the available commands. To get the most out of them, 
you should create mappings according to your needs.

### Compilation

* `:ElmMakeCurrentFile` compiles the current file.
* `:ElmMakeMain` compiles an assumed `Main.elm` file.
* `:ElmPrintTypes` displays the types of the current file in a new split window.

### Evaluation

* `:ElmEvalLine` evaluates the current line and puts the result as a
  comment in a new line below it.
* `:ElmEvalSelection` evaluates a visual mode selection.

### REPL

* `:ElmRepl` switches to `elm-repl`, when closing the REPL you'll get back to vim.

### Example mappings

I use the following mappings in my .vimrc at the moment:

    nnoremap <leader>el :ElmEvalLine<CR>
    vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
    nnoremap <leader>ep :ElmPrintTypes<CR>
    nnoremap <leader>em :ElmMakeCurrentFile<CR>

## TODO

* Integration with Elm docs.
