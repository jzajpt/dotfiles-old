" Use pathogen
call pathogen#infect()

" Filetype
filetype plugin indent on

" Basic configuration
syntax on
set number
set ruler
syntax enable
set encoding=utf-8
set title
set list

" Don't clutter my dirs up with swp and tmp files
set backupdir=~/.tmp
set directory=~/.tmp 


" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab

" Searching
set hlsearch
set incsearch

" Mappings
let mapleader = ","
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map <leader>t :tabnew<cr>

map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <leader>gs :Gstatus<cr>

imap <c-e> <c-o>$
imap <c-a> <c-o>^

" No unecessary whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.feature :%s/\s\+$//e

" I want my NERDtree on the right
let g:NERDTreeWinPos = "right"

" CtrlP config
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

