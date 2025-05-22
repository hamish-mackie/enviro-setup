-- lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- (optional) adjust Mason settings here
      ui = {
        icons = {
          package_installed   = "✓",
          package_pending     = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed   = { "lua_ls", "clangd", "pyright", "yamlls", "jsonls", "ansiblels" },
      automatic_installation = true,  -- install on startup if missing
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
      local lspconfig = require("lspconfig")
      for _, srv in ipairs(opts.ensure_installed) do
        lspconfig[srv].setup({})
      end
    end,
  },
}
