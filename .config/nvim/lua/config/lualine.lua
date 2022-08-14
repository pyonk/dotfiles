require('lualine').setup({
  sections = {
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        symbols = {error = '💩', warn = '🤔', info = 'ℹ️', hint = '💡'},
      }
    }
  }
})
