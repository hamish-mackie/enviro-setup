return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  event = "InsertEnter",
  dependencies = {
    -- snippet engine & bridge
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",                 -- snippet source for nvim-cmp

    -- core completion engine
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- LSP signature help
    "hrsh7th/cmp-nvim-lsp-signature-help",

    -- cmdline & search completion
    "hrsh7th/cmp-cmdline",

    -- nice icons next to items
    "onsails/lspkind.nvim",

    -- optional: emoji, calculator, git, crates, etc.
    "hrsh7th/cmp-emoji",

    -- Mason & LSP installer
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",

    -- autopairs
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- basic nvim-cmp setup
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
        }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "emoji" },
      }),
    })

    -- cmdline setup
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- blink.cmp-specific setup
    local blink_cmp = require("blink.cmp")
    blink_cmp.setup({
      keymap = { preset = "super-tab" },
      completion = {
        documentation = { auto_show = false },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          python    = { inherit_defaults = true, "lsp", "path", "snippets", "buffer" },
          gitcommit = { "buffer" },
        },
      },
      snippets = {
        preset = "luasnip",
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          -- prioritize LSP results over others
          function(a, b)
            if a.source_id == "lsp" and b.source_id ~= "lsp" then
              return true
            end
            if b.source_id == "lsp" and a.source_id ~= "lsp" then
              return false
            end
          end,
          "score",
          "sort_text",
        },
      },
    })
  end,
}
