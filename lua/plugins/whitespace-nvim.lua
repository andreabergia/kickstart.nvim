return {
  'johnfrankmorgan/whitespace.nvim',
  config = function()
    require('whitespace-nvim').setup {
      -- configuration options and their defaults

      -- `highlight` configures which highlight is used to display
      -- trailing whitespace
      highlight = 'DiffDelete',

      -- `ignored_filetypes` configures which filetypes to ignore when
      -- displaying trailing whitespace
      ignored_filetypes = {
        'TelescopePrompt',
        'Trouble',
        'help',
        'dashboard',
        'snacks_dashboard',
        'snacks_win',
        'help',
        'git',
      },

      -- `ignore_terminal` configures whether to ignore terminal buffers
      ignore_terminal = true,

      -- `return_cursor` configures if cursor should return to previous
      -- position after trimming whitespace
      return_cursor = true,
    }

    -- remove trailing whitespace with a keybinding
    vim.keymap.set('n', '<leader>ct', require('whitespace-nvim').trim, { desc = 'Trim' })
  end,
}
