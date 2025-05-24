" === General Settings ===
set nocompatible              " Disable Vi compatibility
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection and plugins
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set tabstop=4                 " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Smart autoindenting when starting a new line
set clipboard=unnamedplus     " Use system clipboard
set hlsearch                  " Highlight search results
set incsearch                 " Show search matches as you type
set ignorecase smartcase      " Case-insensitive search unless uppercase letters are used
set mouse=a                   " Enable mouse support
set scrolloff=8               " Keep 8 lines visible above and below the cursor
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set so=8
set wildmenu
set cmdheight=1
set hid
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" === Leader Key ===
let mapleader="\<Space>"

" === Key Mappings ===
nnoremap <Leader>r :w<CR>:!g++ -std=c++17 -Wall -Wextra % -o %:r && ./%:r<CR>
nnoremap <Leader>i :w<CR>:!g++ -std=c++17 -Wall -Wextra % -o %:r && ./%:r < input.txt<CR>
nnoremap <Leader>c :!clear<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>e :e .<CR>
noremap  ;f :Files <CR>
noremap  ;g :Rg <CR>

" === Auto Commands ===
autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp

" === Plugin Manager: Vundle ===
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'       " Autocompletion
Plugin 'scrooloose/nerdtree'          " File explorer
Plugin 'tpope/vim-commentary'         " Easy commenting
Plugin 'tpope/vim-sensible' " Easy commenting
Plugin 'tpope/vim-surround' " Easy commenting
Plugin 'airblade/vim-gitgutter'       " Git diff in gutter
Plugin 'vim-airline/vim-airline'      " Status/tabline
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
call vundle#end()

" === Additional Settings ===
let g:airline_powerline_fonts = 1

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map L :bnext<cr>
map H :bprevious<cr>
map sv :sv<cr>
map ss :vsplit<cr>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

