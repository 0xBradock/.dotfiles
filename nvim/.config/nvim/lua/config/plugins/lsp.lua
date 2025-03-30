return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason
      { 'williamboman/mason.nvim',                  config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'j-hui/fidget.nvim',                        opts = {} }, -- status updates for Lsp
      { 'hrsh7th/cmp-nvim-lsp' },

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
      -- NOTE: There's an autocomand `LspAttach` on `./lua/autocomands.lua`
      -- It formats on save

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local lsp = require('lspconfig')
      lsp.lua_ls.setup({
        capabilities = capabilities,
      })

      lsp.gopls.setup({
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

      lsp.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false
            }
          }
        }
      })

      lsp.eslint.setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lsp.phpactor.setup({ capabilities = capabilities })
      lsp.intelephense.setup({ capabilities = capabilities })
      lsp.zls.setup({ capabilities = capabilities })
      lsp.html.setup({ capabilities = capabilities })
      lsp.docker_compose_language_service.setup({ capabilities = capabilities })
      lsp.dockerls.setup({ capabilities = capabilities })
      lsp.cssls.setup({ capabilities = capabilities })
      lsp.tailwindcss.setup({ capabilities = capabilities })
      lsp.marksman.setup({ capabilities = capabilities })
      lsp.ts_ls.setup({ capabilities = capabilities })
      lsp.yamlls.setup({ capabilities = capabilities })
      lsp.jsonls.setup({ capabilities = capabilities })
    end,
  }
}
