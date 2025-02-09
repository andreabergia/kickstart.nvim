return {
  'folke/zen-mode.nvim',
  keys = {
    {
      '<leader>fz',
      function()
        require('zen-mode').toggle {}
      end,
      desc = 'Toggle Zen mode',
    },
  },
}
