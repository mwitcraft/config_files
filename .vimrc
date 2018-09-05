" Vim Config File
" Following Instructions from here: https://realpython.com/vim-and-python-a-match-made-in-heaven/#nix-linux
" Currently at AutoComplete

set nocompatible
filetype off

" Settings
" ----------------------------------------

" Enable syntax highlighting
syntax enable

"Set encoding
set encoding=utf-8

" Set line numbers
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Saves packages to ~/.vim/packages
call vundle#begin('~/.vim/packages/')
Plugin 'gmarik/Vundle.vim'

" Add all plugins below
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
" https://github.com/tomtom/tcomment_vim
Plugin 'tomtom/tcomment_vim'
" https://github.com/jiangmiao/auto-pairs
Plugin 'jiangmiao/auto-pairs'

"All plugins must be added above
call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""
"	Customization of plugins and vim behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Map jj to Escape
inoremap jj <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""
"	NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggles NerdTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>
" Closes NerdTree if it is last tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Shows hidden files
let NERDTreeShowHidden=1
" When NerdTree is toggled, it opens the current file location
autocmd BufEnter * lcd %:p:h
