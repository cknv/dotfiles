" Enable the filetype detection
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Configure backspace to also be able to delete indent, end of lines, and
" start of insert
set backspace=indent,eol,start

" Highlight the current line
set cursorline

set ruler

" Blink screen instead of play bell on errors
set visualbell

" Always use UTF-8
set encoding=utf-8

" Display line numbers by default
set number

" Break lines on whole words
set linebreak

" Indent using 4 spaces
set expandtab tabstop=4
set smartindent autoindent

" No automatic line breaks by default
set textwidth=0

" Special configuration for git commit messages:
" - Insert linebreaks after 72 characters
" - Enable spellcheck
autocmd Filetype gitcommit set textwidth=72 nonumber spell

" Special configuration for markdown files:
" - Disable line numbers
" - Enable spellcheck
autocmd Filetype markdown set nonumber spell
