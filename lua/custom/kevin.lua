vim.g.netrw_sort_options = 'i'
vim.opt.termguicolors = true

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

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

vim.cmd([[
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.  global function so user mappings can call it.
" specifying 'raw' for the second argument prevents escaping the result for vimgrep
" TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
" search string, vim's search highlight will be wrong.  Refactor plz.
function! VisualStarSearchSet(cmdtype,...)
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @/ = substitute(@/, '\.', '\\.', 'g')
  let @" = temp
endfunction

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection
if maparg('<leader>*', 'n') == ''
  nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vnoremap <leader>* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

autocmd BufWritePre *.pl %s/\s\+$//e
autocmd FileType dart,js,ts,html,css,md autocmd BufWritePre <buffer> %s/\s\+$//e

]]);

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

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Trouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble Workspace" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble Document" })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble Quickfix" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble Loclist" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble LSP References" })

local editCfg = require("custom.mac")

return {
    editCfg = editCfg
}
