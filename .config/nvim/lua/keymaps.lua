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
