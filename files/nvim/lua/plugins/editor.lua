-- Editor config such as tabs, autocomplete, git info
return {
  -- Automatically detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      require('which-key').setup {}
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
    end,
  },  

  {
    -- code completions, lsp, etc.
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
	"L3MON4D3/LuaSnip",
	version = "v2.1",
	build = "make install_jsregexp"
      },
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
    keys = function()
      local keys = {
        { "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Git stage hunk" },
        { "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Git reset hunk" },
        { "<leader>hS", "<cmd>lua require('gitsigns').stage_buffer()<cr>", desc = "Git stage buffer" },
        { "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Git undo stage hunk" },
        { "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Git reset buffer" },
        { "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Git preview hunk" },
        { "<leader>hb", function() require('gitsigns').blame_line { full = false } end, desc = "Git blame line" },
        { "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "Git diff against index" },
        { "<leader>hD", function() require('gitsigns').diffthis('~') end, desc = "Git diff against last commit" },
        { "<leader>tb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", desc = "Toggle git blame line" },
        { "<leader>td", "<cmd>lua require('gitsigns').toggle_deleted()<cr>", desc = "Toggle git show deleted" },
        { "o", "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select git hunk" },
        { "x", "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select git hunk" },
      }
      return keys
    end,
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

  {
  -- customizable fuzzy finder plugin for Neovim
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  keys = function()
    local keys = {
      { "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "[?] Find recently opened files" },
      { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "[ ] Find existing buffers" },
      { "<leader>/", function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, desc = "[/] Fuzzily search in current buffer" },
      { "<leader>s/", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "[S]earch [G]rep" },
      { "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = "Search [G]it [F]iles" },
      { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "[S]earch [F]iles" },
      { "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "[S]earch [H]elp" },
      { "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "[S]earch current [W]ord" },
      { "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "[S]earch by [G]rep" },
      { "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "[S]earch [D]iagnostics" },
      { "<leader>sr", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "[S]earch [R]esume" },
    }
    return keys
  end,
   opts = function()
      return {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          path_display = { "truncate" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          use_less = true,
        },
      }
    end,
  },
}

