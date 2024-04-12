-- MAC SETTINGS --
vim.keymap.set('n', '<leader>cdd', ':Telescope file_browser path=~/Documents hidden=true<CR>')
vim.keymap.set('n', '<leader>cdg', ':Telescope file_browser path=~/Documents hidden=true<CR>')
vim.keymap.set('n', '<leader>cdcfg', ':tabe ~/.config/nvim/init.lua<CR>')

local toggleTermSetup = require("custom.plugins.toggleterm_setup")

return {
  editCfg = 'edit ~/.config/nvim/init.lua',
  editKevin = 'edit ~/.config/nvim/lua/custom/kevin.lua',
  editPlugins = 'edit ~/.config/nvim/lua/custom/plugins/mac.lua',
  toggleterm_setup = toggleTermSetup.mac,
}
