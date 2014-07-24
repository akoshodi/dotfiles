" Akinwale Oshodi

set nocompatible   " Disable vi-compatibility
filetype off

" Now we can turn our filetype functionality back on
filetype plugin indent on


"{{{ LEADER SHORTCUTS
" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = " "
let g:mapleader = "\<space>"
let g:EasyMotion_leader_key = '<Leader>'	" Easy motion stuff
nmap <leader>w :w!<cr>						" Fast saves
" }}}


" COLORS {{{
syntax enable           " enable syntax processing
set t_Co=256
colorscheme xoria256
" }}}

set linespace=15

" PLUGINS {{{
" To get plugins from Vim Scripts, you can reference the plugin by name as it appears on the site
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'chrisgillis/vim-bootstrap3-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'jnwhiteh/vim-golang'
Plugin 'sudo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Buffergator'

" Plugin 'Lokatog/powerline'
" Plugin 'scrooloose/nerdcommenter'
" Plugin "MarcWeber/vim-addon-mw-utils"
" Plugin "tomtom/tlib_vim"
" Plugin "honza/vim-snippets"
" Plugin 'garbas/vim-snipmate'
" Plugin 'bonsaiben/bootstrap-snippets'
" Plugin 'klen/python-mode'
" }}}  


"set guifont=menlo\ for\ powerline:h16
"set guioptions-=T 				" Removes top toolbar
"set guioptions-=r 				" Removes right hand scroll bar
"set go-=L 						" Removes left hand scroll bar


set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           		" don't beep
set noerrorbells         		" don't beep
set autowrite  					"Save on buffer switch
set mouse=a
set wildmenu            		" visual autocomplete for command menu
set incsearch           		" search as characters are entered
set hlsearch            		" highlight matches

" LINE SHORCUTS {{{
" Down is really the next line
nnoremap j gj
nnoremap k gk


imap jj <esc>							"Easy escaping to normal model
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>		"Auto change directory to match current file ,cd

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr> 

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>
"Load the current buffer in Chrome
" nmap ,c :!open -a Google\ Chrome<cr>
" }}}

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>



" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" POWERLINE {{{
" Powerline (Fancy thingy at bottom stuff)
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }}}

" SEARCHING {{{
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
command! H let @/=""					" Remove search results
highlight Search cterm=underline

" }}}

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


autocmd BufWritePre *.php :%s/\s\+$//e 			" Auto-remove trailing spaces

nmap ,todo :e todo.txt<cr> 						" Edit todo list for project


"LARAVEL {{{
" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>
" }}}

" CtrlP Stuff {{{

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

"}}}



" Create/edit file in the current directory
nmap :ed :edit %:p:h/


" FOLDING {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}

" vim:foldmethod=marker:foldlevel=