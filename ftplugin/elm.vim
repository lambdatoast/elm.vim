" elm.vim - Plugin for the Elm programming language
" Maintainer:   Alexander Noriega <http://lambdatoast.com/>
" Version:      0.2


" Plugin setup stuff

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Compilation

function! ExecCompilerCmd(cmd)
  return system("which elm && " . a:cmd)
endfunction

function! ElmPrintTypes()
  let file = expand("%")
  let tmpname = "tmp.elm.vim.plugin"
  let buildDir = tmpname . ".build"
  let cacheDir = tmpname . ".cache"
  let compilercmd = "elm " . "-b " . buildDir . " -c " . cacheDir . " --print-types " . file
  let cleanUpCmd = "rm -rf " . buildDir . " " . cacheDir
  return s:ReadCmdIntoNewWindow(compilercmd . " && " . cleanUpCmd)
endfunction

function! ElmMake(file)
  let compilercmd = "elm " . "--make " . a:file
  return ExecCompilerCmd(compilercmd)
endfunction

function! ElmMakeCurrentFile()
  echo ElmMake(expand("%"))
endfunction

function! ElmMakeMain()
  echo ElmMake("Main.elm")
endfunction

" REPL 

function! ElmRepl()
  !elm-repl
endfunction

" Evaluation

function! ElmEvalLine()
  return ElmEval(getline("."))
endfunction

function! ElmEval(sourceCode)
  let currentLine = a:sourceCode
  let cmd = "echo '" . currentLine . "' | elm-repl"
  let result = system(cmd)
  let cleanResult = "-- " . join(s:Filtered(function("s:IsUsefulReplOutput"), split(result, "\n")), "")
  put =cleanResult
endfunction

function! s:IsUsefulReplOutput(str)
  return a:str !~ "^Elm REPL" && a:str !~ "Type :help" && a:str !~ ">\\s*$"
endfunction

" I/O helpers

function! s:ReadCmdIntoNewWindow(cmd) abort
  try
    new
    exec "read! " . a:cmd
    " setlocal buftype=nowrite nomodified filetype=elm
    setlocal buftype=nowrite nomodified
    nnoremap <buffer> <silent> q    :<C-U>bdelete<CR>
    return ''
  catch /^*/
    return 'echoerr v:errmsg'
  endtry
endfunction

" List processing

function! s:Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

nnoremap <LocalLeader>t :call ElmPrintTypes()<ENTER>
nnoremap <LocalLeader>c :call ElmMakeCurrentFile()<ENTER>
nnoremap <LocalLeader>m :call ElmMakeMain()<ENTER>
nnoremap <LocalLeader>r :call ElmRepl()<ENTER>
