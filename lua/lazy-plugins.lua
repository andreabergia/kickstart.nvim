--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--
-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end
--
-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

require('lazy').setup({
  require 'plugins.editor',
  require 'plugins.gitsigns',
  require 'plugins.git',
  require 'plugins.git-blame',
  require 'plugins.which-key',
  require 'plugins.project',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autoformat',
  require 'plugins.autocompletion',
  require 'plugins.colorscheme',
  require 'plugins.treesitter',
  require 'plugins.autopairs',
  require 'plugins.lint',
  require 'plugins.marks',
  require 'plugins.colorizer',
  require 'plugins.illuminate',
  require 'plugins.trouble',
  require 'plugins.snacks',
  require 'plugins.lualine',
  require 'plugins.bufferline',
  require 'plugins.terminal',
  require 'plugins.grug',
  require 'plugins.bufdelete',
  require 'plugins.fold',
  require 'plugins.tree',
  require 'plugins.flash',
  require 'plugins.todo-comment',
  require 'plugins.persistence',
  require 'plugins.copilot',

  -- TODO finish setup
  require 'plugins.debug',
}, {
  ui = {
    icons = {},
  },
})
