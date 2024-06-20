---@class NeoUtils
local M = {}

-- add to the path.
-- This allows for requiring lua modules from that path
---@param path string The path to add
function M.add_path(path)
  package.path = package.path .. ";" .. path
end


-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
function M.nmap(bufnr, keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
end

---Trigger the LSP's provided organizeImports helper (for TypeScript)
function M.lsp_organize_imports()
  local params = { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
  vim.lsp.buf.execute_command(params)
end

---Check if a value exists in a table
---@param table table The table to check
---@param value any The value to check for
---@return boolean is_in_table Whether the value exists in the table
function M.exists_in_table(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end

  return false
end
return M
