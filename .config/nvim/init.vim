" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dag/vim-fish'
Plug 'psf/black', {'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1'}
Plug 'gyim/vim-boxdraw'
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


" Auto running the code
autocmd FileType python map <F5> :w \| !py %<cr>

autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.json execute ':%!python -m json.tool'

" Custom tab sizes for some files
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType md   setlocal tabstop=2 shiftwidth=2

autocmd FileType md   set wrap

" Folding
nnoremap <space> za

" Spell stuff
command Spc :set spell spelllang=cz_cs
command Spe :set spell spelllang=en_us
command Spn :set nospell


hi SpellBad NONE
hi SpellBad cterm=underline
hi SpellBad ctermfg=red

hi SpellCap NONE
hi SpellCap cterm=underline
hi SpellCap ctermfg=blue
