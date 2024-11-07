" Show line numbers
set number

" Enable syntax highlighting
syntax on
set termguicolors  " Allows 24-bit color in the terminal, for better syntax highlighting

" Copy/Paste with Ctrl+C and Ctrl+V
if has("win32") || has("win64")
    " Windows
    vnoremap <C-c> "+y
    nnoremap <C-v> "+p
    inoremap <C-v> <C-r>+
else
    " Linux/macOS (requires clipboard support, e.g., 'xclip' or 'pbcopy')
    set clipboard=unnamedplus
    vnoremap <C-c> "+y
    nnoremap <C-v> "+p
    inoremap <C-v> <C-r>+
endif
