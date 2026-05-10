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

local next = function(opts)
  opts = opts or { status = "failed" }

  nt.jump.next(opts)
end

M.setup = function()
  -- Keymaps are now defined in lua/config/plugins/tests.lua
  -- This function is kept for backward compatibility
end

return M
