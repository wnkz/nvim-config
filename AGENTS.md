# AGENTS.md - Development Guidelines

This document provides guidelines for agentic coding agents (like yourself) working on this Neovim configuration repository.

## Project Overview

This is a Neovim configuration written in **Lua** (100% Lua codebase). It uses:
- **lazy.nvim** for plugin management
- **LSP** (Language Server Protocol) configuration
- Various editor enhancements and plugins

## Build/Lint/Test Commands

### Formatting & Linting

**Format Lua files with stylua:**
```bash
stylua .
```

**Check a specific file:**
```bash
stylua path/to/file.lua
```

**Dry-run (check only, don't modify):**
```bash
stylua --check .
```

### Configuration Validation

**Load configuration without errors:**
```bash
nvim -u /Users/wnkz/.config/nvim/init.lua --headless -c 'qa'
```

**Check Lua syntax:**
```bash
luac -p path/to/file.lua
```

### No automated tests currently exist

This is a configuration repository (not a library), so there are no unit tests. Changes should be manually verified in Neovim.

## Git Safety Guidelines

⚠️ **CRITICAL: Do NOT auto-commit, auto-push, or run any git commands that make changes without explicit user confirmation.**

### Allowed Read-Only Git Operations

Only these operations are safe to run without asking:
- `git status` – Check repository state
- `git diff` – View staged/unstaged changes
- `git log` – View commit history
- `git branch -a` – List branches
- `git remote -v` – View remote URLs

### NEVER Auto-Execute These Commands

- `git add` – Must ask user first
- `git commit` – Must ask user first
- `git push` – Must ask user first
- `git pull` – Must ask user first
- `git rebase` – Must ask user first
- `git reset` – Must ask user first
- `git force-push` – ABSOLUTELY NEVER without explicit request
- `git stash` – Must ask user first

### When Making Changes

1. Use tools like `bash`, `read`, and `write` to inspect and modify files
2. Show the user what changes you've made
3. Ask for explicit confirmation before committing
4. When user asks to commit:
   - Verify no destructive operations
   - Check for uncommitted changes that might be lost
   - Always verify branch is correct (never force push to main/master)
   - Create descriptive commit messages

### Pre-Commit Checklist

Before creating any commit, verify:
- ✓ Files to commit are intentional (no .env, secrets, etc.)
- ✓ Commit message is clear and describes the "why"
- ✓ No destructive git operations (hard reset, force push, etc.)
- ✓ User explicitly requested the commit
- ✓ Branch protection rules respected


## Code Style Guidelines

### Formatting

- **Indentation:** 2 spaces (not tabs)
- **Line width:** 160 characters max
- **Line endings:** Unix (LF)
- **String quotes:** Double quotes preferred (`"string"` not `'string'`)
- **Formatter:** stylua (configured in `.stylua.toml`)

### Imports & Module Organization

```lua
-- Group imports at the top of the file
local M = {}

-- Require core modules first
require("config.lazy")
require("config.settings")

-- Or import specific functions
local function = require("module.submodule")

return M
```

- Use `local` for all variables by default
- Organize requires logically (external dependencies, then internal modules)
- Export modules via `return M` pattern

### Naming Conventions

- **Functions:** `camelCase` or `snake_case` (Neovim plugins commonly use snake_case)
- **Variables:** `snake_case` for most variables
- **Constants:** `UPPER_SNAKE_CASE` (rarely used in config)
- **File paths:** `kebab-case` (e.g., `user-config.lua`) or `snake_case` (e.g., `user_config.lua`)
- **Lua module groups:** Descriptive names under `lua/config/` or `lua/plugins/`

### Type Annotations

Use Lua doc comments for clarity (compatible with Lua LS):

```lua
---@type vim.Option
local rtp = vim.opt.rtp

---@param client vim.lsp.Client
---@param method vim.lsp.protocol.Method
---@param bufnr? integer some lsp support methods only in specific files
---@return boolean
local function client_supports_method(client, method, bufnr)
  -- ...
end

---@module 'oil'
---@type oil.SetupOpts
opts = { ... }
```

### Configuration Tables & Pattern

Most plugin configurations follow this pattern:

```lua
{
  "plugin/name",
  event = "VeryLazy",  -- or "BufReadPre", "InsertEnter", etc.
  dependencies = { "other/plugin" },
  opts = {
    -- Default options passed to setup()
  },
  config = function()
    -- Custom configuration
  end,
  keys = {
    { "keybind", function() ... end, desc = "Description" },
  },
}
```

### Keymaps

- Use descriptive `desc` fields in all keymaps
- Group related keymaps with comments (e.g., `-- Navigation`)
- Follow Neovim conventions (`<leader>` prefix for custom maps)
- Use `stylua: ignore` comments when breaking stylua rules for readability

```lua
-- stylua: ignore
keys = {
  { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
}
```

### Comments & Documentation

```lua
-- Single-line comments for explanations
-- Use two spaces before inline comments

-- NOTE: Important concepts or non-obvious logic
-- WARN: Warnings about pitfalls or breaking changes
-- TODO: Items to be completed

-- Document complex functions with Lua doc
---@param bufnr integer
---@return string
```

### Error Handling

Use `pcall` for safe execution:

```lua
local ok, err = pcall(vim.cmd.cnext)
if not ok then
  vim.notify(err, vim.log.levels.ERROR)
end
```

Use `vim.notify` for user-facing messages:

```lua
vim.notify("Message text", vim.log.levels.INFO)
vim.notify("Error occurred", vim.log.levels.ERROR)
vim.notify("Warning", vim.log.levels.WARN)
```

### Lua LS Configuration

The project includes `.luarc.json` with:
- **Runtime:** LuaJIT (Neovim uses LuaJIT)
- **Globals:** `vim` (Neovim API)
- **Workspace library:** Neovim runtime and Lua libraries

## Directory Structure

```
.
├── lua/
│   ├── config/           # Configuration modules
│   │   ├── init.lua      # Default icons & constants
│   │   ├── lazy.lua      # lazy.nvim bootstrap & setup
│   │   ├── opts.lua      # Vim options (vim.o.*)
│   │   ├── mappings.lua  # Global keybindings
│   │   ├── settings.lua  # Additional settings
│   │   └── autocommands.lua  # Autocommands
│   └── plugins/          # Plugin specifications (lazy.nvim format)
│       ├── init.lua      # Main plugin list
│       ├── cmp.lua       # Completion plugin
│       ├── lsp.lua       # LSP configuration
│       ├── telescope.lua # Fuzzy finder
│       └── ...
├── lsp/                  # LSP server configurations
├── ftplugin/            # Filetype-specific plugins
├── ftdetect/            # Filetype detection
├── init.lua             # Entry point
└── lazy-lock.json       # Locked plugin versions
```

## Important Files

- **`.stylua.toml`** – Stylua formatting rules (160 column width, 2 spaces)
- **`.luarc.json`** – Lua LS configuration for type checking
- **`lazy-lock.json`** – Plugin version lock file (commit this)
- **`README.md`** – Project overview

## Common Tasks

### Adding a New Plugin

1. Create or edit file in `lua/plugins/`
2. Follow lazy.nvim spec format
3. Use `opts` for default config, `config` for custom setup
4. Add `event`, `cmd`, or `keys` to lazy-load appropriately
5. Run stylua and verify in Neovim

### Modifying LSP Configuration

- LSP settings are in `lua/plugins/lsp.lua`
- LSP server configs are in `lsp/` directory
- Changes take effect on next Neovim start or `:Lazy load` command

### Updating Keybindings

- Global maps: `lua/config/mappings.lua`
- Plugin-specific: within plugin specs in `lua/plugins/`
- Always include `desc` field for `:WhichKey` integration

## Quality Standards

- All Lua files must pass `stylua --check`
- Configuration should load without errors in Neovim
- Use type annotations (Lua doc comments) for clarity
- Prefer built-in Neovim APIs over custom implementations
- Comment non-obvious or complex logic
- Keep functions small and focused
- Use local scope by default

## Performance Considerations

- Use `lazy = true` for plugins not needed on startup
- Use appropriate event triggers (`BufReadPre`, `VeryLazy`, etc.)
- Avoid heavy computations in `init` functions
- Profile with `:Lazy profile` if needed

---

**Last Updated:** December 2024
