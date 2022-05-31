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

"Code Analysis
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Markdown
Plug 'gabrielelana/vim-markdown'

"Thrift
Plug 'solarnz/thrift.vim'

"Bazel stuff
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

"Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'psf/black', { 'branch': 'stable' }

" Rst Plugin
Plug 'Rykka/riv.vim'

" Puppet Plugin
Plug 'rodjek/vim-puppet'

" New Stuff
Plug 'uarun/vim-protobuf'
Plug 'yoheimuta/vim-protolint'
Plug 'jjo/vim-cue'
Plug 'fatih/vim-go'

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
map <leader>f <Plug>(ale_fix)
command WQ wq
command Wq wq
command W w
command Q q

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-f>"
let g:UltiSnipsJumpForwardTrigger = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-d>"
let g:ultisnips_python_style = 'google'

let g:ale_linter_aliases = {'python': ['python', 'aurora']}
let g:ale_linters = {
\   'python': ['black'],
\   'proto': ['protoc-gen-lint', 'protolint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\   'proto': ['protolint'],
\}

let g:deoplete#enable_at_startup = 1
