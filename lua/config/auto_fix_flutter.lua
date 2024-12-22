-- Automatically fix all issues on save for dart files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.dart",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clientId = vim.lsp.client.id
    if vim.bo.ft == "dart" then
      vim.lsp.buf.code_action({
        context = {
          only = { "source.fixAll" },
          diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, nil, nil, clientId),
        },
        apply = true,
      })
    end
  end,
})
