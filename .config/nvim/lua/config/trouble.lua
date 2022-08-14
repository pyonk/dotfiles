local trouble = require('trouble')

trouble.setup {
  icons = true, -- use devicons for filenames
  auto_open = true, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
  signs = {
    -- icons / text used for a diagnostic
    error = "💩",
    warning = "🤔",
    hint = "💡",
    information = "ℹ️",
    other = "✅"
  },
}

vim.keymap.set("n", "<C-c><C-d>", "<cmd>TroubleToggle<CR>", { silent = true})

