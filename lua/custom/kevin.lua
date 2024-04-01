vim.g.netrw_sort_options = 'i'

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

-- [[ Basic Keymaps ]]
vim.keymap.set('n', 'd', '"_d', {})
vim.keymap.set('v', 'd', '"_d', {})
vim.keymap.set('n', 'c', '"_c', {})
vim.keymap.set('v', 'c', '"_c', {})
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

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

local editCfg = require("custom.pc")

return {
    editCfg = editCfg
}