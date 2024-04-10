-- PC SETTINGS --
vim.keymap.set('n', '<leader>cdc', ':Telescope file_browser path=c:/ hidden=true<CR>')
vim.keymap.set('n', '<leader>cdd', ':Telescope file_browser path=d:/ hidden=true<CR>')
vim.keymap.set('n', '<leader>cdg', ':Ex d:/git<CR>')
vim.keymap.set('n', '<leader>cdcfg', ':tabe ~/appData/local/nvim/init.lua<CR>')

local toggleTermSetup = require("custom.plugins.toggleterm_setup")

return {
  editCfg = 'edit ~/appData/local/nvim/init.lua',
  editKevin = 'edit ~/appData/Local/nvim/lua/custom/kevin.lua',
  editPlugins = 'edit ~/AppData/Local/nvim/lua/custom/plugins/pc.lua',
  toggleterm_setup = toggleTermSetup.pc,
}
