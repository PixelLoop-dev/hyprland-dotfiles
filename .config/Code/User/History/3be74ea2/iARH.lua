-- Основные настройки
vim.opt.number = true           -- номера строк
vim.opt.relativenumber = true   -- относительные номера
vim.opt.expandtab = true        -- табы как пробелы
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "           -- пробел как leader


-- Автоустановка lazy.nvim
local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Плагины
require("lazy").setup({
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-lualine/lualine.nvim',
  'folke/tokyonight.nvim',
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'lewis6991/gitsigns.nvim',
})

-- Тема
vim.cmd[[colorscheme tokyonight]]

-- Статусная строка
require('lualine').setup {
  options = { theme = 'tokyonight' }
}

