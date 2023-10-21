--------------------------
-- Settings
--------------------------

-- Set the leader to space
vim.g.mapleader = ' '

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Indent two spaces by default
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Indent after breaking long lines
vim.opt.breakindent = true

-- Use full colors
vim.opt.termguicolors = true

-- Create splits below or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show character limit
vim.opt.colorcolumn = '100'

-- Tidy up whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--------------------------
-- Plugins
--------------------------

require("plugins")
require("lualine").setup()
require("gitsigns").setup()
require("Comment").setup()
require("which-key").setup()
require("nvim-autopairs").setup()

--------------------------
-- File explorer
--------------------------

require("nvim-tree").setup(require("nvim-tree-config"))

vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "toggle file explorer" })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "focus file explorer" })

--------------------------
-- Buffers
--------------------------

local bufferline = require("bufferline")

bufferline.setup(require("bufferline-config"))

vim.keymap.set("n", "<leader>s", ":update<CR>", { desc = "save" })
vim.keymap.set("n", "<leader>q", ":x!<CR>", { desc = "save and quit" })

vim.keymap.set("n", "<leader>wd", ":bd!<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>wo", ":%bd|e#|bd#<CR>", { desc = "close other buffers" })
vim.keymap.set("n", "<leader><tab>", ":b#<CR>", { desc = "go to previous buffer" })

vim.keymap.set("n", "<leader>w-", ":new<CR>", { desc = "split horizontally" })
vim.keymap.set("n", "<leader>w/", ":vnew<CR>", { desc = "split vertically" })

vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>", { desc = "move to window left" })
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>", { desc = "move to window right" })
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>", { desc = "move to window below" })
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>", { desc = "move to window above" })
vim.keymap.set("n", "<leader>wH", ":wincmd H<CR>", { desc = "move window left" })
vim.keymap.set("n", "<leader>wL", ":wincmd L<CR>", { desc = "move window right" })
vim.keymap.set("n", "<leader>wK", ":wincmd K<CR>", { desc = "move window below" })
vim.keymap.set("n", "<leader>wJ", ":wincmd J<CR>", { desc = "move window above" })

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    bufferline.go_to(i, true)
  end)
end

--------------------------
-- Telescope
--------------------------

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find file" })
vim.keymap.set('n', '<leader>fF', builtin.oldfiles, { desc = "find recent file" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "search files" })
vim.keymap.set('n', '<leader>fw', builtin.buffers, { desc = "find buffer" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "find command" })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "resume find" })

--------------------------
-- Theme
--------------------------

local colors = require("material.colors")

require("material").setup({
  plugins = { "gitsigns", "nvim-tree", "nvim-web-devicons", "telescope", "which-key" },
  contrast = {
    floating_windows = true
  },
  custom_highlights = {
    NvimTreeRootFolder       = { fg = colors.editor.fg_dark, bg = colors.backgrounds.sidebars },
    NvimTreeFolderName       = { fg = colors.editor.fg_dark },
    NvimTreeOpenedFolderName = { fg = colors.editor.fg_dark },
    NvimTreeExecFile         = { fg = colors.editor.accent },
  },
})

vim.cmd("colorscheme material")

--------------------------
-- Treesitter
--------------------------

require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ruby", "sql", "heex" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "lua", "help", "gitcommit", "eruby" }
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

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['elixirls'] = {'elixir', 'eelixir', 'heex'},
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

-----------------------
-- Terminal
-----------------------

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  command = "startinsert",
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "return to normal mode" })
vim.keymap.set("n", "<leader>tt", ":tab terminal<CR>", { desc = "open terminal in new tab" })
vim.keymap.set("n", "<leader>t-", ":new|terminal<CR>", { desc = "open terminal in horizontal split" })
vim.keymap.set("n", "<leader>t/", ":vnew|terminal<CR>", { desc = "open terminal in vertical split" })
