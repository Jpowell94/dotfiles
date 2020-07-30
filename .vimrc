"        (_)                      
" __   __ _  _ __ ___   _ __  ___ 
" \ \ / /| || '_ ` _ \ | '__|/ __|
"  \ V / | || | | | | || |  | (__ 
"(_)\_/  |_||_| |_| |_||_|   \___|

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"Longer update times lead to a worse user experience (supposedly)
set updatetime=50

set number

set cursorline

syntax on

set showmatch

set hlsearch

set incsearch

"File type specific settings===================================================

"remove trailing whitespace from certain file types
autocmd FileType r,rmarkdown,*.R,yaml autocmd BufWritePre <buffer> %s/\s\+$//e 

"line length ruler and tab options
autocmd FileType rmarkdown setlocal cc=80
autocmd FileType ipynb     setlocal cc=79
autocmd FileType vim       setlocal cc=80
autocmd FileType perl      setlocal cc=80
autocmd FileType r         setlocal cc=80
autocmd FileType r         setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype python    setlocal cc=79
autocmd Filetype python    setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype yaml      setlocal cc=80

"macros for R package development; creates roxygen skeleton
map @x i#''xVy9pkA @vhyjjpjjpjjpjjpjp/@atitlenadescriptionnaparamnareturnnaimportFromnaexport€ýa

map @b i```{lli

map @d i---Vyotitle:output:	flexdashboard::flex_dashboard:po###Vyop

map @h i---Vyopkititle:author: Jesse Powelldate: "`r format(Sys.time(), '%d %B, %Y

"Customize Colors==============================================================

highlight TablineFill ctermfg=0
highlight Pmenu ctermfg=15 ctermbg=0 guibg=Black 
highlight PmenuSel ctermfg=0 ctermbg=15 guibg=White
highlight LineNr ctermfg=248 guifg=DarkGrey  
highlight Folded ctermfg=248 ctermbg=none
highlight MatchParen cterm=bold 
highlight Comment ctermfg=248
highlight ColorColumn ctermbg=242 guibg=DarkGrey 
highlight CursorLine cterm=none ctermbg=0
highlight cursorLineNr cterm=none  ctermfg=5
highlight Visual cterm=reverse
highlight FloatermBorder ctermbg=5
highlight Search cterm=reverse ctermbg=0 ctermfg=15
highlight SignColumn ctermbg=none
highlight GitGutterAdd ctermfg=0 ctermbg=121
highlight GitGutterChange ctermfg=0 ctermbg=12
highlight GitGutterDelete ctermfg=0 ctermbg=9
highlight DiffAdd ctermfg=0 ctermbg=121
highlight DiffChange ctermfg=0 ctermbg=12
highlight DiffDelete ctermfg=0 ctermbg=9

set t_Co=256
"if exists('+termguicolors')
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "set termguicolors
"endif

if (empty($TMUX))
 if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif
"Text, tab, and indent related=================================================

" use <tab> for trigger completion
" and navigate to the next complete item using coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

:set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


"Plugins=======================================================================

call plug#begin()

Plug 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'minimalist'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'tmux-plugins/vim-tmux'

Plug 'powerline/powerline'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-markdown'

Plug 'scrooloose/nerdtree'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'nelstrom/vim-markdown-folding'

Plug 'jalvesaq/Nvim-R'

Plug 'gaalcaras/ncm-R'

Plug 'vim-pandoc/vim-pandoc'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'vim-pandoc/vim-rmarkdown'

Plug 'rizzatti/dash.vim'

Plug 'severin-lemaignan/vim-minimap'
let g:minimap_highlight='Visual'

Plug 'chrisbra/csv.vim'

Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'goerz/jupytext.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ap/vim-buftabline'

Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_r_lintr_options = "with_defaults(line_length_linter(80))"
let g:ale_r_lintr_lint_package = 1

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'kevinoid/vim-jsonc'

Plug 'morhetz/gruvbox'

Plug 'lilydjwg/colorizer'

Plug 'tpope/vim-commentary'

Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_toggle = '<F12>'
nnoremap <silent> <F9> :FloatermSend<CR>
nnoremap <silent> <F7> :FloatermNew --position=bottom --height=0.25 --width=0.8 ipython<CR>

Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_signs_removed = '-'
let g:gitgutter_signs_modified = '~'
set signcolumn=yes

Plug 'colepeters/spacemacs-theme.vim'

Plug 'rakr/vim-one'

Plug 'dracula/vim',{'as':'dracula'}
call plug#end()
