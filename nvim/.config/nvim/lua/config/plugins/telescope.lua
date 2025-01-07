return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
      }
    },
    config = function()
      -- Telescope defaults
      local tl = require('telescope')

      tl.setup {
        pickers = { find_files = {
          -- theme = "ivy"
        } },
        extensions = { fzf = {} },
      }

      tl.load_extension('fzf')

      -- Telescope keymaps
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<space>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<space>fd', builtin.diagnostics, { desc = 'List diagnostics' })
      vim.keymap.set('n', '<space><space>', builtin.buffers, { desc = 'List buffers' })
      vim.keymap.set('n', '<space>fb', builtin.buffers, { desc = 'List buffers' })
      vim.keymap.set('n', '<space>fh', builtin.help_tags, { desc = 'Search help' })
      vim.keymap.set('n', '<space>fk', builtin.keymaps, { desc = 'Search keymaps' })

      -- GoTos
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition' })
      vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'Goto Implementations' })
      vim.keymap.set('n', 'gT', builtin.lsp_type_definitions, { desc = 'Goto Type definitions' })
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Goto references' })
      vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { desc = 'List symbols' })
      vim.keymap.set('n', 'gS', builtin.lsp_dynamic_workspace_symbols, { desc = 'List Workspace symbols' })

      vim.keymap.set('n', '<space>en', function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath("config")
        })
        require('telescope.builtin').find_files(opts)
      end, { desc = 'Edit Neovim files' })

      vim.keymap.set("n", "<space>ep", function()
        require('telescope.builtin').find_files {
          ---@diagnostic disable-next-line: param-type-mismatch
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end, { desc = "Telescope search plugins" })

      require "config.telescope.multigrep".setup() -- <leader>fg
    end
  }
}
