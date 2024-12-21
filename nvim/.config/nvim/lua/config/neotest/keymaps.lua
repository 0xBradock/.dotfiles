local nt = require('neotest')

local M = {}

local nearest = function(opts)
  opts = opts or {}

  nt.run.run()
end

local summary = function(opts)
  opts = opts or {}

  nt.summary.toggle()
end

local local_file = function(opts)
  opts = opts or {}

  nt.run.run(vim.fn.expand("%"))
end

local prev = function(opts)
  opts = opts or { status = "failed" }

  nt.jump.prev(opts)
end

local next = function(opts)
  opts = opts or { status = "failed" }

  nt.jump.next(opts)
end

M.setup = function()
  vim.keymap.set("n", "<space>tl", nearest, { desc = "Current file" })
  vim.keymap.set("n", "<space>tn", local_file, { desc = "Nearest test" })
  vim.keymap.set("n", "<space>ts", summary, { desc = "Summary" })
  vim.keymap.set("n", "]t", next, { desc = "Next failed test" })
  vim.keymap.set("n", "[t", prev, { desc = "Prev failed test" })
end

return M
