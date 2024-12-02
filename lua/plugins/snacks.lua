-- Startup splash
return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      sections = {
        { section = 'header' },
        {
          icon = ' ',
          title = 'Keymaps',
          section = 'keys',
          padding = 1,
        },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1, pane = 2 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1, pane = 2 },
        { section = 'startup' },
      },
    },
  },
}
