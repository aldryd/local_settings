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

" Show the 100 character column
set colorcolumn=100

" Markdown highlighting for .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" 2 spaces for javascript, typescript, json and yaml
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * call <SID>StripTrailingWhitespaces()

" Enable this line if using the pathogen plugins
" execute pathogen#infect()
