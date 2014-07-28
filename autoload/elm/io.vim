" System IO

" Craft a system command and run it, returning the output.
function! elm#io#system(program, args)
  let cmd ="which " . a:program . " && " . a:program . " " . a:args
  return system(cmd)
endfunction

" Run system command and put its output into a new window.
function! elm#io#read_into_new_window(cmd) abort
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

