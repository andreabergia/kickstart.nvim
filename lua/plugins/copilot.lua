return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-.>',
          next = '<M-]>',
          prev = '<M-[>',
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'nvim-cmp',
    optional = true,
    dependencies = { -- this will only be evaluated if nvim-cmp is enabled
      {
        'zbirenbaum/copilot-cmp',
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require 'copilot_cmp'
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          require('lspconfig').lua_ls.setup {
            on_attach = function()
              copilot_cmp._on_insert_enter {}
            end,
          }
        end,
      },
    },
  },
}
