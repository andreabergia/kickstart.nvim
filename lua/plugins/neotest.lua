return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- Languages
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'rustaceanvim.neotest',
      },

      vim.keymap.set('n', '<leader>tt', function()
        require('neotest').run.run()
      end, { desc = 'Nearest test' }),

      vim.keymap.set('n', '<leader>tf', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = 'File' }),

      vim.keymap.set('n', '<leader>td', function()
        require('neotest').run.run { strategy = 'dap' }
      end, { desc = 'Debug nearest' }),

      vim.keymap.set('n', '<leader>to', function()
        require('neotest').output.open { auto_close = true }
      end, { desc = 'Output' }),

      vim.keymap.set('n', '<leader>tp', function()
        require('neotest').output_panel.toggle()
      end, { desc = 'Output panel' }),
    }
  end,
}
