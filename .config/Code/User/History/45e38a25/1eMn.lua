-- Подключение lazy.nvim

local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


-- Плагины
return require("lazy").setup({
  -- Библиотека для других плагинов
  "nvim-lua/plenary.nvim",

  -- Интерфейс
  {"catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- тема
  "nvim-lualine/lualine.nvim",       -- статусная строка
  "nvim-tree/nvim-tree.lua",         -- файловый браузер
  "nvim-telescope/telescope.nvim",   -- поиск

  -- Улучшенный синтаксис
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  "lewis6991/gitsigns.nvim",

  -- LSP и автокомплит
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Форматирование и линтинг
  "jose-elias-alvarez/null-ls.nvim",

  -- Отладка (если нужно)
  "mfussenegger/nvim-dap",
})
