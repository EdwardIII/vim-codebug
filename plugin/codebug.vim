command! BreakpointAdd :exec "!open 'codebug://send?file=%:p&line=" . line('.') . "&op=add&open=1'"
command! BreakpointDelete :exec "!open 'codebug://send?file=%:p&line=" . line('.') . "&op=delete&open=1'"

