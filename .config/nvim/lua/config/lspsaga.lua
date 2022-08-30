local saga = require('lspsaga')

-- use default config
saga.init_lsp_saga({
  symbol_in_winbar = {
    enable = true,
  },
  show_outline = {
    auto_enter = true,
    auto_refresh = true,
  }
})

-- keyboard shortcut
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "<C-g><C-r>", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
vim.keymap.set("n", "<C-f><C-v>", "<Cmd>LSoutlineToggle<CR>", { silent = true })

