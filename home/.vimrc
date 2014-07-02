let mapleader = ","
let g:NERDTreeWinSize = 45

" bling.vim settings (https://github.com/bling/dotvim)
let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.default_indent = 2
let g:dotvim_settings.colorscheme = 'default'

" bling.vim main files
source ~/.vim/vimrc

" don't enable mouse
" set mouse-=a

" use the X clipboard register (+) so we can copy/paste in and out of vim
set clipboard=unnamedplus

" reset arrow key bindings to default
:unmap <Up>
:unmap <Right>
:unmap <Down>
:unmap <Left>

" NERDTree: exit vim if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" automatically switch the working directory to the where the opened file is
autocmd BufEnter * lcd %:p:h

set guifont=Meslo\ LG\ M\ 11

