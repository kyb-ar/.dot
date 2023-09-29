local call = vim.call
local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.o
local opt = vim.opt

require('packer_custom')
require('linters')
require('remap')
require('lsp_custom')

o.tabstop = 2
o.softtabstop = 0
o.expandtab = true
o.shiftwidth = 2
o.smarttab = true

opt.colorcolumn = "100"
opt.completeopt = {'menu', 'menuone', 'noselect'}

require('telescope').setup {
    defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}},
    extensions = {
        file_browser = {
            theme = 'ivy',
            hijack_netrw = true,
            mappings = {['i'] = {}, ['n'] = {}}
        }
    }
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')

-- CMDs

cmd [[colorscheme jellybeans]]
cmd [[
  function! CycleNumbering()
    if exists('+relativenumber')
      execute {
        \ '00': 'set relativenumber  | set number',
        \ '01': 'set norelativenumber  | set number',
        \ '10': 'set norelativenumber  | set nonumber',
        \ '11': 'set norelativenumber  | set number', }[&number . &relativenumber]
    else
      set number!<CR>
    endif
  endfunction
  nmap <leader>n :call CycleNumbering()<CR>
]]

