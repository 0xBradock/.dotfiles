return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add       = { text = '+' },
        change    = { text = '~' },
        delete    = { text = '_' },
        topdelete = { text = '‾' },
        untracked = { text = '┆' },
      },
    },
    config = function()
      local gs = require('gitsigns')
      vim.keymap.set("n", "<leader>hs", gs.stage_hunk,                                    { desc = "hunk stage toggle" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk,                                    { desc = "hunk reset" })
      vim.keymap.set("n", "<leader>hR", gs.reset_buffer,                                  { desc = "hunk reset buffer" })
      vim.keymap.set("n", "<leader>hi", gs.preview_hunk_inline,                           { desc = "hunk information" })
      vim.keymap.set("n", "<leader>hqa", function() gs.setqflist('all') end,              { desc = "hunk quickfix all" })
      vim.keymap.set("n", "<leader>hqb", function() gs.setqflist('attached') end,         { desc = "hunk quickfix buffer" })
    end
  },
}
