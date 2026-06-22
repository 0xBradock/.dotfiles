return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      { 'rcarriga/nvim-dap-ui',        dependencies = { 'nvim-neotest/nvim-nio' } },
      { 'williamboman/mason.nvim' },
      { 'jay-babu/mason-nvim-dap.nvim' },
      { 'leoluz/nvim-dap-go' },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      require('mason-nvim-dap').setup({
        automatic_installation = true,
        ensure_installed = { 'delve' },
        handlers = {},
      })

      dapui.setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸', play = '▶', step_into = '⏎', step_over = '⏭',
            step_out = '⏮', step_back = 'b', run_last = '▶▶',
            terminate = '⏹', disconnect = '⏏',
          },
        },
      })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup({
        delve = { detached = vim.fn.has('win32') == 0 },
      })
    end,
    keys = {
      { '<leader>dc', function() require('dap').continue() end,                                                   desc = 'Debug: continue' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end,                                          desc = 'Debug: toggle breakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,       desc = 'Debug: conditional breakpoint' },
      { '<leader>di', function() require('dap').step_into() end,                                                  desc = 'Debug: step into' },
      { '<leader>do', function() require('dap').step_over() end,                                                  desc = 'Debug: step over' },
      { '<leader>dO', function() require('dap').step_out() end,                                                   desc = 'Debug: step out' },
      { '<leader>du', function() require('dapui').toggle() end,                                                   desc = 'Debug: toggle UI' },
      { '<leader>dt', function() require('dap').terminate() end,                                                  desc = 'Debug: terminate' },
    },
  },
}
