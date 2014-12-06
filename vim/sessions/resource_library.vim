let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', "insert")
inoremap <silent> <Plug>delimitMateS-Tab =delimitMate#JumpAny()
inoremap <silent> <Plug>delimitMateSpace =delimitMate#ExpandSpace()
inoremap <silent> <Plug>delimitMateCR =delimitMate#ExpandReturn()
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
inoremap <silent> <Plug>delimitMate` =delimitMate#QuoteDelim("\`")
inoremap <silent> <Plug>delimitMate' =delimitMate#QuoteDelim("\'")
inoremap <silent> <Plug>delimitMate" =delimitMate#QuoteDelim("\"")
inoremap <silent> <Plug>delimitMate] =delimitMate#JumpOut("\]")
inoremap <silent> <Plug>delimitMate} =delimitMate#JumpOut("\}")
inoremap <silent> <Plug>delimitMate) =delimitMate#JumpOut("\)")
inoremap <silent> <Plug>delimitMate[ =delimitMate#ParenDelim("]")
inoremap <silent> <Plug>delimitMate{ =delimitMate#ParenDelim("}")
inoremap <silent> <Plug>delimitMate( =delimitMate#ParenDelim(")")
imap <Right> <Nop>
imap <Left> <Nop>
imap <Down> <Nop>
imap <Up> <Nop>
map! <D-v> *
nnoremap  h
nnoremap <NL> j
nnoremap  k
nnoremap  l
nnoremap <silent>  :CtrlP
nmap  ca <Plug>NERDCommenterAltDelims
xmap  cu <Plug>NERDCommenterUncomment
nmap  cu <Plug>NERDCommenterUncomment
xmap  cb <Plug>NERDCommenterAlignBoth
nmap  cb <Plug>NERDCommenterAlignBoth
xmap  cl <Plug>NERDCommenterAlignLeft
nmap  cl <Plug>NERDCommenterAlignLeft
nmap  cA <Plug>NERDCommenterAppend
xmap  cy <Plug>NERDCommenterYank
nmap  cy <Plug>NERDCommenterYank
xmap  cs <Plug>NERDCommenterSexy
nmap  cs <Plug>NERDCommenterSexy
xmap  ci <Plug>NERDCommenterInvert
nmap  ci <Plug>NERDCommenterInvert
nmap  c$ <Plug>NERDCommenterToEOL
xmap  cn <Plug>NERDCommenterNested
nmap  cn <Plug>NERDCommenterNested
xmap  cm <Plug>NERDCommenterMinimal
nmap  cm <Plug>NERDCommenterMinimal
xmap  c  <Plug>NERDCommenterToggle
nmap  c  <Plug>NERDCommenterToggle
xmap  cc <Plug>NERDCommenterComment
nmap  cc <Plug>NERDCommenterComment
nmap  ihn :IHN
nmap  is :IHS:A
nmap  ih :IHS
nmap <silent>  lj :LustyJuggler
nmap <silent>  lg :LustyBufferGrep
nmap <silent>  lb :LustyBufferExplorer
nmap <silent>  lr :LustyFilesystemExplorerFromHere
nmap <silent>  lf :LustyFilesystemExplorer
nnoremap <silent>  <S-Down> :BuffergatorMruCycleNext rightbelow sbuffer
nnoremap <silent>  <S-Right> :BuffergatorMruCycleNext rightbelow vert sbuffer
nnoremap <silent>  <S-Up> :BuffergatorMruCycleNext leftabove sbuffer
nnoremap <silent>  <S-Left> :BuffergatorMruCycleNext leftabove vert sbuffer
nnoremap <silent>  <Down> :BuffergatorMruCyclePrev rightbelow sbuffer
nnoremap <silent>  <Right> :BuffergatorMruCyclePrev rightbelow vert sbuffer
nnoremap <silent>  <Up> :BuffergatorMruCyclePrev leftabove sbuffer
nnoremap <silent>  <Left> :BuffergatorMruCyclePrev leftabove vert sbuffer
nnoremap <silent>  T :BuffergatorTabsClose
nnoremap <silent>  t :BuffergatorTabsOpen
nnoremap <silent>  B :BuffergatorClose
nnoremap <silent>  b :BuffergatorOpen
nnoremap  l :execute 'source ~/.vim/sessions/' . GetCurrentBranch() . '.vim'
nnoremap  s :execute 'mksession! ~/.vim/sessions/' . GetCurrentBranch() . '.vim'
nmap    :call CursorPing()
nmap  n :NERDTreeToggle
nnoremap  , :noh
nnoremap ; :
xmap S <Plug>VSurround
nmap [h <Plug>GitGutterPrevHunk
nnoremap <silent> [b :BuffergatorMruCyclePrev
nmap ]h <Plug>GitGutterNextHunk
nnoremap <silent> ]b :BuffergatorMruCycleNext
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
nnoremap <silent> <Plug>GitGutterPrevHunk :execute v:count1 . "GitGutterPrevHunk"
nnoremap <silent> <Plug>GitGutterNextHunk :execute v:count1 . "GitGutterNextHunk"
nmap <Right> <Nop>
nmap <Left> <Nop>
nmap <Down> <Nop>
nmap <Up> <Nop>
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
imap S <Plug>ISurround
imap s <Plug>Isurround
imap  <Plug>Isurround
nnoremap <silent> Â :BuffergatorMruCycleNext
nnoremap <silent> â :BuffergatorMruCyclePrev
let &cpo=s:cpo_save
unlet s:cpo_save
set autoread
set background=dark
set backspace=indent,eol,start
set directory=/tmp
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword=@,48-57,_,192-255,$
set laststatus=2
set mouse=a
set pastetoggle=<F2>
set runtimepath=~/.vim,~/.vim/bundle/vundle,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-bufferline,~/.vim/bundle/vim-buffergator,~/.vim/bundle/lusty,~/.vim/bundle/nerdtree,~/.vim/bundle/rainbow_parentheses.vim,~/.vim/bundle/vim-gitgutter,~/.vim/bundle/delimitMate,~/.vim/bundle/syntastic,~/.vim/bundle/a.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/nerdcommenter,~/.vim/bundle/vim-less,~/.vim/bundle/vim-coffee-script,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-endwise,~/.vim/bundle/vim-rails,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/vim-airline/after,~/.vim/bundle/vim-bufferline/after,~/.vim/bundle/vim-buffergator/after,~/.vim/bundle/lusty/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/rainbow_parentheses.vim/after,~/.vim/bundle/vim-gitgutter/after,~/.vim/bundle/delimitMate/after,~/.vim/bundle/syntastic/after,~/.vim/bundle/a.vim/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bund
set scrolloff=5
set shiftround
set shiftwidth=2
set showmatch
set noshowmode
set smartcase
set smartindent
set tabstop=2
set updatetime=1
set visualbell
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/handshake
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 spec/factories/articles.rb
argglobal
silent! argdel *
edit spec/factories/articles.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <BS> <Plug>delimitMateBS
inoremap <buffer> <Plug>delimitMateJumpMany =delimitMate#JumpMany()
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=81
setlocal colorcolumn=81
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=~/projects/handshake/lib,~/projects/handshake/vendor,~/projects/handshake/app/models/concerns,~/projects/handshake/app/controllers/concerns,~/projects/handshake/app/controllers,~/projects/handshake/app/helpers,~/projects/handshake/app/mailers,~/projects/handshake/app/models,~/projects/handshake/app/*,~/projects/handshake/app/views,~/projects/handshake/spec,~/projects/handshake/spec/controllers,~/projects/handshake/spec/helpers,~/projects/handshake/spec/mailers,~/projects/handshake/spec/models,~/projects/handshake/spec/views,~/projects/handshake/spec/lib,~/projects/handshake/spec/features,~/projects/handshake/spec/requests,~/projects/handshake/spec/integration,~/projects/handshake/vendor/plugins/*/lib,~/projects/handshake/vendor/plugins/*/test,~/projects/handshake/vendor/rails/*/lib,~/projects/handshake/vendor/rails/*/test,~/projects/handshake,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby/2.1.0,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby/2.1.0/x86_64-darwin13.0,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby,~/.rbenv/
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=~/projects/handshake/.git/ruby.tags,~/projects/handshake/.git/tags,~/projects/handshake/tags,~/projects/handshake/tmp/tags,./tags,tags,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby/2.1.0/tags,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby/2.1.0/x86_64-darwin13.0/tags,~/.rbenv/versions/2.1.1/lib/ruby/site_ruby/tags,~/.rbenv/versions/2.1.1/lib/ruby/vendor_ruby/2.1.0/tags,~/.rbenv/versions/2.1.1/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin13.0/tags,~/.rbenv/versions/2.1.1/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/2.1.1/lib/ruby/2.1.0/tags,~/.rbenv/versions/2.1.1/lib/ruby/2.1.0/x86_64-darwin13.0/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
