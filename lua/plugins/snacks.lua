-- Startup splash
return {
  -- Launch screen
  'folke/snacks.nvim',
  opts = {
    indent = {
      enabled = true,
    },
    dashboard = {
      sections = {
        { section = 'header' },
        {
          icon = ' ',
          title = 'Keymaps',
          section = 'keys',
          padding = 1,
        },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1, pane = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1, pane = 1 },
        { section = 'startup' },
      },
    },
  },
  config = function(_, opts)
    local function trim_dashboard_padding_highlights()
      local ns = vim.api.nvim_get_namespaces().snacks_dashboard
      if not ns then
        return
      end

      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == 'snacks_dashboard' then
          local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          local extmarks = vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, { details = true })

          for _, extmark in ipairs(extmarks) do
            local id, row, col, details = extmark[1], extmark[2], extmark[3], extmark[4]
            local line = lines[row + 1]
            local end_col = details.end_col

            if line and end_col and end_col > col then
              local text = line:sub(col + 1, end_col)
              local trimmed = text:gsub('[ \t]+$', '')
              local new_end_col = col + #trimmed

              if new_end_col < end_col then
                if new_end_col <= col then
                  vim.api.nvim_buf_del_extmark(buf, ns, id)
                else
                  vim.api.nvim_buf_set_extmark(buf, ns, row, col, {
                    id = id,
                    end_col = new_end_col,
                    hl_group = details.hl_group,
                    priority = details.priority,
                  })
                end
              end
            end
          end
        end
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('snacks_dashboard_options', { clear = true }),
      pattern = 'snacks_dashboard',
      callback = function()
        vim.opt_local.list = false
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      group = vim.api.nvim_create_augroup('snacks_dashboard_trim_padding', { clear = true }),
      pattern = { 'SnacksDashboardOpened', 'SnacksDashboardUpdatePost' },
      callback = function()
        vim.schedule(trim_dashboard_padding_highlights)
      end,
    })

    require('snacks').setup(opts)
  end,
}
