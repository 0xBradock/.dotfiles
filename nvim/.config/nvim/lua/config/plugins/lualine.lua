return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    section_separators = '',
                    component_separators = '',
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = false,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {
                        { 'mode', fmt = function(str) return str:sub(1, 1) end },
                    },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { {
                        'filename',
                        file_status = true,
                        path = 1,
                        shorting_target = 40,
                    } },
                    lualine_x = { {
                        'filetype',
                        colored = true,
                        icon_only = true,
                    } },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
