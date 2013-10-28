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
set autowrite     " Automatically :write before running commands
set laststatus=2  " Always display the status line

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

map <Leader>gac :Gcommit -a -m ""<LEFT>
map <Leader>gc :Gcommit -a<cr>
map <leader>gs :Gstatus<cr>

imap <c-e> <c-o>$
imap <c-a> <c-o>^

map <leader>n :NERDTreeToggle<cr>

" No unecessary whitespaces
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.erb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.feature :%s/\s\+$//e
autocmd BufWritePre *.handlebars :%s/\s\+$//e
autocmd BufWritePre *.hbs :%s/\s\+$//e

" I want my NERDtree on the right
let g:NERDTreeWinPos = "right"

" CtrlP config
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }

" Typos
command W w
command Q q
command Wq wq
command WQ wq

" Syntax highlight
au BufRead,BufNewFile *.rabl,*.json_builder,*.assetfile,Rakefile,Assetfile,Guardfile set ft=ruby

" CtrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

"Copy and paste between different Vim sessions
nmap <Leader>Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap <Leader>Y :w! ~/.vi_tmp<CR>
nmap <Leader>P :r ~/.vi_tmp<CR>

