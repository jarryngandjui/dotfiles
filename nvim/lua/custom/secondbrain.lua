-- initialized inside obsidian.nvim module
local M = {}
local obsidian
local opts

--- Calculates the date of the previous or current Monday.
--- @return string: The date string in "YYYY-MM-DD" format.
local function get_monday_date()
    local now = os.time()
    -- Get the weekday (Sunday=1, Monday=2, ..., Saturday=7)
    local weekday = tonumber(os.date("%w", now))
    local days_to_subtract = (weekday == 1) and 6 or (weekday - 2)
    local monday_ts = now - (days_to_subtract * 24 * 60 * 60)
    -- Format the date as YYYY-MM-DD
    return os.date("%Y-%m-%d", monday_ts)
end

--- Shared function to create a new note sub-directory based on a template and date prefix.
--- @param prefix_dir string: The sub-directory path relative to '6.zettelkasten' (e.g., '📆 Big7').
--- @param template_file string: The name of the template file.
--- @param suffix_name string: The descriptive part of the filename.
local function create_sprint_note(prefix_dir, template_file, suffix_name)
    local monday_date = get_monday_date()
    local year = string.sub(monday_date, 1, 4)  -- YYYY
    local month = string.sub(monday_date, 6, 7) -- MM
    
    local filename = monday_date .. " " .. suffix_name .. ".md"
    
    -- Example: 6.zettelkasten/📆 Big7/2025/12
    local dir_path_relative = string.format("%s/%s/%s", prefix_dir, year, month)
    local full_path_relative = string.format("6.zettelkasten/%s/%s", dir_path_relative, filename)

    local vault_path
    for _, ws in ipairs(opts.workspaces) do
        if ws.name == "secondbrain" then
            -- Use vim.fn.expand to resolve the '~' in the path
            vault_path = vim.fn.expand(ws.path) 
            break
        end
    end

    if not vault_path then
        vim.notify("Error: 'secondbrain' workspace path not found in Obsidian options.", vim.log.levels.ERROR)
        return
    end

    local target_dir = vim.fn.resolve(vault_path .. "/6.zettelkasten/" .. dir_path_relative)
    
    if vim.fn.isdirectory(target_dir) == 0 then
        vim.fn.mkdir(target_dir, "p") 
    end

    obsidian.open_note({
        title = full_path_relative,
        template = template_file,
        workspace = "secondbrain",
    })
end

--- Public function to create a new Big 7 Sprint note.
local function SprintBig7()
    create_sprint_note(
        "📆 Big7",
        "🗓️ {{date}} Big 7 Check-in.md",
        "Big 7 Check-in"
    )
end

--- Public function to create a new Workout Log Sprint note.
local function SprintWorkout()
    create_sprint_note(
        "🏋🏿 Fitness/log",
        "🏋🏿‍♂️ Workout Log.md",
        "Workout log"
    )
end

function M.setup(obsidian_client, obsidian_opts)
    obsidian = obsidian_client
    opts = obsidian_opts

    vim.api.nvim_create_user_command('SprintBig7', SprintBig7, {
        desc = "Creates a new Big 7 check-in note for the current week's Monday.",
    })

    vim.api.nvim_create_user_command('SprintWorkout', SprintWorkout, {
        desc = "Creates a new Workout Log note for the current week's Monday.",
    })

    local map = vim.keymap.set
    map("n", "<leader>sbs", ":SprintBig7<CR>", { desc = "SecondBrain: New Big 7 Check-in (Weekly)" })
    map("n", "<leader>sbw", ":SprintWorkout<CR>", { desc = "SecondBrain: New Workout Log (Weekly)" })
end

return M
