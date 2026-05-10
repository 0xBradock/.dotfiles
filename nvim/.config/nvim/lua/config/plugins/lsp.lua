return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason
      { 'williamboman/mason.nvim',                  config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'j-hui/fidget.nvim',                        opts = {} }, -- status updates for Lsp
      -- { 'hrsh7th/cmp-nvim-lsp' },

      -- `vim` globals
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
      -- NOTE: There's an autocommand `LspAttach` on `./lua/autocommands.lua`
      -- It formats on save

      local base_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities(base_capabilities)

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('lua_ls')

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
      vim.lsp.enable('gopls')

      -- rust_analyzer is handled by rustaceanvim

      vim.lsp.config('ruff', {
        capabilities = capabilities,
        init_options = {
          settings = {
            args = {},
          },
        },
      })
      vim.lsp.enable('ruff')

      vim.lsp.config('zls', { capabilities = capabilities })
      vim.lsp.enable('zls')

      vim.lsp.config('html', { capabilities = capabilities })
      vim.lsp.enable('html')

      vim.lsp.config('docker_compose_language_service', { capabilities = capabilities })
      vim.lsp.enable('docker_compose_language_service')

      vim.lsp.config('dockerls', { capabilities = capabilities })
      vim.lsp.enable('dockerls')

      vim.lsp.config('cssls', { capabilities = capabilities })
      vim.lsp.enable('cssls')

      vim.lsp.config('tailwindcss', { capabilities = capabilities })
      vim.lsp.enable('tailwindcss')

      vim.lsp.config('marksman', { capabilities = capabilities })
      vim.lsp.enable('marksman')

      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.enable('ts_ls')

      vim.lsp.config('yamlls', { capabilities = capabilities })
      vim.lsp.enable('yamlls')

      vim.lsp.config('jsonls', { capabilities = capabilities })
      vim.lsp.enable('jsonls')
    end,
  }
}
