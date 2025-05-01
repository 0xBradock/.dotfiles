return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.nvim'
    },
    opts = {},
    keys = {},
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>e', group = 'Edit (nvim)' },
        { '<leader>f', group = 'Telescope' },
        { '<leader>h', group = 'hunks' },
        { '<leader>l', group = 'Lsp' },
        { '<leader>o', group = 'Oil' },
        { '<leader>g', group = 'Git' },
        { '<leader>b', group = 'Buffers' },
        { '<leader>t', group = 'Test' },
      })
    end
  }
}
