return {
  'linrongbin16/gitlinker.nvim',
  config = function()
    require('gitlinker').setup()

    vim.keymap.set('n', '<leader>gy', '<cmd>GitLink<cr>', { desc = 'Yank git link' })
    vim.keymap.set('n', '<leader>gY', '<cmd>GitLink!<cr>', { desc = 'Open git link' })
  end,
}
