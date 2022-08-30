local autocmd = vim.api.nvim_create_autocmd

autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd('startinsert')
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

-- read local vimrc
vim.api.nvim_exec(
[[
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(
  \ expand(fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h')))
  \ )
augroup END
]], false
)
