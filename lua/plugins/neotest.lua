return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- Languages
    'rouge8/neotest-rust',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-rust' {
          args = { '--no-capture' },
          dap_adapter = 'lldb',
        },
      },

      vim.keymap.set('n', '<leader>tt', function()
        require('neotest').run.run()
      end, { desc = '[T]est [t]est nearest' }),

      vim.keymap.set('n', '<leader>tf', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = '[T]est [f]ile' }),

      vim.keymap.set('n', '<leader>td', function()
        require('neotest').run.run { strategy = 'dap' }
      end, { desc = '[T]est [d]ebug nearest' }),

      vim.keymap.set('n', '<leader>to', function()
        require('neotest').output.open { auto_close = true }
      end, { desc = '[T]est [o]utput' }),

      vim.keymap.set('n', '<leader>tp', function()
        require('neotest').output_panel.toggle()
      end, { desc = '[T]est output [p]anel' }),
    }
  end,
}
