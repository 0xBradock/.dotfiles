return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup({
        enable_autosnippets = true,
        update_events = { "TextChanged", "TextChangedI" },
      })

      cmp.setup {
        window = {
          completion = cmp.config.window.bordered(),    -- boarder on completion window
          documentation = cmp.config.window.bordered(), -- border on documentation window
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,preview,menuone,noinsert' }, -- chosen, you will need to read `:help ins-completion`
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),                   -- Next
          ['<C-p>'] = cmp.mapping.select_prev_item(),                   -- Previous
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),                      -- Scroll the documentation window [b]ack / [f]orward
          ['<C-f>'] = cmp.mapping.scroll_docs(4),                       -- Scroll docs
          ['<C-y>'] = cmp.mapping.confirm { select = true },            -- Accept ([y]es) the completion.
          ['<C-k>'] = cmp.mapping.complete {},                          -- Manually trigger a completion from nvim-cmp.
          ['<C-q>'] = cmp.mapping.abort(),
          ['<C-l>'] = cmp.mapping(function()                            -- <C-l> move to next position
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
            -- if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function() -- <C-l> move to previous position
            if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
          end, { 'i', 's' }),
        },
        sources = {
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          { name = 'lazydev', group_index = 0 },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
      luasnip.snippets = {
        all = {
          luasnip.parser.parse_snippet({ trig = "ttrr" }, "$1 is ${2|hard,easy,challenging|}")
          -- luasnip.parser.parse_snippet("expand", "-- Expanded comment"),
        }
      }
    end,
  }
}
