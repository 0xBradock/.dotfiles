return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- NOTE: Just a reminder
    -- PERF: Painfully slow
    -- TODO: Task to be done
    -- HACK: Weird code
    -- WARNING: It will explode
    -- FIXME: Requires attention
    -- BUG: Wrong behaviour
    opts = {
      signs = true,
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      }
    },
    -- config = function()
    --   vim.keymap.set("n", "]t", function()
    --     require("todo-comments").jump_next()
    --   end, { desc = "Next todo comment" })
    --
    --   vim.keymap.set("n", "[t", function()
    --     require("todo-comments").jump_prev()
    --   end, { desc = "Previous todo comment" })
    -- end
  },
}
