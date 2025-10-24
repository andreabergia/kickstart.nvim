return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('n', '<leader>gg', function()
      neogit.open()
    end, { desc = 'Gui' })

    vim.keymap.set('n', '<leader>ga', function()
      local file = vim.api.nvim_buf_get_name(0)
      if file == '' then
        vim.notify('No file associated with this buffer', vim.log.levels.WARN)
        return
      end

      local relpath = vim.fn.fnamemodify(file, ':.')
      local result = vim.fn.system { 'git', 'add', relpath }

      if vim.v.shell_error ~= 0 then
        vim.notify('git add failed: ' .. vim.trim(result), vim.log.levels.ERROR)
        return
      end

      vim.notify('git add ' .. relpath, vim.log.levels.INFO)
    end, { desc = 'Add current file' })
  end,
}
