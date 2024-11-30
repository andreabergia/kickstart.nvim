--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.editor',
  require 'plugins.mini',
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
  require 'plugins.neotest',
  require 'plugins.rustacean',
  require 'plugins.crates',
  require 'plugins.aerial',
  require 'plugins.whitespace-nvim',
  require 'plugins.debug',
}
