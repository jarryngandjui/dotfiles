return {
  -- Improve vim skills by playing games
  {
    'ThePrimeagen/vim-be-good'
  },

  {
    "lervag/vimtex",
    ft = { "tex" },
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      -- Use latexmk for compilation and set the output directory to "build"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build", -- output directory
        aux_dir = "build", -- auxiliary files directory
        options = {
          "-pdf", -- compile to PDF
          -- "-interaction=nonstopmode", -- nonstop interaction mode
          "-synctex=1", -- enable synctex for better forward/backward search
          "-shell-escape", -- allow shell escapes if needed
          "-bibtex",
          "-output-format=pdf",
          "-noemulate-aux-dir",
        },
      }
      vim.g.vimtex_view_method = "zathura"

      -- vim.g.vimtex_view_general_viewer = "zathura"
      -- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Full signature help, docs and completion
  {
    "folke/neodev.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "clangd",
        "py",
        "pyright",
        "mypy",
        "ruff",
        "clang-format",
      },
    },
  },

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

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "../custom/null-ls.lua"
    end,
  },

  {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("custom.luasnip").luasnip(opts)
    end,
  },

  -- Single tabpage interface for easily cycling through diffs
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

}
