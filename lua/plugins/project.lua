return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      exclude_dirs = {
        -- Absolute path of directories to exclude
      },
    }
  end,
}
