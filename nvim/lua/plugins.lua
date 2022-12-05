-- Install packer if it isn't already installed
local ensure_packer = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

local is_bootstrap = ensure_packer()
local packer = require('packer')

-- List packages to install
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Change surrounding parentheses
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- Detect indentation settings
  use 'tpope/vim-sleuth'

  -- Return to the last postion when reopening a file
  use 'farmergreg/vim-lastplace'

  -- Shortcuts for commenting
  use 'numToStr/Comment.nvim'

  -- Material theme
  use 'marko-cerovac/material.nvim'

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- Git status
  use 'lewis6991/gitsigns.nvim'

  -- Tree view
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- Syntax-aware editing
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'RRethy/nvim-treesitter-endwise'

  -- Pretty buffers
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Jump to file
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

  -- Language server
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  if is_bootstrap then
    packer.sync()
  end
end)

-- Recompile packages when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
