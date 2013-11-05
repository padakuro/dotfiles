" bling.vim settings (https://github.com/bling/dotvim)
let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.default_indent = 2
let g:dotvim_settings.colorscheme = 'BlackSea'

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
