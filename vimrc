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

filetype plugin indent on

:nnoremap <C-l> :bnext<CR>
:nnoremap <C-h> :bprevious<CR>
