vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    requires='fgheng/winbar.nvim'
  }
  use {
    'fgheng/winbar.nvim',
    requires='SmiteshP/nvim-gps'
  }
  use {
    'SmiteshP/nvim-gps',
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use { 'folke/trouble.nvim' }
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = 'vim.g.rose_pine_variant = [[moon]]',
  }
  use { 'nvim-treesitter/nvim-treesitter' }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end
}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use {
    'delphinus/telescope-memo.nvim',
    requires = { 'nvim-telescope/telescope.nvim' }
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }
  use {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
      vim.keymap.set('n', '<C-f><C-f>', '<cmd>HopWord<CR>')
    end
  }
  -- non lua plugins
  use {
    'lambdalisue/fern.vim',
    requires = {
      'lambdalisue/fern-git-status.vim',
      'lambdalisue/fern-renderer-nerdfont.vim',
      'lambdalisue/nerdfont.vim',
    },
    setup = 'vim.g["fern#renderer"] = [[nerdfont]]',
  }
  use {
    'vim-test/vim-test',
    requires = { 'skywind3000/asyncrun.vim' },
    setup = function()
      vim.keymap.set('n', '<C-t>', '<cmd>TestNearest<CR>')
      vim.g['test#strategy'] = 'asyncrun'
      vim.g.asyncrun_open = 14
    end
  }
  use { 'tpope/vim-commentary' }
  use { 'vim-denops/denops.vim' }
  use {
    'lambdalisue/guise.vim',
    requires = { 'vim-denops/denops.vim' }
  }
  use {
    'lambdalisue/gin.vim',
    requires = { 'vim-denops/denops.vim' },
    config = function()
      vim.keymap.set('n', '<C-s><C-s>', '<cmd>GinStatus<CR>')
      local autocmd = vim.api.nvim_create_autocmd
      autocmd('FileType', {
        pattern = 'gin-status',
        callback = function()
          vim.keymap.set('n', '<C-c><C-c>', '<cmd>Gin commit<CR>')
        end
      })
    end
  }
  use {
    'lambdalisue/gina.vim',
    config = function()
      vim.cmd(
        [[
          call gina#custom#command#alias('branch', 'br')
          call gina#custom#command#option('br', '-v', 'v')
          call gina#custom#command#option(
            \ '/\%(log\|reflog\)',
            \ '--opener', 'vsplit'
            \)
          call gina#custom#command#option(
            \ 'log', '--group', 'log-viewer'
            \)
          call gina#custom#command#option(
            \ 'reflog', '--group', 'reflog-viewer'
            \)
          call gina#custom#command#option(
            \ 'diff', '--group', 'diff'
            \)
          call gina#custom#command#option(
            \ 'commit', '-v|--verbose'
            \)
          call gina#custom#mapping#nmap(
            \ 'status', '<C-c><C-c>',
            \ ':<C-u>Gina commit<CR>',
            \ {'noremap': 1, 'silent': 1}
            \)
          call gina#custom#mapping#nmap(
            \ 'commit', '<C-s><C-s>',
            \ ':<C-u>Gina status<CR>',
            \ {'noremap': 1, 'silent': 1}
            \)
          call gina#custom#execute(
            \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
            \ 'setlocal winfixheight',
            \)
          call gina#custom#mapping#nmap(
            \ 'status', 'dj',
            \ 'j:<C-u>call gina#action#call("diff:preview:top")<CR>',
            \ {'noremap': 1, 'silent': 1}
            \)
          call gina#custom#mapping#nmap(
            \ 'status', 'dk',
            \ 'k:<C-u>call gina#action#call("diff:preview:top")<CR>',
            \ {'noremap': 1, 'silent': 1}
            \)
        ]], false
      )
    end
  }
end)

-- 0. configuration
-- -----------------------------------------------------------------------------
-- General Settings
-- -----------------------------------------------------------------------------
local opt = vim.opt
local g = vim.g

opt.hidden = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smarttab = true
opt.smartindent = true
opt.listchars = 'tab:»-,trail:-,eol:¬,extends:»,precedes:«,nbsp:%'
opt.diffopt:append {'vertical'}
opt.synmaxcol = 320
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 400
-- Live Substitution
opt.inccommand = 'nosplit'
-- Encoding
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = 'iso-2022-jp,euc-jp,sjis,utf-8'
opt.bomb = true
opt.binary = true
opt.ttyfast = true
-- Fix backspace indent
opt.backspace = 'indent,eol,start'

-- Map leader to ,
g.mapleader = ','
-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Directories for swp files
opt.backup = false
opt.swapfile = false

opt.fileformats = 'unix,dos,mac'
-- -----------------------------------------------------------------------------
-- Visual Settings
-- -----------------------------------------------------------------------------
opt.ruler = true
vim.wo.number = true
opt.relativenumber = true
vim.wo.signcolumn = 'yes'
opt.guioptions = 'egmrti'
opt.list = true
opt.termguicolors = true
vim.g['&t_8f'] = '<Esc>[38;2;%lu;%lu;%lum'  -- set foreground color
vim.g['&t_8b'] = '<Esc>[48;2;%lu;%lu;%lum'  -- set background color
vim.g['t_ZH'] = '^[[3m'
vim.g['t_ZR'] = '^[[23m'
vim.wo.colorcolumn = "88"
opt.cursorline = true

-- -----------------------------------------------------------------------------
-- Key mappings
-- -----------------------------------------------------------------------------
-- Clean search (highlight)
vim.keymap.set('n', '<leader>sc', '<cmd>noh<cr>')

-- Vmap for maintain Visual Mode after shifting > and <
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Move visual block
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- term
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

vim.api.nvim_exec(
[[
function! s:same_indent(dir) abort
  let lnum = line('.')
  let width = col('.') <= 1 ? 0 : strdisplaywidth(matchstr(getline(lnum)[: col('.')-2], '^\s*'))
  while 1 <= lnum && lnum <= line('$')
    let lnum += (a:dir ==# '+' ? 1 : -1)
    let line = getline(lnum)
    if width >= strdisplaywidth(matchstr(line, '^\s*')) && line =~# '^\s*\S'
      break
    endif
  endwhile
  return abs(line('.') - lnum) . a:dir
endfunction
nnoremap <expr><silent> sj <SID>same_indent('+')
nnoremap <expr><silent> sk <SID>same_indent('-')
onoremap <expr><silent> sj <SID>same_indent('+')
onoremap <expr><silent> sk <SID>same_indent('-')
xnoremap <expr><silent> sj <SID>same_indent('+')
xnoremap <expr><silent> sk <SID>same_indent('-')
]], false
)

vim.api.nvim_exec(
[[
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
]], false
)

require('rose-pine').setup({
  --- @usage 'main' | 'moon'
  dark_variant = 'moon',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})
vim.cmd('colorscheme rose-pine')

vim.keymap.set('n', 'ge', '<cmd>Fern . -reveal=%<CR>')

-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

-- 4. UI (lspsaga)
local saga = require 'lspsaga'
require("nvim-gps").setup()
require('winbar').setup({
  enable = true
})
-- use default config
saga.init_lsp_saga({
  symbol_in_winbar = {
      in_custom = true
  }
})
-- keyboard shortcut
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })

-- 5. diagnostic (trouble.nvim)
local trouble = require 'trouble'
trouble.setup {
  icons = true, -- use devicons for filenames
  auto_open = true, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
vim.keymap.set("n", "<C-c><C-d>", "<cmd>TroubleToggle<CR>", { silent = true})

-- 6. tree-sitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "typescript", "vue" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- 7. telescope
local actions = require 'telescope.actions'
require('telescope').setup{
  defaults = {
    winblend = 35,
    mappings = {
      n = {},
      i = {
        ["<c-x>"] = false,
        ["<c-s>"] = actions.select_vertical,
        ["<Tab>"] = actions.toggle_selection,
        ['<C-q>'] = actions.send_selected_to_qflist,
      }
    }
  },
  pickers = {
    find_files = {
      theme = 'ivy',
      find_command = {
        'rg','--smart-case','--files','--hidden','--follow','-g','!.git/*'
      }
    },
    live_grep = {
      theme = 'ivy',
      vimgrep_arguments = {
        'rg', '--hidden', '--column', '--line-number', '--no-heading', '--smart-case'
      },
      only_sort_text = true
    },
    grep_string = {
      theme = 'ivy'
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
vim.keymap.set("n", "<C-f><C-l>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<C-m><C-l>", "<cmd>Telescope memo list<CR>")

-- others
vim.cmd('source ~/.config/nvim/statusline.vim')
