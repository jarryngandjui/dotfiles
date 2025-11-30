return {
  -- Improve vim skills by playing games
  {
    "ThePrimeagen/vim-be-good",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Full signature help, docs and completion on lua files
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    opts = {
      library = {
       { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- a collection of LSP server configurations for the Nvim LSP client
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {}},
      },
      automatic_enable = {
        "pyright",
        "ts_ls"
      },
      config = function()
        local servers = {
          "html", -- HTML LSP
          "rust_analyzer", -- Rust Analyzer
          "pyright",
          "tailwindcss", -- Tailwind CSS LSP
          "sqls", -- SQL LSP
          "clangd", -- C/C++ LSP
          "eslint", -- ESLint LSP
          "nextls", -- Next.js LSP
          "jsonls", -- JSON LSP
          "bashls", -- Bash LSP
          "cssls", -- CSS LSP
          "dockerls", -- Dockerfile LSP
          "docker_compose_language_service", -- Docker Compose LSP
          "yamlls", -- YAML LSP
          "nginx_language_server", -- Nginx LSP
          "lua_ls", -- Lua LSP
          "gopls", -- golang
          "emmet_ls",
          "cmake",
        }
      
        local lspconfig = require "lspconfig"
        local masonlsp = require "mason-lspconfig"
        local nvlsp = require "nvchad.configs.lspconfig"

        masonlsp.setup({
          ensure_installed = servers,
          handlers = {
            function(server_name)
              lspconfig[server_name].setup {
                on_attach = nvlsp.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
              }
            end,
          },
        })
      end,
  },

  -- basic highlighting for any language syntax tree parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "python",
        "json",
      },
    },
  },

  -- Git Fugitive is the premier Vim plugin for Git
  { "tpope/vim-fugitive" },

  -- Git branch viewer for Vim/Neovim
  { "rbong/vim-flog", dependencies = {
    "tpope/vim-fugitive",
  }, lazy = false },

  -- Git diff side by side DiffviewFileHistory
  { "sindrets/diffview.nvim", lazy = false },
}
