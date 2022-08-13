local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
  pattern = 'gin-status',
  callback = function()
    vim.keymap.set('n', '<C-c><C-c>', '<cmd>Gin commit<CR>')
  end
})
vim.keymap.set('n', '<C-s><C-s>', '<cmd>GinStatus<CR>')
