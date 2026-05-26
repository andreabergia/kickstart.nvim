-- autopairs
-- https://github.com/windwp/nvim-autopairs
-- Auto-bracket-on-completion is handled natively by blink.cmp
-- (`completion.accept.auto_brackets`), so no completion-engine integration here.

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true,
    ts_config = {
      lua = { 'string' },
      javascript = { 'template_string' },
      typescript = { 'template_string' },
    },
  },
}
