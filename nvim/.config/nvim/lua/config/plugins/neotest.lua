return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-plenary",
    "folke/lazydev.nvim",
    {
      'mrcjkb/rustaceanvim',
      version = '^5',
      lazy = false,
    },
    -- "nvim-neotest/neotest-jest",
    {
      "fredrikaverpil/neotest-golang",
      branch = "main",
      version = "*",
    },
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-golang')({
          runner = "go",
          colorize_test_output = true,
          go_test_args = { "-v", "-race", "-count=1" },
        }),

        require('rustaceanvim.neotest'),
      },
    })

    require "config.neotest.keymaps".setup() -- <leader>fg
  end
}
