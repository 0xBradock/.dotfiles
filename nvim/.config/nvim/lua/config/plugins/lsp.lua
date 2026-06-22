return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'williamboman/mason.nvim',                  config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'j-hui/fidget.nvim',                        opts = {} },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = { 'prettier', 'markdownlint' },
      })

      local base_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities(base_capabilities)

      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.enable('lua_ls')

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })
      vim.lsp.enable('gopls')

      vim.lsp.config('ruff', {
        capabilities = capabilities,
        init_options = { settings = { args = {} } },
      })
      vim.lsp.enable('ruff')

      vim.lsp.config('docker_compose_language_service', { capabilities = capabilities })
      vim.lsp.enable('docker_compose_language_service')

      vim.lsp.config('dockerls', { capabilities = capabilities })
      vim.lsp.enable('dockerls')

      vim.lsp.config('marksman', { capabilities = capabilities })
      vim.lsp.enable('marksman')

      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.enable('ts_ls')

      vim.lsp.config('yamlls', { capabilities = capabilities })
      vim.lsp.enable('yamlls')

      vim.lsp.config('jsonls', { capabilities = capabilities })
      vim.lsp.enable('jsonls')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('custom-lsp-keymaps', { clear = true }),
        callback = function(args)
          local buf = args.buf
          local ok, builtin = pcall(require, 'telescope.builtin')

          vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'rounded' })
          end, { buffer = buf, desc = 'Hover documentation' })

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = buf, desc = 'Goto declaration' })

          if ok then
            vim.keymap.set('n', 'gd', builtin.lsp_definitions,              { buffer = buf, desc = 'Goto definition' })
            vim.keymap.set('n', 'gI', builtin.lsp_implementations,          { buffer = buf, desc = 'Goto implementations' })
            vim.keymap.set('n', 'gT', builtin.lsp_type_definitions,         { buffer = buf, desc = 'Goto type definition' })
            vim.keymap.set('n', 'gr', builtin.lsp_references,               { buffer = buf, desc = 'Goto references' })
            vim.keymap.set('n', 'gs', builtin.lsp_document_symbols,         { buffer = buf, desc = 'List symbols' })
            vim.keymap.set('n', 'gS', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Workspace symbols' })
          end

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method('textDocument/signatureHelp') then
            vim.keymap.set('i', '<C-s>', function()
              vim.lsp.buf.signature_help({ border = 'rounded' })
            end, { buffer = buf, desc = 'Signature help' })
          end
        end,
      })
    end,
  }
}
