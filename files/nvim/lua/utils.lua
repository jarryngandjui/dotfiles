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
function M.nmap(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
end

---setup default capabilities and configuration for an lsp
---@param ... table<any, any> Overrides to apply to the configuration
function M.lsp_make_conf(...)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits", "documentHighlight" },
  }
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

  return vim.tbl_deep_extend("force", {
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
      }),
    },
    capabilities = capabilities,
  }, ...)
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
