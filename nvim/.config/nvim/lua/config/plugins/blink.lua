return {
  'saghen/blink.cmp',
  dependencies = {
    { 'rafamadriz/friendly-snippets' },
    { 'L3MON4D3/LuaSnip',            version = 'v2.*' }
  },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    -- C-space: Open menu or open docs if already open
    -- Toggle documentation
    -- Show signature??
    keymap = {
      preset = 'default',
      -- Show completion
      -- ['<C-s>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- -- Snippet jump
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' }, -- 'mono' or 'normal'
    completion = {
      documentation = { auto_show = true, treesitter_highlighting = true, window = { border = 'single' } },
      menu = {
        border = 'single',

        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        },
      },
    },
    sources = { default = { 'lsp', 'snippets', 'path', 'buffer' } },
    fuzzy = { implementation = "rust", use_frecency = true }
  },
  opts_extend = { "sources.default" }
}
