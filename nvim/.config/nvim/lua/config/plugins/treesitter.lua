return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "c",
          "php",
          "go",
          "rust",
          "typescript",
          "javascript",
          "lua",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "zig"
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
}
