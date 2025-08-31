local lspconfig = require("lspconfig")

-- caps
local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
  caps = blink.get_lsp_capabilities(caps)
end

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
      completion = { callSnippet = "Replace" },
    },
  },
  on_attach = function(client, bufnr) end,
  capabilities = caps,
})

