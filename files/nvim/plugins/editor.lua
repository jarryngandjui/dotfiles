-- Editor config such as tabs, autocomplete, git info
return {
  {
    -- code completions, lsp, etc.
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  },
  {
    -- add gutter symbols gutter or sign column 
    -- to indicate added, changed
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    -- highly customizable bottom statusline 
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    -- add indentation guides
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
  },
  {
    -- comment string detection
    'numToStr/Comment.nvim',
    opts = {},
  },
}

