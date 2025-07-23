return {
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      print("HI WOR")
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
