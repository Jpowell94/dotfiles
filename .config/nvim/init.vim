set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Having longer updatetime (default is 4000 ms) leads to noticeable delays.
set updatetime=50

if (empty($TMUX))
  if (has("nvim"))

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark
" colorscheme spacemacs-theme
 " colorscheme one
colorscheme gruvbox
" colorscheme dracula
" colorscheme gruvbox-material
" let g:gruvbox_material_background = 'hard'

let g:gruvbox_contrast_dark='hard'

" let g:gruvbox_invert_selection='0'
