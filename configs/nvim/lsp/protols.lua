vim.lsp.config("protols", {
  cmd = { "protols" },
  filetypes = { "proto" },
  root_dir = function(fname)
    local found = vim.fs.find({ "buf.yaml", "buf.work.yaml", ".git" }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
  end,
  on_attach = function(client, bufnr)
    -- disable auto-formatting
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- optional: add keymaps here
  end,
})

vim.lsp.enable("protols")
