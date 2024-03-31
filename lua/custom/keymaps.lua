vim.cmd([[
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gdd',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
]])

vim.keymap.set('n', 'd', '"_d', {})
vim.keymap.set('v', 'd', '"_d', {})
vim.keymap.set('n', 'c', '"_c', {})
vim.keymap.set('v', 'c', '"_c', {})
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- PC SETTINGS --
-- vim.keymap.set('n', '<leader>cdc', ':Telescope file_browser path=c:/ hidden=true<CR>')
-- vim.keymap.set('n', '<leader>cdd', ':Telescope file_browser path=d:/ hidden=true<CR>')
-- vim.keymap.set('n', '<leader>cdg', ':Ex d:/git<CR>')
-- vim.keymap.set('n', '<leader>cdcfg', ':tabe ~/appData/local/nvim/init.lua<CR>')

-- MAC SETTINGS --
vim.keymap.set('n', '<leader>cdd', ':Telescope file_browser path=~/Documents hidden=true<CR>')
vim.keymap.set('n', '<leader>cdg', ':Telescope file_browser path=~/Documents hidden=true<CR>')
vim.keymap.set('n', '<leader>cdcfg', ':tabe ~/.config/nvim/init.lua<CR>')

vim.keymap.set('n', '<leader>dd', ':Dashboard<CR>')
vim.keymap.set('n', '<leader>p', ':Prettier<CR>')
vim.keymap.set('n', '<leader>ee', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>')
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bp', ':bp<CR>')
vim.keymap.set('t', '<leader>bd', ':bd!<CR>')
vim.keymap.set('n', '<leader>bd', function()
    if vim.bo.buftype == 'terminal' then
        vim.cmd 'bd!'
    else
        vim.cmd 'bd'
    end
end)

vim.cmd('ca wq bd!');
vim.cmd('ca q bd!');

vim.keymap.set('n', '<leader>kb', ':TermExec cmd="webdev serve"<CR>')
