-- Install required plugins
require("plugins")

-- Set the leader to space
vim.g.mapleader = ' '

-- Set the material theme style
vim.g.material_style = 'palenight'

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set the font
vim.opt.guifont = "DankMono Nerd Font Regular"

-- Save undo history
vim.opt.undofile = true

-- Highlight all matches on previous search pattern
vim.opt.hlsearch = false

-- Use case-insensitive search unless the term includes a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show line numbers
vim.opt.number = true

-- Always show the sign column to avoid shifting text
vim.opt.signcolumn = "yes"

-- Faster completion (default is 4s)
vim.opt.updatetime = 250

-- Indent after breaking long lines
vim.opt.breakindent = true

-- Use full colors
vim.opt.termguicolors = true

--
-- Misc plugins
--

require("lualine").setup()
require("gitsigns").setup()
require('Comment').setup()

--
-- Tree view
--

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
})

vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>")

--
-- Buffers
--

local bufferline = require("bufferline")

local fg = require('material.colors').editor.fg
local bg = require('material.colors').editor.contrast

bufferline.setup({
  options = {
    numbers = "ordinal",
    show_close_icon = false,
  },
  highlights = {
    fill = { bg = bg, fg = fg },
    background = { bg = bg, fg = fg },
    tab = { bg = bg, fg = fg },
    close_button = { bg = bg },
    numbers = { bg = bg, fg = fg },
    separator = { bg = bg },
    pick = { bg = bg },
    offset_separator = { bg = bg },
    buffer_selected = { italic = false },
    numbers_selected = { italic = false }
  }
})

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.keymap.set("n", "<leader>w-", ":split<CR>")
vim.keymap.set("n", "<leader>w/", ":vsplit<CR>")
vim.keymap.set("n", "<leader>w=", ":wincmd =<CR>")
vim.keymap.set("n", "<leader><tab>", ":b#<CR>")
vim.keymap.set("n", "<leader>wd", ":bd<CR>")
vim.keymap.set("n", "<leader>wx", ":%bd<CR>")
vim.keymap.set("n", "<leader>ww", ":wincmd w<CR>")
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>wH", ":wincmd H<CR>")
vim.keymap.set("n", "<leader>wJ", ":wincmd J<CR>")
vim.keymap.set("n", "<leader>wK", ":wincmd K<CR>")
vim.keymap.set("n", "<leader>wL", ":wincmd L<CR>")

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    bufferline.go_to(i, true)
  end)
end

--
-- Telescope
--

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>ww', telescope.buffers)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)

--
-- Theme
--

require("material").setup({
  plugins = { "gitsigns", "nvim-tree", "nvim-web-devicons", "telescope" }
})

vim.cmd("colorscheme material")

-- Tree-sitter
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  },
  endwise = {
    enable = true
  }
})

