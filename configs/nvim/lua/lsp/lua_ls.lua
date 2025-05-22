local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the server which Lua version you use (most Neovim configs use LuaJIT)
        version = "LuaJIT",
        -- Setup your path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,  -- optional: disable prompts
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },

  -- Optional: you may want to pass on_attach / capabilities for nvim-cmp integration
  on_attach = function(client, bufnr)
    -- your keymaps, etc.
  end,

  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
