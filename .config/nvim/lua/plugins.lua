local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use {
    'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    config = [[require('config.mason')]]
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/vim-vsnip',
    },
    config = [[require('config.nvim_cmp')]]
  }
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = [[require('config.lspsaga')]]
  }
  use {
    'SmiteshP/nvim-navic',
    requires = "neovim/nvim-lspconfig"
  }
  use {
    'folke/trouble.nvim',
    config = [[require('config.trouble')]]
  }
  use {
    'folke/lsp-colors.nvim',
    config = [[require('config.lsp_colors')]]
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = [[require('config.null_ls')]]
  }
  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = [[require('config.lsp_lines')]],
  }
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = [[require('config.rose_pine')]]
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag'
    },
    config = [[require('config.tree_sitter')]]
  }
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
        'delphinus/telescope-memo.nvim',
      },
      config = [[require('config.telescope')]]
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    },
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'phaazon/hop.nvim',
    config = [[require('config.hop')]]
  }
  use {
    'j-hui/fidget.nvim',
    config = [[require('config.fidget')]]
  }
  use {
    {
      'petertriho/nvim-scrollbar',
      requires = { 'nvim-hlslens' },
      config = [[require('config.scrollbar')]]
    },
    {
      'kevinhwang91/nvim-hlslens',
      config = [[require('config.hlslens')]]
    }
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = [[require('config.lualine')]]
  }
  use {
    'klen/nvim-test',
    config = [[require('config.nvim_test')]]
  }
  use {
    'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
      end
  }
  -- non lua plugins
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-commentary' }
  use {
    'lambdalisue/gina.vim',
    config = [[require('config.gina')]]
  }
  use {
    'lambdalisue/fern.vim',
    requires = {
      'lambdalisue/fern-git-status.vim',
      'lambdalisue/fern-renderer-nerdfont.vim',
      'lambdalisue/nerdfont.vim',
    },
    config = [[require('config.fern')]],
  }
  use {
    {
      'vim-denops/denops.vim'
    },
    {
      'lambdalisue/guise.vim',
      requires = { 'vim-denops/denops.vim' }
    },
    {
      'lambdalisue/gin.vim',
      requires = { 'vim-denops/denops.vim' },
      config = [[require('config.gin')]]
    }
  }
  use { 'machakann/vim-sandwich' }
  use {
    'simeji/winresizer',
    config = [[require('config.winresizer')]],
    opt = true,
    keys = {'n', '<C-e>'}
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
