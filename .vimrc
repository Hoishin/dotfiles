" ========================================
" General
" ========================================

" Make Vim more useful
set nocompatible

" Split direction default
set splitbelow
set splitright

" Automatically read file changes
au CursorHold,CursorHoldI * checktime

" Automatically save on focus loss
au FocusLost * :wa

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" if exists("&undodir")
" 	set undodir=~/.vim/undo
" endif

" Don’t create backups when editing files in certain directories
" set backupskip=/tmp/*,/private/tmp/*

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
"set cursorline

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


" ========================================
" Keybinds
" ========================================

" When ESC is pressed, save and force input source to U.S.
nnoremap <esc> :wa<cr>:silent exec "!bash ~/bin/force-us-keyboard.sh"<cr>
inoremap <esc> <esc>:wa<cr>:silent exec "!bash ~/bin/force-us-keyboard.sh"<cr>

" Duplicate ESC removes highlight
nnoremap <esc><esc> :noh<cr>


" ========================================
" Plugs
" ========================================

call plug#begin('~/.vim/plugged')
" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Show git diffs on left
Plug 'airblade/vim-gitgutter'

" Easily find file (:Files)
Plug 'junegunn/fzf', {
\	'dir': '~/.fzf',
\	'do': './install --all',
\}
Plug 'junegunn/fzf.vim'

" Auto-save feature
Plug 'vim-scripts/vim-auto-save'

" Best syntax highlight theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Botton status line with colours
Plug 'itchyny/lightline.vim'

" Better directory explorer (:NERDTree)
Plug 'scrooloose/nerdtree'

" Better grep
Plug 'vim-scripts/grep.vim'

" Per-project configs
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'

" Asynchronously execute command/etc.
Plug 'tpope/vim-dispatch'

" Multiple language in one file
Plug 'Shougo/context_filetype.vim'

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Language Client
Plug 'autozimu/LanguageClient-neovim', {
\	'branch': 'next',
\	'do': 'bash install.sh',
\}

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

" Ruby auto-"end"
Plug 'tpope/vim-endwise'

" def~end as braces
Plug 'vim-scripts/ruby-matchit'

" Rails
Plug 'tpope/vim-rails'

" PostgreSQL
Plug 'lifepillar/pgsql.vim'

" JSON
Plug 'elzr/vim-json'

" JavaScript syntax highlighting
Plug 'pangloss/vim-javascript'
call plug#end()

" ========================================
" Plugin config
" ========================================

" NERDTree
let NERDTreeShowHidden=1

" deoplete
let g:deoplete#enable_at_startup = 1

" Language Client
set hidden
let g:LanguageClient_serverCommands = {
\	'vue': ['vls'],
\	'typescript': ['tsserver'],
\}

" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\	'javascript': ['eslint'],
\	'typescript': ['tsserver'],
\	'vue': ['prettier'],
\	'ruby': ['rubocop', 'ruby'],
\}

" Rust
let g:ale_linters_explicit = 1

" Default SQL to PostgreSQL
let g:sql_type_default = 'pgsql'

" Let FZF to find hidden files (not working)
let $FZF_DEFAULT_COMMAND = 'fd --hidden --type f --exclude .git'

" ========================================
" Plugin Keybinds
" ========================================

" Define <Leader> key
:let mapleader = 'K'

" FZF
:nnoremap <Leader>p :Files<CR>

" Grep
:nnoremap <Leader>g :Rgrep<CR>


" ========================================
" Must-be-at-the-ends
" ========================================
