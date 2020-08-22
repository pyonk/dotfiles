function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, '💩' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, '🤔' . info['warning'])
    endif
    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

function TinyFilePath()
  let l:path = expand('%')

  if l:path ==? ''
    return '[SPECIAL]'
  endif

  let l:splits = split(l:path, '/')
  let l:no_of_splits = len(l:splits)
  if l:no_of_splits > 1
    let l:folder = l:splits[l:no_of_splits - 2]
    let l:file = l:splits[l:no_of_splits - 1]
    return l:folder . '/' . l:file
  else
    return l:path
  endif
endfunction

function! NearestMethodOrFunction() abort
  let l:func = get(b:, 'vista_nearest_method_or_function', '')
  if l:func != ''
      return ' '.l:func
  endif
  return '🙇'
endfunction

function! GetBranch() abort
    let l:currentBranch = gina#component#repo#branch()
    if l:currentBranch != ''
        return ' '.l:currentBranch
    endif
    return ''
endfunction

set statusline=                                        " Reset status line
set statusline+=%*                                     " Reset color
set statusline+=%{&readonly?':':!&modifiable?':':''}   " Non modifiable
set statusline+=\ \ %{TinyFilePath()}\                 " File name
set statusline+=%{&modified?'+':''}                    " Modified
set statusline+=\ %q                                   " Quickfix, LocList etc
set statusline+=\ %{GetBranch()}
set statusline+=\ \ %{NearestMethodOrFunction()}
" set statusline+=%#StatusLineNC#                        " Faded
set statusline+=%=                                     " Split
set statusline+=%#StatusLineNC#                        " Faded
set statusline+=%{StatusDiagnostic()}                  " Coc errors and warns
set statusline+=%#StatusLineNC#                        " Faded
set statusline+=%#WorningMsg#                          " Warning color
set statusline+=\ %l:%c                                " Line number and column
set statusline+=\ %p%%                                 " Percentage
set statusline+=\ %y                                   " Filetype
set statusline+=\                                      " Blank
