# AGENTS.md

This file contains guidelines and commands for agentic coding agents working in this Neovim configuration repository.

## Repository Overview

This is a modular Neovim configuration based on kickstart.nvim, using lazy.nvim for plugin management. The configuration is organized into logical modules under `lua/config/` with separate files for different plugin categories.

## Build/Lint/Test Commands

### Lua Formatting
```bash
# Format all Lua files using stylua
stylua .

# Format specific file
stylua path/to/file.lua

# Check formatting without making changes
stylua --check .
```

### Lua Linting
```bash
# Run luacheck for static analysis (if installed)
luacheck lua/

# Run selene for static analysis (if installed) 
selene lua/
```

### Neovim Configuration Testing
```bash
# Test Neovim configuration startup
nvim --headless -c "lua print('Config loaded successfully')" -c "q"

# Check for errors in configuration
nvim --headless -c "lua vim.diagnostic.setloclist()" -c "q"
```

### Plugin Management
```bash
# Install/update plugins
nvim --headless -c "Lazy sync" -c "q"

# Check plugin status
nvim --headless -c "Lazy status" -c "q"

# Clean unused plugins
nvim --headless -c "Lazy clean" -c "q"
```

### Language-Specific Testing
The configuration includes neotest for running tests in various languages:

#### Test Commands (using neotest keymaps)
- `<space>tn` - Run nearest test
- `<space>tf` - Run current file tests  
- `<space>ts` - Toggle test summary
- `<space>tl` - Run local file tests
- `<space>ta` - Attach to test runner
- `<space>tw` - Toggle test watch mode
- `<space>tc` - Toggle coverage display

#### Language-Specific Test Runners
```bash
# Go tests
go test ./...
go test -v -race -count=1 ./...

# Python tests (pytest)
pytest

# JavaScript/TypeScript tests (jest)
npm test
jest

# Rust tests
cargo test
```

## Code Style Guidelines

### Lua Code Style

#### Formatting
- Use **stylua** for formatting (configured in `.stylua.toml`)
- Column width: 160 characters
- Indentation: 2 spaces
- Quote style: Prefer single quotes, auto-detect
- No parentheses around single-argument function calls

#### Naming Conventions
- **Variables/functions**: `snake_case`
- **Modules**: `snake_case` (file names)
- **Constants**: `UPPER_SNAKE_CASE`
- **Private functions**: prefix with underscore (`_private_func`)
- **Local variables**: descriptive, short names for locals (`opts`, `buf`, `client`)

#### Imports and Requires
```lua
-- Standard library at top
local vim = vim

-- Plugin requires grouped by functionality
local telescope = require('telescope')

-- Local modules relative to config
local keymaps = require('config.keymaps')
local utils = require('config.utils')
```

#### Function Definitions
```lua
-- Good: descriptive name, type hints in comments
local function setup_lsp_client(opts)
  -- implementation
end

-- Good: module table with functions
local M = {}

function M.setup()
  -- implementation
end

return M
```

#### Error Handling
```lua
-- Use pcall for safe operations
local ok, result = pcall(function()
  return potentially_failing_operation()
end)

if not ok then
  vim.notify("Operation failed: " .. result, vim.log.levels.ERROR)
  return
end

-- Check for nil values
local client = vim.lsp.get_client_by_id(args.data.client_id)
if not client then 
  return 
end
```

#### Vim API Usage
```lua
-- Prefer vim.api functions over vim.cmd
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    -- implementation
  end,
})

-- Use vim.opt for options
vim.opt.number = true
vim.opt.relativenumber = true

-- Use vim.keymap.set for keymaps
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
```

### Plugin Configuration Style

#### Plugin Specs
```lua
return {
  'plugin-author/plugin-name',
  dependencies = {
    'dependency1',
    'dependency2',
  },
  event = 'VeryLazy',  -- or specific events
  keys = {
    { '<leader>key', function() end, desc = 'Description' },
  },
  opts = {
    -- plugin options
  },
  config = function()
    -- custom configuration
  end,
}
```

#### LSP Configuration
```lua
-- Use capabilities from completion engine
local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(base_capabilities)

-- Configure language servers
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})
vim.lsp.enable('lua_ls')
```

#### LSP Policy
- Use one primary LSP server per language to avoid duplicate diagnostics and formatters
- Python uses `ruff` and formats on save through LSP
- PHP servers are intentionally disabled in this repository
- Go uses a dedicated `BufWritePre` autocmd path for organize imports + formatting
- Non-Go languages use generic LSP format-on-save attached per buffer

### File Organization

#### Directory Structure
```
lua/
├── config/
│   ├── plugins/          # Plugin configurations
│   │   ├── lsp.lua
│   │   ├── telescope.lua
│   │   └── ...
│   ├── neotest/          # Test configurations
│   └── telescope/         # Custom telescope extensions
├── kickstart/            # Legacy kickstart plugins
├── autocommands.lua      # Autocommands
├── keymaps.lua          # Global keymaps
├── options.lua          # Vim options
└── lazy.lua             # Lazy.nvim setup
```

#### Module Pattern
```lua
-- lua/config/plugins/example.lua
return {
  'author/plugin',
  config = function()
    -- Configuration here
  end,
}
```

### Keymap Guidelines

#### Keymap Structure
```lua
vim.keymap.set('n', '<leader>key', function_or_command, {
  desc = 'Descriptive text for which-key',
  silent = true,  -- when appropriate
  noremap = true, -- default, explicit when needed
})
```

#### Leader Key Mappings
- Use `<leader>` for user commands
- Group related functionality: `<leader>l` for LSP, `<leader>t` for tests
- Use descriptive which-key labels

#### Mode-Specific Keymaps
```lua
-- Normal mode
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })

-- Insert mode  
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert' })

-- Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })

-- Terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal' })
```

## Development Workflow

1. **Before making changes**:
   - Run `stylua --check .` to ensure formatting
   - Test configuration with `nvim --headless`

2. **When adding plugins**:
   - Add to appropriate file in `lua/config/plugins/`
   - Include necessary dependencies
   - Add keymaps if applicable
   - Test plugin functionality

3. **When modifying core files**:
   - Test with `nvim --headless` for syntax errors
   - Verify autocommands work as expected
   - Check keymaps with `:verbose map <leader>key`

4. **After changes**:
   - Run `stylua .` to format
   - Test configuration startup
   - Commit changes with descriptive messages

## Language Server Configuration

This config includes LSP setup for multiple languages. When adding new language support:

1. Add language server to `lua/config/plugins/lsp.lua`
2. Ensure Mason can install the server
3. Configure with `vim.lsp.config('<server>', { ... })`
4. Enable with `vim.lsp.enable('<server>')`
5. Ensure server does not violate one-server-per-language policy
6. Add file type-specific autocommands only when language requires custom save behavior

## Testing Configuration

The configuration includes neotest for running tests. Test adapters are configured for:
- Lua (plenary)
- Go (neotest-golang) 
- Python (neotest-python)
- JavaScript/TypeScript (neotest-jest)
- Rust (via rustaceanvim)

Use the keymaps listed above to run tests during development.
