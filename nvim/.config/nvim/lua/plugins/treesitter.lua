return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup ({
      ensure_installed = { "c", "lua", "go", "rust", "javascript", "typescript" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

