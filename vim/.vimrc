" inspired by https://github.com/bling/dotvim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set all& "reset everything to their defaults
set nocompatible "iMproved
set background=dark

let mapleader=","

let s:cache_dir = '~/.vim/.cache'
function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction "}}}

"{{{ plugins

    filetype off

    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))

    " a colorscheme
    NeoBundle 'w0ng/vim-hybrid'

    " better statusline
    NeoBundle 'vim-airline/vim-airline-themes'
    NeoBundle 'vim-airline/vim-airline' "{{{
      let g:airline_theme='base16'
      let g:airline_left_sep = ''
      let g:airline_left_sep_alt = ''
      let g:airline_right_sep = ''
      let g:airline_right_sep_alt = ''
    "}}}

    " build/test runner
    NeoBundle 'tpope/vim-dispatch'

    " useful mappings
    NeoBundle 'tpope/vim-unimpaired'

    " unix helpers, SudoWrite/Locate/Remove/Move...
    NeoBundle 'tpope/vim-eunuch'

    " smart selection expand/shrink
    NeoBundle 'terryma/vim-expand-region'

    " show open buffers in the statusline
    NeoBundle 'bling/vim-bufferline' "{{{
      let g:bufferline_echo = 0
    "}}}

    " fuzzy file search and buffer switcher
    NeoBundle 'wincent/command-t' "{{{
      let g:CommandTMaxHeight=13
      let g:CommandTMaxCachedDirectories=100
    "}}}

    " syntax highlighting
    NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
    NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
    NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
    NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
    NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
    NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
    NeoBundleLazy 'elixir-lang/vim-elixir', {'autoload':{'filetypes':['elixir']}}

    " git: show line markers for added/removed/changed lines
    NeoBundle 'mhinz/vim-signify' "{{{
      let g:signify_update_on_bufenter=0
    "}}}

    " git: git handling from inside of vim
    NeoBundle 'tpope/vim-fugitive' "{{{
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>gr :Gremove<CR>
      autocmd BufReadPost fugitive://* set bufhidden=delete
    "}}}
    NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}} "{{{
      nnoremap <silent> <leader>gv :Gitv<CR>
      nnoremap <silent> <leader>gV :Gitv!<CR>
    "}}}

    " undo history browser
    NeoBundleLazy 'mbbill/undotree', {'autoload':{'commands':'UndotreeToggle'}} "{{{
      let g:undotree_SplitLocation='botright'
      let g:undotree_SetFocusWhenToggle=1
      nnoremap <silent> <F5> :UndotreeToggle<CR>
    "}}}

    " filesystem browser
    NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
      let NERDTreeShowHidden=1
      let NERDTreeQuitOnOpen=0
      let NERDTreeShowLineNumbers=1
      let NERDTreeChDirMode=0
      let NERDTreeShowBookmarks=1
      let NERDTreeIgnore=['\.git','\.hg']
      let NERDTreeBookmarksFile=s:get_cache_dir('NERDTreeBookmarks')
      let NERDTreeWinSize=42
      nnoremap <F2> :NERDTreeToggle<CR>
      nnoremap <F3> :NERDTreeFind<CR>
    "}}}

    " fuzzy finder
    NeoBundle 'kien/ctrlp.vim'

    call neobundle#end()
    filetype plugin indent on

"}}}

"{{{ base

colorscheme hybrid
set mouse=a " enable mouse
set mousehide " hide mouse while typing
set history=1000 " command history
set ttyfast " assume fast terminal connection
set encoding=utf-8
set clipboard=unnamedplus " sync with OS clipboard
set hidden " allow buffer switching without saving
set autoread " auto reload if file saved externally
set fileformats+=mac " add mac to auto-detection of file format line endings
set nrformats-=octal " always assume decimal numbers
set showfulltag
set modeline " enable modeline support
set modelines=5 " up to 5 modelines
set noshelltemp " use pipes instead of temp files
set backspace=indent,eol,start " allow backspacing everything in insert mode
set autoindent
set expandtab " <tab> to spaces
set smarttab " <tab> width depending on context
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround " align indents to multiples of shiftwidth
set linebreak
let &showbreak='↪ '
set scrolloff=1 " always show scroll content before/after
set scrolljump=5 " scroll 5 lines
set splitbelow " split new windows below the current window
set splitright " splite new windows right to the current window
set noerrorbells " disable error sounds
set novisualbell
set t_vb= " clear visual bell
set t_Co=256 " tell vim that the host terminal supports 256 colors
set t_ut= " disable clear BCE http://sunaku.github.io/vim-256color-bce.html
set hlsearch " highlight searches
set incsearch " incremental searches
set ignorecase " case-insensitive searches by default
set smartcase " case-sensitive searches if there's a capital letter
set showmatch " highlight matching braces/brackets/...
set matchtime=2
set number " line numbers
set lazyredraw
set noshowmode " don't show a status message on the command line in INSERT/VISUAL/... mode
set nowrap " no soft line wrap
set synmaxcol=192 " limit characters to be syntax highlighted in a line
syntax on

" enable autocompletion
set omnifunc=syntaxcomplete#Complete

" status line
set laststatus=2 " always show the status line

" highlight active line
set cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

" highlight cursor column
set cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn
autocmd WinEnter * setlocal cursorcolumn

" use ag: https://github.com/ggreer/the_silver_searcher
set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepformat=%f:%l:%c:%m

" remove background color and use the terminal bg
hi Normal ctermbg=none

" file management
set undofile
let &undodir = s:get_cache_dir('undo')
set noswapfile
set nobackup

"}}}

"{{{ mappings

    " reselect visual block after indent
    vnoremap < <gv
    vnoremap > >gv

"}}}

" automatically switch the working directory to the where the opened file is
"autocmd BufEnter * lcd %:p:h

" NERDTree: exit vim if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" fuzzy file search
" http://stackoverflow.com/questions/2372307/opening-files-in-vim-using-fuzzy-search
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

nnoremap bl :CtrlPBuffer

" new buffer
nnoremap bc :enew<CR>

" move to the next buffer
nnoremap bn :bnext<CR>

" move to the previous buffer
nnoremap bp :bprevious<CR>
