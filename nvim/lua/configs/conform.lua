local options = {
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    astro = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    css = { "stylelint", "prettier" },
    sh = { "shellcheck", "shfmt" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = false,
  },
}

return options
