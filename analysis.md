# Neovim config review

Plan to work through these items step by step.

## Bugs to fix first

- [x] **`lua/plugins/lsp.lua:113`** — `[q` is mapped to `goto_next` (typo; should be `goto_prev`).
- [x] **`<C-k>` collision** — `lua/keymap.lua:21` maps `<C-k>` to "move to upper window", but `lua/plugins/lsp.lua:123-124` re-maps `<C-k>` (normal mode) to `signature_help` buffer-locally. In any LSP buffer you lose window-up navigation. Resolved by remapping normal-mode signature help to `gK`.
- [x] **`updatetime = 100` inside `LspAttach`** (`lsp.lua:128`) — runs every attach. Move to `options.lua`.
- [x] **DiagnosticFloat / CursorHold autocmd inside `LspAttach`** (`lsp.lua:131-137`) — same issue; it's `clear = true` so it's not leaking, but it's conceptually global, not per-buffer. Move it out.

## Modernize

- [x] **`nvim-cmp` → `blink.cmp`** — biggest one. nvim-cmp is in maintenance-only mode (upstream effectively done). blink.cmp is the modern de facto choice: faster, much simpler config, and would let you delete the entire 30-line `<CR>` workaround in `autocompletion.lua:45-71`. Pairs cleanly with LuaSnip if you add snippets.
- [x] **`mason-lspconfig` v2 API** — the `handlers = { function(server_name) ... end }` pattern in `lsp.lua:256-267` is the v1 way. v2 uses `automatic_enable` + Neovim 0.11's native `vim.lsp.config('serverName', {...})` / `vim.lsp.enable({...})`. Cleaner and unlocks the new built-in config system.
- [x] **`vim.diagnostic.goto_next/goto_prev` is deprecated** in 0.11 → use `vim.diagnostic.jump({ count = 1 })` / `count = -1`. (`lsp.lua:112-113`)
- [x] **`client.supports_method(...)` → `client:supports_method(...)`** (method-call form, 0.11+). (`lsp.lua:145, 172`)
- [x] **Replace `indent-blankline.nvim` with `snacks.indent`** — you already load snacks, this is one less plugin.
- [x] **`vim-illuminate` overlaps with built-in LSP document_highlight** that you already wire up in `lsp.lua:145-166`. Keep `vim-illuminate` for markdown and non-LSP fallback highlighting.
- [x] **Drop `FixCursorHold.nvim`** (transitive via neotest) — it was a workaround for an old Neovim bug long since fixed.
- [x] **Consider `snacks.picker`** as a telescope replacement since you already pull snacks. Keep Telescope for now; the migration cost is not worth it while the current Telescope + Trouble + project integrations are working.

## Add

- [x] **`mini.surround`** — skipped; not useful if you do not use surround-style editing.
- [ ] **A snippet engine** — zero snippets right now. LuaSnip + friendly-snippets makes LSP completions far more useful (function-call expansion, etc.).
- [ ] **`render-markdown.nvim`** — pretty in-buffer markdown rendering. Useful if you read docs / notes in nvim.
- [ ] **In-editor AI** — copilot is commented out in `init.lua:53`. If you want one, `codecompanion.nvim` gives you a Claude/Anthropic chat panel that complements Claude Code (CLI) rather than duplicating it.
- [ ] **`git-conflict.nvim`** — visual markers + per-hunk accept/reject for merge conflicts. Pairs well with the rest of your git stack.

## Remove

- [ ] **`lua/plugins/copilot.lua`** — disabled in `init.lua:53`, just delete the file if you don't plan to re-enable.
- [ ] **`luvit-meta`** — modern `lazydev.nvim` ships `vim.uv` types itself; the meta library is no longer needed.
- [ ] **`project.nvim`** — if you actually use `<leader>sp`, keep it. Otherwise drop; `persistence.nvim` + snacks dashboard's `recent_files` + `projects` section cover most of the same need.
- [ ] **`autocmd-restore-position.lua` and `autocmd-highlight-post-copy.lua`** — Neovim's default config already does highlight-on-yank (`vim.hl.on_yank` in the built-in `nvim-defaults` autocmd group on 0.11+). The restore-cursor-position one isn't a default, so that one stays. Worth checking the highlight one before deleting.
