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
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>f', group = '[F]ile' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>x', group = '[X]Trouble' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
