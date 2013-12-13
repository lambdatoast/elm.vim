if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

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
  echo ExecCompilerCmd(compilercmd . " && " . cleanUpCmd)
endfunction

function! ElmMake()
  let file = expand("%")
  let compilercmd = "elm " . "--make " . file
  echo ExecCompilerCmd(compilercmd)
endfunction

map <LocalLeader>t :call ElmPrintTypes()<ENTER>
map <LocalLeader>m :call ElmMake()<ENTER>
