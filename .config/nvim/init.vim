" Plugins
call plug#begin('~/.vim/plugged')

" Functionality
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Hint menu thing
"Plug 'scrooloose/nerdtree' " file tree
"Plug 'scrooloose/nerdcommenter' " Comment line thing
"Plug 'airblade/vim-gitgutter' " Git thing
"Plug 'ryanoasis/vim-devicons' " Fancy icons in nerd tree
"Plug 'tsony-tsonev/nerdtree-git-plugin' " idk
"Plug 'nathanaelkane/vim-indent-guides' " indent lines

" Looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code formatting
"Plug 'psf/black', {'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1'} " (python)
Plug 'psf/black'

" Syntax
Plug 'dag/vim-fish'
Plug 'alantech/vim-alan'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()

" Colors
syntax on
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none


" Sets
set tabstop=4 shiftwidth=4
set autoindent smartindent
set undofile
set backup
set writebackup
set encoding=utf-8

set number
set foldmethod=indent

set nowrap       " disable word wrap
set linebreak    " break on words if wrap is enabled
set breakindent  " indent broken lines if wrap is enabled

set incsearch hlsearch    " search (and highlight) as we type
set ignorecase smartcase  " ignore search case, unless we type a capital

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.json execute ':%!python -m json.tool'

autocmd BufWritePre *.c %s/\s\+$//e
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

filetype plugin indent on

" Custom tab sizes for some files
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType md   setlocal tabstop=2 shiftwidth=2
autocmd FileType txt   setlocal wrap
"autocmd FileType py   setlocal tabstop=4 shiftwidth=2

autocmd FileType md   set wrap

" Folding
nnoremap <space> za

" Spell stuff
command Spc :set spell spelllang=cz_cs
command Spe :set spell spelllang=en_us
command Spd :set spell spelllang=de_20
command Spn :set nospell

hi SpellBad NONE
hi SpellBad cterm=underline
hi SpellBad ctermfg=red

hi SpellCap NONE
hi SpellCap cterm=underline
hi SpellCap ctermfg=blue

" Use deoplete.
let g:deoplete#enable_at_startup = 1
