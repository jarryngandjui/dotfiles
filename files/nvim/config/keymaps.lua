-- Contains all the key mappings
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>s/', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Gitsigns keymaps
vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk, { desc = 'Git stage hunk' })
vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, { desc = 'Git reset hunk' })
vim.keymap.set('n', '<leader>hS', require('gitsigns').stage_buffer, { desc = 'Git stage buffer' })
vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk, { desc = 'Git undo stage hunk' })
vim.keymap.set('n', '<leader>hR', require('gitsigns').reset_buffer, { desc = 'Git reset buffer' })
vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = 'Git preview hunk' })
vim.keymap.set('n', '<leader>hb', function() require('gitsigns').blame_line { full = false } end, { desc = 'Git blame line' })
vim.keymap.set('n', '<leader>hd', require('gitsigns').diffthis, { desc = 'Git diff against index' })
vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis '~' end, { desc = 'Git diff against last commit' })
vim.keymap.set('n', '<leader>tb', require('gitsigns').toggle_current_line_blame, { desc = 'Toggle git blame line' })
vim.keymap.set('n', '<leader>td', require('gitsigns').toggle_deleted, { desc = 'Toggle git show deleted' })
vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select git hunk' })

