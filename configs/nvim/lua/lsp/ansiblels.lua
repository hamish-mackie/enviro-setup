local lspconfig = require("lspconfig")

lspconfig.ansiblels.setup({
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
