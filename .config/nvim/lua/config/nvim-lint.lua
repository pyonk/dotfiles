require('lint').linters_by_ft = {
  python = {'mypy', 'flake8'},
  javascript = {'eslint'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
