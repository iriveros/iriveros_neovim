set noexpandtab
set tabstop=2
set shiftwidth=2
autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") <= line("$") | exe 'normal! g`"' | endif
let mapleader = "\<Bslash>"
lua require('init')
lua require('plugins')
