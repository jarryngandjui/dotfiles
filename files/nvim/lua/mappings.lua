require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })



  -- Single tabpage interface for easily cycling through diffs
vim.api.nvim_set_keymap('n', '<leader>dvo', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dvc', ':DiffviewClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dvr', ':DiffviewRefresh<CR>', { noremap = true, silent = true })
