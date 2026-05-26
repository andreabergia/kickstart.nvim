-- Show the diagnostic float on cursor hold.
-- Triggered by `updatetime` (see options.lua).
local grp = vim.api.nvim_create_augroup('DiagnosticFloat', { clear = true })
vim.api.nvim_create_autocmd('CursorHold', {
  group = grp,
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
