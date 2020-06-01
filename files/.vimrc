" -- vim-plug -------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" -- plugins -------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'

call plug#end()


colorscheme gruvbox
set bg=dark
syntax on
set mouse=a
set tabstop=4
set number

" -- binds ----------------------------------------------------------------------------

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -lm -o %:r.out && ./%:r.out && rm -rf *.out<CR>

" Press ii to return to normal mode when in insert mode
inoremap ii <ESC>
inoremap <ESC> <NOP>

" Press ii to return to normal mode when in visual mode
vnoremap ii <ESC>
vnoremap <ESC> <NOP>

" Press ii to return to normal mode when in command mode
cnoremap ii <ESC>

" Press ww to do a save on insert mode
inoremap ww <ESC>:w!<CR>

" Press nww to do a save on visual mode
vnoremap nww <ESC>:w!<CR>

" Press nww to do a save on normal mode
nnoremap nww <ESC>:w!<CR>
