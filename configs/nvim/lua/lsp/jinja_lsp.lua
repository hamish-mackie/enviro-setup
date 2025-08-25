local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Resolve binary robustly
local jinja_cmd = vim.fn.exepath("jinja-lsp")
if jinja_cmd == "" then
    jinja_cmd = vim.fn.expand("~/.cargo/bin/jinja-lsp")
end

-- Ensure .yaml.j2 files are treated as Jinja
vim.filetype.add({
    pattern = {
        [".*%.ya?ml%.j2"] = "jinja",
    },
})

lspconfig.jinja_lsp.setup {
    cmd = { jinja_cmd },
    filetypes = { "jinja", "jinja2", "j2" },
    settings = { lang = "python" },
    capabilities = capabilities,
}
