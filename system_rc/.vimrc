" 基本設定               {{{1 ================================================

  set nocompatible
  let &termencoding = &encoding
  set encoding=utf-8
  set fileencodings=usc-bom,taiwan,chinese,utf-8,utf-16le,default,latin1
  filetype plugin indent on

" }}}2    檔案格式    {{{2

  set fileformats=unix
  set noendofline

" }}}2    term 相關調整     {{{2

  if &term =~ "xterm"
    set t_#4=[D   " C-Left   (pietty)
    set t_%i=[C   " C-Right  (pietty)
    set t_Co=256
  endif

" }}}2    排版、縮排    {{{2

  "set expandtab tabstop=4 softtabstop=4 shiftwidth=4 autoindent smartindent smarttab
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2 autoindent smartindent smarttab
  if &foldmethod == 'manual'
    set foldmethod=marker
  endif

" }}}2    編輯功能    {{{2

  set mouse=nvi
  set virtualedit=block
  set clipboard=unnamed,autoselect,exclude:cons\|linux
  set tildeop
  set backspace=indent,eol,start
  set whichwrap=b,s,<,>,[,]
  set nojoinspaces
  set nostartofline

  set scrolloff=10
  set sidescrolloff=40
  set sidescroll=1
  set scrollopt=ver,hor,jump

  set timeoutlen=4000

" }}}2    顯示、外觀    {{{2

  set cursorline
  set number
  set hlsearch
  set ruler
  set showcmd
  set shortmess+=I
  set linebreak
  set listchars=tab:>-,eol:$,trail:*
  set bg=dark
  set ambiwidth=double
  syntax on

" }}}2    尋找、搜尋    {{{2

  set ignorecase
  set smartcase
  set incsearch
  set matchpairs+=<:>

" }}}2    自動完成    {{{2

  set omnifunc=syntaxcomplete#Complete
  set pumheight=20
  set menuitems=35
  set completeopt=longest,menu
  set complete+=U

  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git

" }}}2   多檔案編輯    {{{2

  set splitbelow
  set splitright
  set noequalalways
  set previewheight=9
  set tabpagemax=80
  set diffopt+=vertical,context:4,foldcolumn:1

" }}}2   Vim 7.3    {{{2

  if version >= 703
    set conceallevel=1
    set concealcursor=nc
    set colorcolumn=+1
    set cinoptions+=L0
    set undofile
    set undodir=~/.vim/undofiles
    if !isdirectory(&undodir)
      call mkdir(&undodir, "p")
    endif
    map  <C-ScrollWheelDown> <ScrollWheelRight>
    map  <C-ScrollWheelUp>   <ScrollWheelLeft>
    imap <C-ScrollWheelDown> <ScrollWheelRight>
    imap <C-ScrollWheelUp>   <ScrollWheelLeft>
  endif

" }}}2

" }}}1   基本設定              ===============================================

" MAPPINGS             {{{1 ==================================================

  map  <kHome> <Home>
  map! <kHome> <Home>
  map  <kEnd>  <End>
  map! <kEnd>  <End>
  map  <kDel>  <Del>

" }}}1   MAPPINGS              ==============================================

" Filetype 個別設定             {{{1 =========================================

" }}}2   HTML   {{{2

  fun! s:html_rc()
"     let g:event_handler_attributes_complete = 0
"     let g:rdfa_attributes_complete = 0
"     let g:microdata_attributes_complete = 0
"     let g:atia_attributes_complete = 0
  endf

" }}}2   Ruby   {{{2

  fun! s:ruby_rc()
    setlocal cindent
    " see |ft-ruby-omni|
    "let g:rubycomplete_buffer_loading = 1
    "let g:rubycomplete_classes_in_global = 1
    "let g:rubycomplete_rails = 1
    let ruby_operators = 1
    let ruby_space_errors = 1
    let ruby_no_expensive = 1
  endf

" }}}2   PHP   {{{2

  fun! s:php_rc()
    let php_asp_tags = 1
    let php_parent_error_close = 1
    let php_parent_error_open = 1
    setlocal isk-=58 cindent
    set makeprg=php\ -l\ %
    set errorformat=%m\ in\ %f\ on\ line\ %l
  endf

" }}}2

" }}}1    Filetype 個別設定      =============================================

" AUTOCMD             {{{1 ===================================================

  augroup my_vimrc
    au!

    au FileType ruby :call s:ruby_rc()
    au FileType html :call s:html_rc()
    au FileType php :call s:php_rc()

    au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=marker
    au FileType rake,ruby,eruby,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

    if has("autocmd") && exists("+omnifunc")
      autocmd Filetype *
      \ if &omnifunc == "" |
      \ setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
    endif
  augroup END

" }}}1    AUTOCMD             ================================================
