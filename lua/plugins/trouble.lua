return {
  'folke/trouble.nvim',
  opts = {
    auto_preview = false, -- don't auto-preview files as you navigate
    auto_jump = false, -- don't auto-jump to files
    focus = true, -- focus Trouble window when opened
  },
  cmd = 'Trouble',
  -- stylua: ignore
  keys = {
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xf',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols'
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Definitions / references',
    },
    {
      '<leader>xg',
      '<cmd>Trouble telescope toggle<cr>',
      desc = 'Telescope results (Trouble)',
    },
    {
      ']x',
      function() require('trouble').next({ skip_groups = true, jump = true }) end,
      desc = 'Next Trouble result',
    },
    {
      '[x',
      function() require('trouble').prev({ skip_groups = true, jump = true }) end,
      desc = 'Previous Trouble result',
    },
  },
}
