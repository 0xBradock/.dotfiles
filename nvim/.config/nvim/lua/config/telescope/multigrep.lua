local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require "telescope.config".values

local M = {}

local live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            -- Using two spaces to separate the prompt
            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }
            -- First argument is the pattern to search
            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end

            -- Second (after 2 spaces) is the glob pattern
            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end

            ---@diagnostic disable-next-line: deprecated
            return vim.tbl_flatten {
                args,
                { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
            }
        end,

        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }

    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Live Grep",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
    }):find()
end

M.setup = function()
    vim.keymap.set("n", "<space>fg", live_multigrep, { desc = "Grep pattern __ glob" })
end


return M
