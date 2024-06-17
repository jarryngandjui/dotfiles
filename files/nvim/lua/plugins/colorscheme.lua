-- poimandres configuration
return {
  -- 'olivercederborg/poimandres.nvim',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require('poimandres').setup {}
  -- end,
  -- init = function()
  --   vim.cmd("colorscheme poimandres")
  -- end
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
            integrations = {},
    })
    vim.cmd([[colorscheme catppuccin]])
  end,

}

