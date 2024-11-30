return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<leader>bd', function()
      require('bufdelete').bufdelete(0, true)
    end, { desc = 'Delete' })
  end,
}
