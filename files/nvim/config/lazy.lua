-- Load other configurations
-- Set the shell to Zsh
vim.cmd('set shell=/opt/homebrew/bin/zsh')

-- Compile and cache lua files on reload
-- if vim.loader then
--  vim.loader.enable()
-- end

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'ThePrimeagen/vim-be-good', -- Improve vim skills by playing games
  require('config.keymaps'),
  require('config.options'),
  require('plugins.colorscheme'),
  require('plugins.editor'),
  require('plugins.lsp'),
  require('plugins.treesitter'),
})

  
