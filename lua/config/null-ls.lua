local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.xmllint,
    },
})

null_ls.builtins.diagnostics.golangci_lint.with({
  extra_args = { "--config", ".golangci.yml" },
})
