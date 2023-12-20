return {
  { "williamboman/mason.nvim",
    config = function()
      local m = require("mason").setup()
    end
  }, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "tsserver", "rust_analyzer" }
      })
    end
  }, {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.gopls.setup {}
      lspconfig.pyright.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.tsserver.setup {}

      --       -- Global mappings.
      --       -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      --       vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      --       vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      --       vim.keymap.set('n', '<leader>lw', vim.diagnostic.open_float)
      --       vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist)
      -- 
      --       -- Use LspAttach autocommand to only map the following keys
      --       -- after the language server attaches to the current buffer
      --       vim.api.nvim_create_autocmd('LspAttach', {
      --         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      --         callback = function(ev)
      --           -- Enable completion triggered by <c-x><c-o>
      --           vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      -- 
      --           -- Buffer local mappings.
      --           -- See `:help vim.lsp.*` for documentation on any of the below functions
      --           local km = vim.keymap
      --           local vb = vim.lsp.buf
      --           local opts = { buffer = ev.buf }
      -- 
      --           opts.desc = "Go to declaration"
      --           km.set('n', 'gD', vb.declaration, opts)
      -- 
      --           opts.desc = "Go to definition"
      --           km.set('n', 'gd', "<cmd>Telescope lsp_definitions<CR>", opts)
      -- 
      --           opts.desc = "TS go to references"
      --           km.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", opts)
      -- 
      --           opts.desc = "Hover definition"
      --           km.set('n', 'gi', "<cmd>Telescope lsp_implementations<CR>", opts)
      -- 
      --           opts.desc = "Hover definition"
      --           km.set('n', 'K', vb.hover, opts)
      -- 
      --           opts.desc = "Rename variable"
      --           km.set('n', '<leader>rn', vb.rename, opts)
      -- 
      --           opts.desc = "Trigger code action"
      --           km.set({ 'n', 'v' }, '<leader>ca', vb.code_action, opts)
      --         end,
      --       })
    end
  }}
