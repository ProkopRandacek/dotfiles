" Plugins
call plug#begin('~/.vim/plugged')

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'
Plug 'psf/black', {'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1'}

" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'

" Functionalities
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
call plug#end()

" Colors
syntax on
color dracula
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none


" Sets
set tabstop=4 shiftwidth=4
set autoindent smartindent
set undofile
set encoding=utf-8

set number
set foldmethod=indent

set nowrap       " disable word wrap
set linebreak    " break on words if wrap is enabled
set breakindent  " indent broken lines if wrap is enabled

set incsearch hlsearch    " search (and highlight) as we type
set ignorecase smartcase  " ignore search case, unless we type a capital

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''


" Auto running the code
autocmd FileType python map <F5> :w \| !py %<cr>

hi SpellBad cterm=underline

autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.json execute ':%!python -m json.tool'

" Custom tab sizes for some files
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType md   setlocal tabstop=2 shiftwidth=2

" Folding
nnoremap <space> za

" Custom commands
command Spc :set spell spelllang=cz
command Spe :set spell spelllang=en_us
command Spn :set nospell
