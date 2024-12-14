return {
    {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
    },
    {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = true,
	opts = {}
    },
    {
	"Shatur/neovim-ayu",
	config = function()
	    local ayu = require("ayu")
	    ayu.setup({
		-- mirage = true
	    })
	end
    }
}
