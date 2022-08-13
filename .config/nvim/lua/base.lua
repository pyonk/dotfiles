-- -----------------------------------------------------------------------------
-- General Settings
-- -----------------------------------------------------------------------------
vim.opt.hidden = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.listchars = { tab = '»-', trail = '-', extends = '»', precedes = '«', nbsp = '%' }
vim.opt.diffopt:append {'vertical'}
vim.opt.synmaxcol = 320
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 400
-- Live Substitution
vim.opt.inccommand = 'nosplit'
-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'iso-2022-jp,euc-jp,sjis,utf-8'
vim.opt.bomb = true
vim.opt.binary = true
vim.opt.ttyfast = true
-- Fix backspace indent
vim.opt.backspace = 'indent,eol,start'

-- Map leader to ,
vim.g.mapleader = ','

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Directories for swp files
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.fileformats = 'unix,dos,mac'
-- -----------------------------------------------------------------------------
-- Visual Settings
-- -----------------------------------------------------------------------------
vim.opt.ruler = true
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.guioptions = 'egmrti'
vim.opt.list = true
vim.opt.termguicolors = true
vim.g['&t_8f'] = '<Esc>[38;2;%lu;%lu;%lum'  -- set foreground color
vim.g['&t_8b'] = '<Esc>[48;2;%lu;%lu;%lum'  -- set background color
vim.g['t_ZH'] = '^[[3m'
vim.g['t_ZR'] = '^[[23m'
vim.wo.colorcolumn = "88"
vim.opt.cursorline = true

vim.opt.expandtab = true
