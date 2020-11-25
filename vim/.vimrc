" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" grey status bar at the bottom
set laststatus=2

" syntax highlighting
syn on

" activates indenting for files
filetype indent on

" auto indenting
set ai

" case insensitive search
set ic

" search highlighting
set hlsearch

" Make the backspace key work the way it should
set backspace=indent,eol,start

" Show line numbers
set number

" colorscheme
colorscheme jellybeans

" Set the width and height of the window
set lines=50 columns=110

" Show the 100 character column
set colorcolumn=100

" Markdown highlighting for .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Pathogen to manage plugins
call pathogen#infect()

" vim-airline config
"let g:airline_powerline_fonts=1
