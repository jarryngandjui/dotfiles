local utils = require("utils")

-- Vim shell 
vim.cmd('set shell=/opt/homebrew/bin/zsh')

-- Compile and cache lua files on reload
if vim.loader then
 vim.loader.enable()
end

-- NeoVim Setup Configs 
local M = {}
local is_path_loaded = false
local is_lazy_loaded = false
local is_setup_called = false
local base_path = os.getenv("HOME") .. "/.config/nvim"
local paths = {
  base_path .. "/?.lua",
  base_path .. "/?/?.lua",
  base_path .. "/?/init.lua",
}
local plugins = {
  { import = "plugins" },
}

---@param plugin fun()|string|table
local function add_plugin(plugin)
  table.insert(plugins, plugin)
end

local function load_paths()
  -- Load configuration paths
  if is_path_loaded then
    return
  end
  
  for _, path in ipairs(paths) do
    utils.add_path(path)
  end
  
  is_path_loaded = tru

end

local function load_lazy()
  -- Install `lazy.nvim` plugin manager
  if is_lazy_loaded then
    return
  end

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

  is_lazy_loaded = true
end

local function load_plugins()
  -- Load plugings configurations
  if not is_lazy_loaded then
    return
  end

  add_plugin({ import = "plugins.extras.vimbegood" })

  require("lazy").setup(plugins)
end

function M.setup(user_config)
  if setup_called then
    -- only call setup once
    return
  end
  
  require('config.keymaps')
  require('config.options')
  load_paths()
  load_lazy()
  load_plugins()
end

return M

