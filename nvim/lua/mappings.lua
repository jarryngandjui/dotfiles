require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local harpoon = require("harpoon")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gho", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>ghc", ":DiffviewClose<CR>", { desc = "Close the current diffview" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gro", ":GitRemoteUrlOpen<CR>", { desc = "Open git remote url" })
map("n", "<leader>grc", ":GitRemoteUrlCopy<CR>", { desc = "Copy git remote url to clipboard" })


-- Obsidian
-- map("n", "<leader>obi", ":ObsidianPasteImg", { desc = "Obsidian paste image from clipboard" }) -- pasting images needs work
map("n", "<leader>obl", ":ObsidianBacklinks<CR>", { desc = "Obsidian references to the current buffer" })
map("n", "<leader>obo", ":ObsidianTOC<CR>", { desc = "Obsidian [o]utline" })
map("n", "<leader>obs", ":ObsidianSearch<CR>", { desc = "Obsidian [s]earch with ripgrep" })
map("n", "<leader>obt", ":ObsidianTemplate<CR>", { desc = "Obsidian insert [t]emplate" })
-- Render Markdown
map("n", "<leader>obm", ":RenderMarkdown toggle<CR>", { desc = "Toggle [M]arkdown view in obsidian" })

-- harpoon
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add current file to list" })
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle Quick Menu" })

-- Direct Jumps (select first 4 files)
map("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to item 1" })
map("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to item 2" })
map("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to item 3" })
map("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to item 4" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file in list" })
map("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file in list" })
