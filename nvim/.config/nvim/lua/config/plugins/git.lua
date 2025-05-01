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
      vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "hunk stage toggle" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "hunk reset" })
      vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "hunk reset buffer" })
      vim.keymap.set("n", "<leader>hi", gs.preview_hunk_inline, { desc = "hunk information" })
      vim.keymap.set("n", "<leader>hqa", function() gs.setqflist('all') end, { desc = "hunk quickfix all" })
      vim.keymap.set("n", "<leader>hqb", function() gs.setqflist('attached') end, { desc = "hunk quickfix buffer" })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-telescope/telescope.nvim", },
    keys = { { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
  }
  -- TODO: Try neogit
}
