return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').setup({
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
          "python",
          "markdown",
          "markdown_inline",
          "zig"
        },
      })
    end
  }
}
