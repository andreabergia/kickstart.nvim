-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
        autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged },
      },
      preselect = cmp.PreselectMode.None,

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local function is_signature(entry)
              return entry and entry.source and entry.source.name == 'nvim_lsp_signature_help'
            end

            local entry = cmp.get_selected_entry() or cmp.get_active_entry()
            if not entry then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
              entry = cmp.get_selected_entry()
            end

            local tries = 0
            local max_tries = #cmp.get_entries()
            while entry and is_signature(entry) and tries < max_tries do
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
              entry = cmp.get_selected_entry()
              tries = tries + 1
            end

            if entry and not is_signature(entry) then
              cmp.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false }
              return
            end
          end
          fallback()
        end),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},
      },
      sources = cmp.config.sources({
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
      }, {
        { name = 'path' },
      }, {
        { name = 'buffer' },
      }),
    }
  end,
}
