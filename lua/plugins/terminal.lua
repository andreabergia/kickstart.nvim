return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-/>]],
    }

    -- TODO it's super small
    local Terminal = require('toggleterm.terminal').Terminal
    local vertical_term = Terminal:new { direction = 'vertical', count = 2 }
    vim.keymap.set('n', '<C-.>', function()
      vertical_term:toggle()
    end, { desc = 'Open terminal horizontally' })
  end,
}
