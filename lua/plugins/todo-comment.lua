return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  -- stylua: ignore
  keys = {
    { "]o", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[o", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  },
}
