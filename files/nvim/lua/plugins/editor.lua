-- Editor config such as tabs, autocomplete, git info
return {
  -- Automatically detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- Automatically complete {[()]} 
  { "windwp/nvim-autopairs", config = true },

  -- Full signature help, docs and completion
  {
    "folke/neodev.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    opts = {},
  },

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
  
  -- Single tabpage interface for easily cycling through diffs
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        -- Your custom configuration options here
      })
      
      vim.api.nvim_set_keymap('n', '<leader>dvo', ':DiffviewOpen<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dvc', ':DiffviewClose<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dvr', ':DiffviewRefresh<CR>', { noremap = true, silent = true })
    end
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
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to next hunk' })

      map({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to previous hunk' })

      -- Actions
      -- visual mode
      map('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage git hunk' })
      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset git hunk' })
      -- normal mode
      map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
      map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
      map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
      map('n', '<leader>hb', function()
        gs.blame_line { full = false }
      end, { desc = 'git blame line' })
      map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
      map('n', '<leader>hD', function()
        gs.diffthis '~'
      end, { desc = 'git diff against last commit' })

      -- Toggles
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
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

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 36,
        signcolumn = "no",
      },
      filters = {
        dotfiles = false,
      },
      git = {
        ignore = false,
      },
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer Toggle" },
      { "<leader>ef", "<cmd>NvimTreeFocus<cr>", desc = "Explorer Focus" },
      { "<leader>eF", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer Find File" },
    },
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

