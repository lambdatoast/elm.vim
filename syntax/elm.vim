" Vim syntax file
" Language: Elm (http://elm-lang.org/)
" Maintainer: Alexander Noriega
" Latest Revision: 01 November 2013

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword elmKeyword as case class data default deriving do else export foreign
syn keyword elmKeyword hiding jsevent if import in infix infixl infixr instance let
syn keyword elmKeyword module newtype of then type where _

" Builtin operators
syn match elmBuiltinOp "\.\."
syn match elmBuiltinOp "|\{,2\}"
syn match elmBuiltinOp ":"
syn match elmBuiltinOp "::"
syn match elmBuiltinOp "="
syn match elmBuiltinOp "\\"
syn match elmBuiltinOp "\""
syn match elmBuiltinOp "->"
syn match elmBuiltinOp "<-"
syn match elmBuiltinOp "\u2192"
syn match elmBuiltinOp "\u03BB"
syn match elmBuiltinOp "\$"
syn match elmBuiltinOp "&&"
syn match elmBuiltinOp "+"
syn match elmBuiltinOp "++"
syn match elmBuiltinOp "-"
syn match elmBuiltinOp "\."
syn match elmBuiltinOp "/"
syn match elmBuiltinOp "/="
syn match elmBuiltinOp "<"
syn match elmBuiltinOp "<="
syn match elmBuiltinOp "=="
syn match elmBuiltinOp ">"
syn match elmBuiltinOp ">="
syn match elmBuiltinOp "\^"
syn match elmBuiltinOp "\*"
syn match elmBuiltinOp "<\~"
syn match elmBuiltinOp "\~"

" Builtin types
syn keyword elmBuiltinType Bool Char False Float GT Int Just LT Maybe Nothing String True
syn keyword elmBuiltinType Time Date Text Order Element List Signal Tuple Either

" Special names
syntax match specialName "^main "

" Comments
syn match elmTodo "[tT][oO][dD][oO]\|FIXME\|XXX" contained
syn match elmLineComment "--.*" contains=elmTodo,@spell
syn region elmComment matchgroup=elmComment start="{-|\=" end="-}" contains=elmTodo,elmComment,@spell

" String literals
syn region elmString start="\"" skip="\\\"" end="\"" contains=elmStringEscape
syn match elmStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match elmStringEscape "\\[nrfvb\\\"]" contained

" Number literals
syn match elmNumber "\(\<\d\+\>\)"
syn match elmNumber "\(\<\d\+\.\d\+\>\)"

let b:current_syntax = "elm"

hi def link elmKeyword            Keyword
hi def link elmBuiltinOp          Special
hi def link elmBuiltinType        Type
hi def link elmBuiltinFunction    Function
hi def link elmCoreLibrary        Type
hi def link elmTodo               Todo
hi def link elmLineComment        Comment
hi def link elmComment            Comment
hi def link elmString             String
hi def link elmNumber             Number
hi def link specialName           Special
