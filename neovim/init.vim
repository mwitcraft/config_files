"Set beginning options
set nocompatible
set rtp +=~/.config/nvim/bundle/Vundle.vim
let &packpath = &runtimepath
filetype indent plugin on
syntax on

"----------------Custom behavior / Configs ------------------------------
"Maps jj to 'Esc'
    inoremap jj <Esc>
"Shows line numbers
    set number
"Show gutter
    set signcolumn=yes
"Set space to leader
    nnoremap <SPACE> <Nop>
    let mapleader=" "
"Navigate windows with leader-w instead of ctrl-w
    noremap <leader>w <C-w>
"Scrolls when within 5 lines of top or bottom
    set scrolloff=5
"------------------------------------------------------------------------

"----------------Indentation Rules---------------------------------------
"Default :
    "Width of tab is set to 4
        set tabstop=4
    "Indents have width of 4
        set shiftwidth=4
    "Sets number of columns for a tab
        set softtabstop=4
    "Expands tabs to spaces
        set expandtab
"------------------------------------------------------------------------

"----------------Plugin Install------------------------------------------
"Open vundle
    call vundle#begin('~/.config/nvim/bundle') 
"Required for vundle
    Plugin 'VundleVim/Vundle.vim'
"My Plugins
    "File explorer
        Plugin 'scrooloose/nerdtree'
    "Git viewer
        Plugin 'airblade/vim-gitgutter'
    "Linter
        Plugin 'w0rp/ale'
    "Autocomplete 'Engine'
        Plugin 'Shougo/deoplete.nvim'
    "Compatibility layer for autocomplete engine
        Plugin 'roxma/vim-hug-neovim-rpc'
    "Autocomplete for C/C++
        Plugin 'Shougo/deoplete-clangx'
    "Themes - Currently not in use
        Plugin 'rafi/awesome-vim-colorschemes'
    "Statusbar
        Plugin 'vim-airline/vim-airline'
    "Statusbar Themes
        Plugin 'vim-airline/vim-airline-themes'
    "More Themes - Currently using
        Plugin 'NLKNguyen/papercolor-theme'
"Close vundle
    call vundle#end()
"------------------------------------------------------------------------

"----------------Plugin Behavior-----------------------------------------
"NerdTree
    "Toggle NerdTree with Space-n
        nmap <leader>n :NERDTreeToggle<cr>

"Deoplete
    "Enable Deoplete
        let g:deoplete#enable_at_startup = 1

"Theme
    "Enables Theme
        colorscheme PaperColor 
    "Status bar Theme
        let g:airline_theme='papercolor'
"------------------------------------------------------------------------
