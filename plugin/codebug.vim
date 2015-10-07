if !hlexists('BreakpointErrorSign')
    highlight link BreakpointErrorSign error
endif
if !hlexists('BreakpointStyleErrorSign')
    highlight link BreakpointStyleErrorSign BreakpointErrorSign
endif
if !hlexists('BreakpointStyleErrorLine')
    highlight link BreakpointStyleErrorLine BreakpointErrorLine
endif

exe 'sign define BreakpointError text=B>' .
            \ ' texthl=BreakpointErrorSign linehl=BreakpointErrorLine'

let g:first_sign_id = 6000
let g:next_sign_id = g:first_sign_id

function g:GetNextSignId()
    let retval = g:next_sign_id
    let g:next_sign_id += 1
    return retval
endfunction

command! BreakpointAdd :exec "!open 'codebug://send?file=%:p&line=" . line('.') . "&op=add&open=1'" | :exec ":sign place " . GetNextSignId() . " line=" . line('.') . " name=BreakpointError file=" . expand('%:p')
command! BreakpointDelete :exec "!open 'codebug://send?file=%:p&line=" . line('.') . "&op=delete&open=1'" | :exec ":sign unplace" 

