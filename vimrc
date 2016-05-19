set nocompatible
set visualbell
set noerrorbells

" Display
" =======
" color kib_darktango
set background=dark " Who uses a light background?
set colorcolumn=101 " let's keep things reasonable here
"colorscheme base16-tomorrow
set t_Co=256 " More colors
colorscheme base16-atelierforest
"colorscheme base16-tomorrow
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

set laststatus=2 " Always display status
set noshowmode " Using vim-airline
set nowrap

set spell " Sometimes it helps to have help

" Combining rnu and nu in 7.4+ has relative for all but current line
set number " line numbers
set relativenumber

set scrolloff=5 " Show a few lines below where you're scrolling

" Functionality
" =============
let mapleader = " "

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

set nobackup " Who needs backups?

" searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader>, :noh<cr>
" ^ Clear search history

set hidden " Buffers are hidden instead of closed when opening a new file

set ttyfast " Fast tty = smooth sailing
set smartindent
set mouse=a " allow using mouse
set backspace=indent,eol,start " backspace over line ends, etc
set encoding=utf-8
set pastetoggle=<F2> " Toggle autoindent, for pasting
set directory=/tmp " Keep temp files out
set autoread

filetype off
" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Better status bar
Plugin 'bling/vim-airline'
" Show my buffers in the status bar
Plugin 'bling/vim-bufferline'
" Buffer sidebar with Leader+b
Plugin 'jeetsukumaran/vim-buffergator'
" Filesystem tree
Plugin 'scrooloose/nerdtree'
" So we can actually tell what parentheses match up with eachother
Plugin 'kien/rainbow_parentheses.vim'
" Git diff information in the gutter
Plugin 'airblade/vim-gitgutter'
" Auto delimiter closing
Plugin 'Raimondi/delimitMate'
" Cool syntax highlighting
Plugin 'scrooloose/syntastic'
" Alternate related files easily (.c <-> .h)
Plugin 'bmchrist/a.vim'
"" Just like sublime
Plugin 'kien/ctrlp.vim'
" Comment shortcut
Plugin 'scrooloose/nerdcommenter'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
" Controls for altering surrounding braces/parens/etc
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
" Run rspec easily from vim
Plugin 'thoughtbot/vim-rspec'
" And send those specs to tmux
Plugin 'jgdavey/tslime.vim'

call vundle#end()

syntax enable
filetype plugin indent on " Load plugin and indent for recognized filetypes

let g:signify_vcs_list = ['git'] " Maybe this was for the git gutter

nmap <Leader>n :NERDTreeToggle<CR>

" Now we can use ;w. Saving keystrokes, one keystroke at a time
nnoremap ; :

" More easily move between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"autocmd BufWritePre * :%s/\s\+$//e
"autocmd BufWritePre * :%s/\n\{3,}/\r\r/e

" Brief crosshairs on the cursor
function! CursorPing()
  set cursorline cursorcolumn
  redraw
  sleep 150m
  set nocursorline nocursorcolumn
endfunction
nmap <Leader><Leader> :call CursorPing()<CR>

function! GetCurrentBranch()
    return substitute(system("git rev-parse --abbrev-ref HEAD"), '\n', '', '')
endfunction
" Delete training whitespace
nnoremap <leader>d :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


let g:NERDCustomDelimiters = {
      \ 'ruby': { 'left': '# ', 'leftAlt': '#'}
\ }

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:airline#extensions#tagbar#enabled = 1
