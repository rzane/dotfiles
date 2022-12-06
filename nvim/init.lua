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

-- Tidy up whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--------------------------
-- Plugins
--------------------------

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
-- Treesitter
--------------------------

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find file" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "find recent file" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "search files" })
vim.keymap.set('n', '<leader>fw', builtin.buffers, { desc = "find buffer" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "find command" })

--------------------------
-- Theme
--------------------------

require("material").setup({
  plugins = { "gitsigns", "nvim-tree", "nvim-web-devicons", "telescope", "which-key" },
  contrast = {
    floating_windows = true
  },
})

vim.cmd("colorscheme material")

--------------------------
-- Treesitter
--------------------------

require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "lua", "help", "gitcommit" }
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

vim.keymap.set("n", "<leader>af", function()
  vim.lsp.buf.format({ async = true, timeout = 3000 })
end)

vim.keymap.set("i", "<C-space>", vim.lsp.buf.completion, { desc = "toggle completion" })
vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename, { desc = "rename symbol" })
vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { desc = "code actionn" })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
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

--------------------
-- Test runner
--------------------

require("nvim-test").setup()

require('nvim-test.runners.rspec'):setup({
  command = "bundle",
  args = { "exec", "rspec" }
})

vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "run the full test suite" })
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "run the current test" })
vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "run the nearest test" })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "run the last test" })
vim.keymap.set("n", "<leader>te", ":TestEdit<CR>", { desc = "edit tests for the current file" })
