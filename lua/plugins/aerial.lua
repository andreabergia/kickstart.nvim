return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      backends = { 'lsp', 'treesitter', 'markdown' },
    }

    vim.keymap.set('n', '<leader>fa', '<cmd>AerialToggle!<CR>', { desc = '[F]ile [A]erial' })
  end,
}
