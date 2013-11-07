set nocompatible

" Display
" =======
color kib_darktango
set colorcolumn=81 " all my CS profs have REALLY small screens

set laststatus=2 " Always display status
set noshowmode " Using vim-airline
set nowrap

" Combining rnu and nu in 7.4+ has relative for all but current line
set relativenumber 
set number " line numbers

set t_Co=256
set background=dark " Who uses a light background?
syntax on " Syntax highlighting

set scrolloff=5

" Functionality
" =============
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

set ttyfast " Fast tty = smooth sailing
set smartindent
set mouse=a " allow using mouse
set backspace=indent,eol,start " backspace over line ends, etc
set encoding=utf-8
set pastetoggle=<F2> " Toggle autoindent, for pasting
set directory=/tmp " Keep temp files out
set autoread

" Plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'airblade/vim-gitgutter'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/a.vim'
filetype plugin indent on " Load plugin and indent for recognized filetypes 

let g:signify_vcs_list = ['git']

" Brief crosshairs on the cursor
function! CursorPing()
  set cursorline cursorcolumn
  redraw
  sleep 150m
  set nocursorline nocursorcolumn
endfunction
nmap <Leader><Leader> :call CursorPing()<CR>

