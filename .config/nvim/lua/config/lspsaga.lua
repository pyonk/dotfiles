local saga = require('lspsaga')

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

-- use default config
saga.setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    title = false,
  },
  lightbulb = {
    sign = false
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
vim.keymap.set("n", "gv", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Show line diagnostics
vim.keymap.set("n", "<C-d><C-l>", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
