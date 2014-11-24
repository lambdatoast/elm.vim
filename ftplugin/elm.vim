" elm.vim - Plugin for the Elm programming language
" Maintainer:   Alexander Noriega <http://lambdatoast.com/>
" Version:      0.4.2

" Plugin setup stuff

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Compilation

function! ElmPrintTypes()
  let file = expand("%")
  let tmpname = "tmp.elm.vim.plugin"
  let buildDir = tmpname . ".build"
  let cacheDir = tmpname . ".cache"
  let compilercmd = "elm " . "--build-dir=" . buildDir . " --cache-dir=" . cacheDir . " --print-types " . file
  let cleanUpCmd = "rm -rf " . buildDir . " " . cacheDir
  return elm#io#read_into_new_window(compilercmd . " && " . cleanUpCmd)
endfunction

function! ElmMake(file)
  let args = "--make " . a:file
  return elm#io#system("elm", args)
endfunction

function! ElmMakeCurrentFile()
  echo ElmMake(expand("%"))
endfunction

function! ElmMakeMain()
  echo ElmMake("Main.elm")
endfunction

function! ElmMakeFile(file)
  echo ElmMake(a:file)
endfunction

" File management

function! ElmClearCachedFiles()
  echo elm#io#system("rm", "-rf build cache")
endfunction

" REPL 

function! ElmRepl()
  !elm-repl
endfunction

" Evaluation

function! ElmEvalLine()
  return ElmEval(getline("."))
endfunction

function! ElmEvalSelection()
  let savedReg = @z
  normal! `<v`>"zy
  let res = ElmEval(substitute(getreg("z"), "\n", "\\\n", "g"))
  let @z = savedReg
  normal! gv
endfunction

function! ElmEval(sourceCode)
  let currentLine = a:sourceCode
  let args = "echo '" . currentLine . "' | elm-repl"
  let result = elm#io#system("echo", args)
  let cleanResult = "-- " . join(s:Filtered(function("s:IsUsefulReplOutput"), split(result, "\n")), "")
  put =cleanResult
endfunction

function! s:IsUsefulReplOutput(str)
  return a:str !~ "^Elm REPL" && a:str !~ "Type :help" && a:str !~ ">\\s*$"
endfunction

" List processing

function! s:Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

command -buffer ElmEvalLine          call ElmEvalLine()
command -buffer ElmEvalSelection     call ElmEvalSelection()
command -buffer ElmPrintTypes        call ElmPrintTypes()
command -buffer ElmMakeMain          call ElmMakeMain()
command -buffer -nargs=1 ElmMakeFile call ElmMakeFile <args>
command -buffer ElmMakeCurrentFile   call ElmMakeCurrentFile()
command -buffer ElmClearCachedFiles  call ElmClearCachedFiles()
command -buffer ElmRepl              call ElmRepl()

" Define comment convention

setlocal comments=:--
setlocal commentstring=--%s
