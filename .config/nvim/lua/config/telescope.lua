local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
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
telescope.load_extension('fzf')

vim.keymap.set("n", "<C-f><C-l>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<C-m><C-l>", "<cmd>Telescope memo list<CR>")

