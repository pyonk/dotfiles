local keymap = vim.keymap
-- Key mappings
-- -----------------------------------------------------------------------------
-- Clean search (highlight)
keymap.set('n', '<leader>sc', '<cmd>noh<cr>')

-- Vmap for maintain Visual Mode after shifting > and <
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
-- Move visual block
keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- term
keymap.set('t', '<ESC>', '<C-\\><C-n>')
keymap.set('n', 'sh', '<cmd>split | wincmd j | resize 20 | terminal<CR>')
-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- split buffer
keymap.set('n', 'sv', '<cmd>vsplit<CR>')
keymap.set('n', 'ss', '<cmd>split<CR>')

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('v', 'j', 'gj')
keymap.set('v', 'k', 'gk')

-- build-in LSP function
keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

vim.api.nvim_exec(
[[
function! s:same_indent(dir) abort
  let lnum = line('.')
  let width = col('.') <= 1 ? 0 : strdisplaywidth(matchstr(getline(lnum)[: col('.')-2], '^\s*'))
  while 1 <= lnum && lnum <= line('$')
    let lnum += (a:dir ==# '+' ? 1 : -1)
    let line = getline(lnum)
    if width >= strdisplaywidth(matchstr(line, '^\s*')) && line =~# '^\s*\S'
      break
    endif
  endwhile
  return abs(line('.') - lnum) . a:dir
endfunction
nnoremap <expr><silent> sj <SID>same_indent('+')
nnoremap <expr><silent> sk <SID>same_indent('-')
onoremap <expr><silent> sj <SID>same_indent('+')
onoremap <expr><silent> sk <SID>same_indent('-')
xnoremap <expr><silent> sj <SID>same_indent('+')
xnoremap <expr><silent> sk <SID>same_indent('-')
]], false
)
