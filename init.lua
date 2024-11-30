vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'autocmd-highlight-post-copy'
require 'autocmd-restore-position'
require 'plugins-bootstrap'
require('keymap').init()
