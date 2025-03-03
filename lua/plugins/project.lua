return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      exclude_dirs = {
        -- ServiceNow projects
        '/Users/andrea.bergia/fluent',
      },
    }
  end,
}
