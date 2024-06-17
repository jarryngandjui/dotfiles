-- LSP configurations
local utils = require("utils")
local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}
local formatters = {
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
}
local servers = {
  "eslint",
  "tsserver",
  "lua_ls",
  "denols",  
  "astro",
  "tailwindcss",
  "jsonls",
  "vimls",
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "E501" },
          },
        },
      },
    },
},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
            callSnippet = "Replace",
        },
        diagnostics = {
            globals = { "vim" },
        },
      },
    },
  },
}

-- _G makes this function available to vimscript lua calls
_G.lsp_organize_imports = utils.lsp_organize_imports

local lsp_on_attach = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      print("LSP callback")
      -- TODO: move this to typescript
      vim.cmd([[command! OR lua lsp_organize_imports()]])

      utils.nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      utils.nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      utils.nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      utils.nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      utils.nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      utils.nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      utils.nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      utils.nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      utils.nmap('n', 'gO', lsp_utils.lsp_organize_imports, bufopts)

      -- See `:help K` for why this keymap
      utils.nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      utils.nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      utils.nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      utils.nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      utils.nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      utils.nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end,
  })

  mason.setup({ ui = { border = border } })

  mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
    ui = { check_outdated_servers_on_open = true },
  })

  local handlers = {
    function(server_name)
      lspconfig[server_name].setup(make_conf({}))
    end,
  }

  if utils.exists_in_table(servers, "eslint") then
    handlers["eslint"] = function()
      lspconfig.eslint.setup({
        root_dir = require("lspconfig/util").root_pattern(
          "eslint.config.js",
          "eslint.config.mjs",
          ".eslintrc.js",
          ".eslintrc.json",
          ".eslintrc"
        ),
      })
    end
  end

  if utils.exists_in_table(servers, "tsserver") then
    handlers["tsserver"] = function()
      lspconfig.tsserver.setup(make_conf({
        handlers = {
          ["textDocument/definition"] = function(err, result, ctx, ...)
            if #result > 1 then
              result = { result[1] }
            end
            vim.lsp.handlers["textDocument/definition"](err, result, ctx, ...)
          end,
        },
        root_dir = require("lspconfig/util").root_pattern("tsconfig.json"),
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
            },
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            },
          },
        },
      }))
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- Helpers to install LSPs and maintain them
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = lsp_on_attach,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = false,
      },
      formatters_by_ft = formatters,
    },
  },

  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    },
  },
}
