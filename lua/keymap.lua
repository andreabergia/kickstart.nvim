-- See https://www.jonashietala.se/blog/2023/10/01/rewriting_my_neovim_config_in_lua/
--  See `:help vim.keymap.set()`

M = {}

M.init = function()
  -- Clear highlights on search when pressing <Esc> in normal mode
  --  See `:help hlsearch`
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
  -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
  -- is not what someone will guess without a bit more experience.
  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

M.gitsigns = {
  {
    ']c',
    function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        require('gitsigns').nav_hunk 'next'
      end
    end,
    desc = 'Jump to next git [c]hange',
  },
  {
    '[c',
    function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        require('gitsigns').nav_hunk 'prev'
      end
    end,
    desc = 'Jump to previous git [c]hange',
  },
}

return M
