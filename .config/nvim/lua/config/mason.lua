require('mason').setup()
require('mason-lspconfig').setup_handlers({
  function(server)
    local opt = {
      -- -- Function executed when the LSP server startup
      -- on_attach = function(client, bufnr)
      --   local opts = { noremap=true, silent=true }
      --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
      -- end,
      on_attach = function(client, bufnr)
        local navic = require("nvim-navic")
        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end
      end,
      capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
    require('lspconfig')[server].setup(opt)
  end,
  ["lua_ls"] = function ()
    require("lspconfig").lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
  ["emmet_ls"] = function ()
    require("lspconfig").emmet_ls.setup({
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    })
  end
})
