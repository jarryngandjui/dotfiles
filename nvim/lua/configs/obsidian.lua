vim.opt.conceallevel = 1

local options = {
  workspaces = {
    {
      name = "secondbrain",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second brain",
    },
  },
  templates = {
    folder = "5. Templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
  attachments = {
    img_folder = "7.\\ Files",  -- default folder to save images
  }
}

return options
