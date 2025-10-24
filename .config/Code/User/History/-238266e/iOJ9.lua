vim.opt.number = true           -- показывать номера строк
vim.opt.relativenumber = true   -- относительные номера
vim.opt.expandtab = true        -- табы как пробелы
vim.opt.shiftwidth = 2          -- размер отступа
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false            -- не переносить строки
vim.opt.termguicolors = true    -- 24-бит цвета
vim.opt.clipboard = "unnamedplus" -- системный буфер обмена

-- Тема
vim.cmd.colorscheme("tokyonight")
-- Статус бар
require("lualine").setup({
  options = {
    theme = "tokyonight",
  }
})
-- Подсветка кода
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "lua", "javascript" },
  highlight = { enable = true },
  indent = { enable = true },
})
-- Лсп
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
