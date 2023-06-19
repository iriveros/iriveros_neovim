set noexpandtab
set tabstop=2
set shiftwidth=2
autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") <= line("$") | exe 'normal! g`"' | endif
lua require('plugins')
lua require('init')
