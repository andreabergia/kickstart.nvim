-- Startup splash
return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = [[
  _   ___      _______ __  __ 
 | \ | \ \    / /_   _|  \/  |
 |  \| |\ \  / /  | | | \  / |
 | . ` | \ \/ /   | | | |\/| |
 | |\  |  \  /   _| |_| |  | |
 |_| \_|   \/   |_____|_|  |_|
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
