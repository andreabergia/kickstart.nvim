-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      keys = {},
    },

    -- Document existing key chains
    spec = {
      { '<leader>b', group = 'Buffers' },
      { '<leader>c', group = 'Code', mode = { 'n', 'x' } },
      { '<leader>f', group = 'File' },
      { '<leader>d', group = 'Debug' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Test' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>h', group = 'Git hunk', mode = { 'n', 'v' } },
      { '<leader>g', group = 'Git' },
      { '<leader>p', group = 'Persistence' },
    },
  },
}
