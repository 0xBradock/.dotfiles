vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Set sensible defaults for the terminal',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
  desc = 'Center When Cursor Line Significantly Changed',
  group = vim.api.nvim_create_augroup('custom-center-cursor', { clear = true }),
  pattern = '*',
  callback = (function()
    local initialCursorPos = vim.fn.getcurpos()
    local prevLine = initialCursorPos[2]
    return function()
      local curr_cursor_pos = vim.fn.getcurpos()
      local currLine = curr_cursor_pos[2]
      if (math.abs(prevLine - currLine) > 10) then
        vim.cmd("norm! zz")
      end
      prevLine = currLine
    end
  end)()
})

-- Format on save for the current
local lsp_format_on_save_group = vim.api.nvim_create_augroup('custom-lsp-format-on-save', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].filetype == 'go' then
      return
    end

    local client_id = args.data and args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if not client then return end

    if client:supports_method('textDocument/formatting') then
      -- Format the current buffer on save
      vim.api.nvim_clear_autocmds({ group = lsp_format_on_save_group, buffer = args.buf })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = lsp_format_on_save_group,
        buffer = args.buf,
        callback = function()
          local ok, err = pcall(vim.lsp.buf.format, { bufnr = args.buf, id = client.id })
          if not ok then
            vim.notify('Format failed: ' .. err, vim.log.levels.WARN)
          end
        end,
      })
    end
  end,
})

-- From https://github.com/golang/tools/blob/master/gopls/doc/vim.md
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('custom-go-organize-imports', { clear = true }),
  pattern = '*.go',
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0, name = 'gopls' })
    if #clients == 0 then
      return
    end

    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }

    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})
