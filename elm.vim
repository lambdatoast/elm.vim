" Vim syntax file
" Language: Elm (http://elm-lang.org/)
" Maintainer: Alexander Noriega
" Latest Revision: 16 March 2013

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

" Builtin functions
syn keyword elmBuiltinFunction abs acos acosh all and any
syn keyword elmBuiltinFunction asin asinh atan atan2 atanh ceiling
syn keyword elmBuiltinFunction compare concat concatMap cos cosh curry
syn keyword elmBuiltinFunction div drop dropWhile either filter
syn keyword elmBuiltinFunction flip floor foldl foldl1 foldr foldr1 fst
syn keyword elmBuiltinFunction head id last length lift lift2 lift3 lift4
syn keyword elmBuiltinFunction lift5 lift6 lift7 lift8 log logBase lookup map
syn keyword elmBuiltinFunction max maximum maybe min minimum mod not or
syn keyword elmBuiltinFunction otherwise pi product quot rem reverse
syn keyword elmBuiltinFunction round scanl scanl1 scanr scanr1
syn keyword elmBuiltinFunction show sin sinh snd sqrt sum
syn keyword elmBuiltinFunction tail take takeWhile tan tanh truncate uncurry
syn keyword elmBuiltinFunction unzip unzip3 zip zip3 zipWith zipWith3
syn keyword elmBuiltinFunction constant spacer container up down left right
syn keyword elmBuiltinFunction inward outward flow layers collage image fittedImage
syn keyword elmBuiltinFunction images video plainText text centeredText rightedText
syn keyword elmBuiltinFunction justifiedText above below beside width height size
syn keyword elmBuiltinFunction opacity color link widthOf heightOf sizeOf topLeft
syn keyword elmBuiltinFunction midLeft bottomLeft midTop middle midBottom topRight
syn keyword elmBuiltinFunction midRight bottomRight merge merges foldp count
syn keyword elmBuiltinFunction countIf average foldp1 foldp' keepIf dropIf keepWhen
syn keyword elmBuiltinFunction dropWhen dropRepeats sampleOn red green blue cyan
syn keyword elmBuiltinFunction yellow magenta black white grey gray rgb rgba
syn keyword elmBuiltinFunction complement hsv hsva

" Comments
syn match elmTodo "[tT][oO][dD][oO]" contained
syn match elmLineComment "--.*"
syn region elmComment start="{-" end="-}" contains=elmTodo,elmComment

" String literals
syn region elmString start="\"[^"]" skip="\\\"" end="\"" contains=elmStringEscape
syn match elmStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match elmStringEscape "\\[nrfvb\\\"]" contained

let b:current_syntax = "elm"

hi def link elmKeyword            Keyword
hi def link elmBuiltinOp          Special
hi def link elmBuiltinType        Type
hi def link elmBuiltinFunction    Function
hi def link elmTodo               Todo
hi def link elmLineComment        Comment
hi def link elmComment            Comment
hi def link elmString             String
