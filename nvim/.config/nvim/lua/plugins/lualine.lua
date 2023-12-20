return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local ll = require('lualine')
    ll.setup({
      options = {
        theme = 'gruvbox'
      }
    })
  end
}
