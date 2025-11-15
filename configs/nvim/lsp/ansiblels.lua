vim.lsp.config("ansiblels", {
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml", "yml", "ansible" },
  root_dir = function(fname)
    local found = vim.fs.find({ "ansible.cfg", ".ansible-lint", ".git" }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
  end,
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      executionEnvironment = {
        enabled = false,
      },
      python = {
        interpreterPath = "python",
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint",
        },
      },
    },
  },
})

vim.lsp.enable("ansiblels")
