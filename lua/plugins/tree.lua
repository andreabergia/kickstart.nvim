return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()

    local api = require 'nvim-tree.api'

    vim.keymap.set('n', '<C-,>', api.tree.toggle, { desc = 'Toggle tree' })
    vim.keymap.set('n', '<leader>ft', api.tree.toggle, { desc = '[F]ile [T]ree toggle' })
  end,
}
