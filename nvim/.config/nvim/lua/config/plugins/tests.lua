-- All libraries and configurations pertaining test for all programming languages
return {
  {
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
      "nvim-neotest/neotest-jest",
      {
        "fredrikaverpil/neotest-golang",
        branch = "main",
        version = "*",
        dependencies = {
          "andythigpen/nvim-coverage",
        }
      },
      {
        "nvim-neotest/neotest-python",
      }
    },
    config = function()
      local go_opts = {
        runner = "go",
        colorize_test_output = true,
        go_test_args = {
          "-v",
          "-race",
          "-count=1",
          "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        },
      }

      require('neotest').setup({
        adapters = {
          require('neotest-golang')(go_opts),
          require("neotest-python"),
        },
      })

      require "config.neotest.keymaps".setup() -- required to retrive keymaps
    end,
    -- local showkcov = function ()
    --   require('coverage').show()
    -- end,
    keys = {
      { "<leader>tw", function() require("neotest").watch.watch() end,                                    desc = "[t]est [w]atch" },
      { "<leader>ta", function() require("neotest").run.attach() end,                                     desc = "[t]est [a]ttach" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "[t]est run [f]ile" },
      { "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "[t]est [A]ll files" },
      { "<leader>tS", function() require("neotest").run.run({ suite = true }) end,                        desc = "[t]est [S]uite" },
      { "<leader>tn", function() require("neotest").run.run() end,                                        desc = "[t]est [n]earest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "[t]est [s]ummary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "[t]est [o]utput" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "[t]est [O]utput panel" },
      { "<leader>tt", function() require("neotest").run.stop() end,                                       desc = "[t]est [t]erminate" },
    },
  },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
        load_coverage_cb = function(ftype)
          vim.notify("Loaded " .. ftype .. " coverage")
        end,
      })
    end,
    keys = {
      {
        "<leader>tc",
        function()
          require('coverage').load(true)
          require("coverage").toggle()
        end,
        desc = "[t]est [c]overage"
      },

    }
  }
}
