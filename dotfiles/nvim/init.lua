-- init.lua
vim.g.mapleader = " "

-- Bootstrap Lazy.nvim
require("core.lazy_setup")

-- Core setup
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.file_types")

-- Load plugins
require("plugins")

-- Theme
-- vim.cmd.colorscheme("catppuccin")
vim.cmd("colorscheme monokai-pro")

vim.lsp.enable({
	"clangd",
	"pyright",
	"ruff",
	"jinja_lsp",
	"ansiblels",
	"jsonls",
	"lua_ls",
	"protols",
	"yamlls",
})
