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
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
})

vim.cmd.colorscheme("catppuccin")

-- Статус бар
require("lualine").setup({
  options = {
    theme = "catppuccin",
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

--Автодополнение
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

