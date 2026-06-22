return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    opts = {
      formatters_by_ft = {
        markdown = { 'prettier' },
      },
      -- Go is excluded: it has its own BufWritePre in autocommands.lua (goimports + gopls format)
      format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == 'go' then
          return nil
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    },
  },
}
