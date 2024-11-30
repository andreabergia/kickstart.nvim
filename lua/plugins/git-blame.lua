return {
  'FabijanZulj/blame.nvim',
  lazy = false,
  config = function()
    require('blame').setup {}

    vim.keymap.set('n', '<leader>gb', function()
      vim.cmd 'BlameToggle'
    end, { desc = 'Blame toggle' })
  end,
}
