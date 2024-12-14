return {
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'echasnovski/mini.nvim'
        },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {},
        config = function()
            local wk = require('which-key')
            wk.add({
                { '<leader>e', group = 'Edit (nvim)' },
                { '<leader>f', group = 'Telescope' },
                { '<leader>g', group = 'GoTo' },
                { '<leader>l', group = 'Lsp' },
            })
        end
    }
}
