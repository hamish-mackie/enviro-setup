vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_dir = function(fname)
    local found = vim.fs.find({ ".git", "ansible.cfg", "package.json" }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
  end,
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
      hover = true,
      completion = true,
    },
  },
})

vim.lsp.enable("yamlls")
