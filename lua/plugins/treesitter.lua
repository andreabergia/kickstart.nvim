-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {}

    -- Install parsers
    require('nvim-treesitter').install {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'go',
      'rust',
      'ron',
      'javascript',
      'python',
      'java',
      'json5',
      'toml',
      'tsx',
      'swift',
    }

    -- Enable treesitter highlighting for all filetypes with a parser
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        -- Skip filetypes that rely on vim regex highlighting
        if ev.match == 'ruby' then
          return
        end
        pcall(vim.treesitter.start, ev.buf)
      end,
    })

    -- Enable treesitter-based indentation (disable for ruby)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        if ev.match ~= 'ruby' then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
