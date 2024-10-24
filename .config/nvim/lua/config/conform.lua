require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimport", "gofmt" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		html = { "prettierd" },
		markdown = { "prettierd" },
		["_"] = { "trim_whitespace" },
	},
})
vim.keymap.set('n', 'gf', '<cmd>lua require("conform").format()<CR>')
