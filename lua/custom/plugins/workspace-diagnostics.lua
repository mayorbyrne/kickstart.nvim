return {
  "artemave/workspace-diagnostics.nvim",
  config = function()
    vim.api.nvim_set_keymap("n", "<space>ox", "", {
      noremap = true,
      callback = function()
        vim.lsp.buf.workspace_diagnostics()
      end,
    })
  end,
}
