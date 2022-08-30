local null_ls = require('null-ls')
local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.formatting.prettier.with {
    prefer_local = 'node_modules/.bin'
  },
  null_ls.builtins.diagnostics.eslint.with {
    prefer_local = 'node_modules/.bin'
  }
}

null_ls.setup({
  debug = true,
  sources = sources
})
