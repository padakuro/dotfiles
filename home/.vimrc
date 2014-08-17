" inspired by https://github.com/bling/dotvim

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
    
    NeoBundle 'chriskempson/base16-vim'
    NeoBundle 'bling/vim-airline' "{{{ 
      let g:airline_theme='wombat'
      let g:airline_powerline_fonts = 1
    "}}}
    NeoBundle 'tpope/vim-dispatch'
    NeoBundle 'tpope/vim-unimpaired'
    NeoBundle 'tpope/vim-speeddating'
    NeoBundle 'terryma/vim-expand-region'
    NeoBundle 'bling/vim-bufferline' "{{{
      let g:bufferline_echo = 0
    "}}}
    NeoBundle 'wincent/command-t' "{{{
      let g:CommandTMaxHeight=13
      let g:CommandTMaxCachedDirectories=100
    "}}}

    NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
    NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
    NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
    NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
    NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
    NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
    NeoBundleLazy 'elixir-lang/vim-elixir', {'autoload':{'filetypes':['elixir']}}

    NeoBundle 'mhinz/vim-signify' "{{{
      let g:signify_update_on_bufenter=0
    "}}}
    
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
    
    NeoBundleLazy 'mbbill/undotree', {'autoload':{'commands':'UndotreeToggle'}} "{{{
      let g:undotree_SplitLocation='botright'
      let g:undotree_SetFocusWhenToggle=1
      nnoremap <silent> <F5> :UndotreeToggle<CR>
    "}}}
    
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
    
    call neobundle#end()
    filetype plugin indent on 

"}}}

"{{{ base

colorscheme base16-default
set mouse=a " enable mouse
set mousehide " hide mouse while typing
set history=1000 " command history
set ttyfast " assume fast terminal connection
set encoding=utf-8
if exists('$TMUX')
    set clipboard=
else
    " sync with OS clipboard
    set clipboard=unnamedplus
endif
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
set hlsearch " highlight searches
set incsearch " incremental searches
set ignorecase " case-insensitive searches by default
set smartcase " case-sensitive searches if there's a capital letter
set showmatch " highlight matching braces/brackets/...
set matchtime=2
set number " line numbers
set lazyredraw
set noshowmode " don't show a status message on the command line in INSERT/VISUAL/... mode
set foldenable " enable folding
set foldmethod=syntax
set foldlevelstart=99 " open all folds by default

" status line
set laststatus=2 " always show the status line
"hi StatusLine cterm=bold ctermbg=white

" highlight active line
set cursorline 
highlight CursorLine term=reverse cterm=none ctermbg=237
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

" highlight cursor column
set cursorcolumn 
highlight CursorColumn term=reverse cterm=none ctermbg=234
autocmd WinLeave * setlocal nocursorcolumn
autocmd WinEnter * setlocal cursorcolumn

" line number
highlight LineNr term=none ctermfg=8 ctermbg=235
highlight CursorLineNr ctermfg=255 ctermbg=237

" highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=green
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=red
highlight DiffChange        cterm=bold ctermbg=none ctermfg=yellow

" highlight signs in Sy
highlight SignColumn        ctermbg=235
highlight SignifySignAdd    cterm=bold ctermbg=235  ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=235  ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=235  ctermfg=yellow

highlight PMenuSel          ctermbg=237 ctermfg=255
highlight Search            ctermbg=148 ctermfg=0
highlight Todo              ctermbg=237
highlight VertSplit         ctermbg=235 ctermfg=237
highlight Visual            ctermbg=235

" use ag: https://github.com/ggreer/the_silver_searcher
set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
set grepformat=%f:%l:%c:%m

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
autocmd BufEnter * lcd %:p:h

" NERDTree: exit vim if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

