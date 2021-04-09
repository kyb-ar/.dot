set nocompatible 
set nobackup
set noswapfile
syntax on
set nowrap
set clipboard=unnamed
set colorcolumn=100

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
call plug#begin()

"Core plugins
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'

"Helpfull
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'

"Snipets
Plug 'SirVer/ultisnips'

"Markdown
Plug 'gabrielelana/vim-markdown'

"Thrift
Plug 'solarnz/thrift.vim'

"Python
Plug 'tell-k/vim-autopep8'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end() 
set autoindent
set number
colorscheme jellybeans

"ignores
let g:ctrlp_custom_ignore = '\v[\/](node_modules/|target/|dist/|build/|bin/)|(\.(swp|ico|git|svn))$'
let g:ctrlp_working_path_mode = ''

"Nnoremap
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <c-f> :CtrlP<CR>
nnoremap <c-t> :<CR>

"Maps
map <space> <Plug>(easymotion-prefix)
command WQ wq
command Wq wq
command W w
command Q q

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-f>"
let g:UltiSnipsJumpForwardTrigger = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-d>"

" autopep stuff
let g:python_recommended_style = 0
let g:autopep8_indent_size=4
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=99
autocmd FileType python nnoremap <leader>f  :call Autopep8()<CR>
autocmd FileType scala nnoremap <leader>f :% !scalafmt --stdin<CR>
