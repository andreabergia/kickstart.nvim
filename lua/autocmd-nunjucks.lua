vim.filetype.add {
  extension = {
    njk = 'htmldjango',
  },
}

vim.treesitter.language.register('html', 'htmldjango')
