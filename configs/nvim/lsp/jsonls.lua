vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_dir = function(fname)
    local found = vim.fs.find({ ".git", "package.json" }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.enable("jsonls")
