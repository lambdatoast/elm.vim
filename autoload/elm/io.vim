" System IO

" Craft a system command and run it, returning the output.
function! elm#io#system(program, args)
  let cmd ="which " . a:program . " && " . a:program . " " . a:args
  return system(cmd)
endfunction

