return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy

  ft = { 'rust' },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>ca', function()
          vim.cmd.RustLsp 'codeAction'
        end, { desc = '[C]ode [A]ction', buffer = bufnr })
        vim.keymap.set('n', '<leader>dr', function()
          vim.cmd.RustLsp 'debuggables'
        end, { desc = '[D]ebuggables [R]ust', buffer = bufnr })

        vim.keymap.set(
          'n',
          'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
          function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end,
          { silent = true, buffer = bufnr }
        )
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust.
          checkOnSave = true,
          procMacro = {
            enable = true,
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable 'rust-analyzer' == 0 then
      LazyVim.error('**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/', { title = 'rustaceanvim' })
    end
  end,
}