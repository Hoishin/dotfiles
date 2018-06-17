" ========================================
" General
" ========================================

" Split direction defaults
set splitbelow
set splitright

" Automatically read file changes
au CursorHold,CursorHoldI * checktime

" Automatically save on focus loss
au FocusLost * wa

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Ignore case of searches
set ignorecase

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Automatically read/write files
set autoread
set autowriteall

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*


" ========================================
" Keybinds
" ========================================


" ========================================
" Plugs
" ========================================

call plug#begin('~/.vim/plugged')

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Show git diffs on left
Plug 'airblade/vim-gitgutter'

" Easily find file (:Files etc.)
Plug 'junegunn/fzf', {
\	'dir': '~/.fzf',
\	'do': './install --all',
\}
Plug 'junegunn/fzf.vim'

" Syntax highlight theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Botton status line with colours
Plug 'itchyny/lightline.vim'

" Directory explorer (:NERDTree)
Plug 'scrooloose/nerdtree'

" Better grep
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Per-project configs
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'

" Asynchronously execute command/etc.
Plug 'tpope/vim-dispatch'

" Multiple language in one file
Plug 'Shougo/context_filetype.vim'

" Auto-complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Automatically lint codes without saving
Plug 'w0rp/ale'

" Rust
Plug 'rust-lang/rust.vim'

" Vue syntax highlighting
Plug 'posva/vim-vue'

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" PostgreSQL
Plug 'lifepillar/pgsql.vim'

" JSON
Plug 'elzr/vim-json'

call plug#end()

" ========================================
" Plugin config
" ========================================

" Dracula theme
syntax on
color dracula

" NERDTree
let NERDTreeShowHidden=1

" lightline
let g:lightline = {
\	'component_function': {
\		'filename': 'LightlineFilename',
\	},
\}
function! LightlineFilename()
	return &filetype ==# 'nerdtree' ? getcwd() : join(split(@%, '/')[-5:-1], '/')
endfunction

" deoplete
let g:deoplete#enable_at_startup = 1

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\	'javascript': ['eslint'],
\	'typescript': ['tsserver'],
\	'ruby': ['rubocop', 'ruby'],
\}

" Default SQL to PostgreSQL
let g:sql_type_default = 'pgsql'

" Let FZF to find hidden files
let $FZF_DEFAULT_COMMAND = 'fd --hidden --type f --exclude .git'

" ========================================
" Plugin Keybinds
" ========================================

" FZF
nmap <C-p> :Files<CR>
