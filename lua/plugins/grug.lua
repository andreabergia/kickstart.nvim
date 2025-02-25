return {
  'MagicDuck/grug-far.nvim',
  config = function()
    local grug_far = require 'grug-far'
    grug_far.setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }

    vim.keymap.set('n', '<leader>fg', function()
      grug_far.open {}
    end, { desc = 'Grep and replace' })
  end,
}
