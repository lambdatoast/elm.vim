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

" Libraries
syn keyword elmCoreLibrary List Time Collage Prelude Random Signal String Http Set Color Keyboard Text WebSocket Automaton Mouse Transform2D Dict Char Maybe Json Window Experimental JavaScript Basics Either Date Element Touch Input

" Library functions

" Automaton
syn keyword elmBuiltinFunction run step (>>>) (<<<) combine pure state hiddenState count average
" Basics
syn keyword elmBuiltinFunction radians degrees turns fromPolar toPolar (+) (-) (*) (/) div rem mod (^) cos sin tan acos asin atan atan2 sqrt abs logBase clamp pi e (<) (>) compare min max (&&) (||) xor not otherwise round truncate floor ceiling toFloat (.) (|>) (<|) id fst snd flip curry uncurry
" Char
syn keyword elmBuiltinFunction isUpper isLower isDigit isOctDigit isHexDigit toUpper toLower toLocaleUpper toLocaleLower toCode fromCode
" Color
syn keyword elmBuiltinFunction rgba rgb lightRed red darkRed lightOrange orange darkOrange lightYellow yellow darkYellow lightGreen green darkGreen lightBlue blue darkBlue lightPurple purple darkPurple lightBrown brown darkBrown black white lightGrey grey darkGrey lightGray gray darkGray lightCharcoal charcoal darkCharcoal grayscale greyscale complement hsva hsv linear radial
" Date
syn keyword elmBuiltinFunction read toTime year month day dayOfWeek hour minute second
" Dict
syn keyword elmBuiltinFunction empty min max lookup findWithDefault member rotateLeft rotateRight rotateLeftIfNeeded rotateRightIfNeeded color_flip color_flipIfNeeded ensureBlackRoot insert singleton isBBlack moreBlack lessBlack moreBlackTree lessBlackTree del rem bubble remove_max balance blackish balance_node blacken redden remove map foldl foldr union intersect diff keys values toList fromList
" Either
syn keyword elmBuiltinFunction either isLeft isRight lefts rights partition
" Graphics.Collage
syn keyword elmBuiltinFunction defaultLine solid dashed dotted form filled textured gradient outlined traced sprite toForm group groupTransform move moveX moveY scale rotate alpha collage path segment polygon rect square oval circle ngon
" Graphics.Element
syn keyword elmBuiltinFunction widthOf heightOf sizeOf width height size opacity color tag link image fittedImage croppedImage tiledImage container spacer flow above below beside layers absolute relative middle topLeft topRight bottomLeft bottomRight midLeft midRight midTop midBottom middleAt topLeftAt topRightAt bottomLeftAt bottomRightAt midLeftAt midRightAt midTopAt midBottomAt up down left right inward outward
" Graphics.Input
syn keyword elmBuiltinFunction buttons button customButtons customButton checkboxes checkbox hoverables hoverable fields emptyFieldState field password email dropDown stringDropDown
" Http
syn keyword elmBuiltinFunction request get post send sendGet
" JavaScript
syn keyword elmBuiltinFunction toList toInt toFloat toBool toString fromList fromInt fromFloat fromBool fromString fromElement toElement
" JavaScript.Experimental
syn keyword elmBuiltinFunction toRecord fromRecord
" Json
syn keyword elmBuiltinFunction toString toJSString fromString fromJSString fromJSObject toJSObject
" Keyboard
syn keyword elmBuiltinFunction directions arrows wasd isDown shift ctrl space enter keysDown lastPressed
" List
syn keyword elmBuiltinFunction (::) (++) head tail last isEmpty map foldl foldr foldl1 foldr1 scanl scanl1 filter length reverse all any and or concat concatMap sum product maximum minimum partition zip zipWith unzip join intersperse take drop repeat
" Maybe
syn keyword elmBuiltinFunction maybe isJust isNothing justs
" Mouse
syn keyword elmBuiltinFunction position isDown isClicked clicks
" Prelude
syn keyword elmBuiltinFunction show readInt readFloat
" Random
syn keyword elmBuiltinFunction range float floatList
" Set
syn keyword elmBuiltinFunction empty singleton insert remove member union intersect diff toList fromList foldl foldr map
" Signal
syn keyword elmBuiltinFunction constant lift lift2 lift3 lift4 lift5 lift6 lift7 lift8 foldp merge merges combine count countIf keepIf dropIf keepWhen dropWhen dropRepeats sampleOn (<~) (~)
" String
syn keyword elmBuiltinFunction isEmpty cons uncons append concat length map filter reverse foldl foldr split join repeat sub left right dropLeft dropRight pad padLeft padRight trim trimLeft trimRight words lines toUpper toLower any all contain[s] startsWith endsWith indexes indices toInt toFloat toList fromList
" Text
syn keyword elmBuiltinFunction toText typeface monospace header link height color bold italic overline underline strikeThrough justified centered righted text plainText markdown asText
" Time
syn keyword elmBuiltinFunction millisecond second minute hour inMilliseconds inSeconds inMinutes inHours fps fpsWhen every since timestamp delay
" Touch
syn keyword elmBuiltinFunction touches taps
" Transform2D
syn keyword elmBuiltinFunction identity matrix rotation translation scale scaleX scaleY multiply
" WebSocket
syn keyword elmBuiltinFunction connect
" Window
syn keyword elmBuiltinFunction dimensions width height

" Comments
syn match elmTodo "[tT][oO][dD][oO]\|FIXME\|XXX" contained
syn match elmLineComment "--.*" contains=elmTodo,@spell
syn region elmComment matchgroup=elmComment start="{-" end="-}" contains=elmTodo,elmComment,@spell

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
