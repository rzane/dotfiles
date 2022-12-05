require("plugins")

--------------------------
-- Settings
--------------------------

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

-- Create splits below or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------
-- Plugins
--------------------------

require("lualine").setup()
require("gitsigns").setup()
require("Comment").setup()

--------------------------
-- File explorer
--------------------------

require("nvim-tree").setup(require("nvim-tree-config"))

vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>")

--------------------------
-- Buffers
--------------------------

local bufferline = require("bufferline")

bufferline.setup(require("bufferline-config"))

vim.keymap.set("n", "<leader>ss", ":update<CR>")
vim.keymap.set("n", "<leader>sq", ":x<CR>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")

vim.keymap.set("n", "<leader>w-", ":split<CR>")
vim.keymap.set("n", "<leader>w/", ":vsplit<CR>")
vim.keymap.set("n", "<leader>w=", ":wincmd =<CR>")

vim.keymap.set("n", "<leader>wd", ":bd!<CR>")
vim.keymap.set("n", "<leader>wx", ":%bd!<CR>")

vim.keymap.set("n", "<leader><tab>", ":b#<CR>")
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

--------------------------
-- Treesitter
--------------------------

local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fw', telescope.buffers)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)
vim.keymap.set('n', '<leader>fc', telescope.commands)
vim.keymap.set('n', '<leader>fk', telescope.keymaps)

-- TODO: https://github.com/LinArcX/telescope-command-palette.nvim

--------------------------
-- Theme
--------------------------

require("material").setup({
  plugins = { "gitsigns", "nvim-tree", "nvim-web-devicons", "telescope" }
})

vim.cmd("colorscheme material")

--------------------------
-- Treesitter
--------------------------

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

--------------------------
-- Language server
--------------------------

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.configure('ruby_ls', { cmd = { 'bundle', 'exec', 'ruby-lsp' } })
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

vim.keymap.set("n", "<leader>af", function ()
  vim.lsp.buf.format({ async = true, timeout = 3000 })
end)

vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action)
vim.keymap.set("x", '<leader>ac', vim.lsp.buf.range_code_action)
