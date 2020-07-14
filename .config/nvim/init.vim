set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Having longer updatetime (default is 4000 ms) leads to noticeable delays.
set updatetime=50

highlight Normal ctermfg=223 ctermbg=234
highlight TablineFill ctermfg=0

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
