" Vim Config File
set nocompatible

" Vundle
" ----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim	" Required for Vundle
call vundle#begin()			" Required for Vundle

Plugin 'VundleVim/Vundle.vim' 		" Required for Vundle

Plugin 'arcticicestudio/nord-vim' 	" Theme

call vundle#end()			" Required for Vundle
filetype plugin indent on		" Required for Vundle
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

" Theme
" ----------------------------------------
colorscheme nord
