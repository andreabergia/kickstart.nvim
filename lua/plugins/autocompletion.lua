-- Autocompletion via blink.cmp.
-- Keymap reference: `:help blink-cmp-config-keymap` (default preset:
-- <C-space> show/toggle, <Tab>/<S-Tab> select, <CR> accept, <C-e> cancel,
-- <C-y> select+accept, <C-n>/<C-p> next/prev).
return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  opts = {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = false },
      -- Mirror the old nvim-cmp `preselect = None` + `noinsert` behavior:
      -- nothing is selected until the user moves into the list.
      list = { selection = { preselect = false, auto_insert = false } },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'lazydev' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
    signature = { enabled = true },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
