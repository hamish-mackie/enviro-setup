return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
--  {
--    "neovim/nvim-lspconfig",
--    config = function()
--      require "configs.lspconfig"
--    end,
--  },

  {
    "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css", "cpp", "python"
        },
      },
  },

    -- Mason: LSP/DAP/linter/formatter installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPConfig: Bridges mason with the lspconfig plugin
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- List of servers to automatically ensure installed
        ensure_installed = { "clangd", "clang-format" },
      })
    end,
  },
  -- nvim-lspconfig: The actual LSP client configs
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- C++ Language Server: clangd
      lspconfig.clangd.setup({})
    end,
  },
  -- cmake tools
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"    -- Make sure you have plenary
      -- "stevearc/overseer.nvim",  -- Optional if you want Overseer
      -- "akinsho/toggleterm.nvim"  -- Optional if you want ToggleTerm
    },
    config = function()
      require("cmake-tools").setup({
        -- Put your plugin config here.
        -- You can leave it empty to use defaults:
        -- cmake_command = "cmake",
        -- ...
      })
    end,
  },
}
