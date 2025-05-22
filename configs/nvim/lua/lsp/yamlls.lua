local lspconfig = require("lspconfig")

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = require("schemastore").yaml.schemas(),
			validate = true,
			hover = true,
			completion = true,
		},
	},
})
