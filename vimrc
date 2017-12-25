set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'othree/html5.vim'
Plugin 'chilicuil/vim-sml-coursera'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set nocompatible
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'toranb/tmux-navigator'
NeoBundle 'toranb/nerd-ack'
NeoBundle 'toranb/vim-ack'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'bling/vim-airline'
NeoBundle 'jshint/jshint'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'walm/jshint.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'jbgutierrez/vim-babel'
NeoBundle 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
call neobundle#end()

if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif
NeoBundleCheck

filetype plugin on
filetype indent on
set t_Co=256
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set undolevels=1000
set hidden
set nobackup
set noswapfile
set noerrorbells
set clipboard=unnamed
set autoread
set autowrite
set backspace=indent,eol,start
set laststatus=2
set splitbelow
set splitright
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jscs']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html", "hbs", "handlebars"] }
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:airline_theme='light'                   " Use the custom theme I wrote
let g:airline_left_sep=''                           " No separator as they seem to look funky
let g:airline_right_sep=''                          " No separator as they seem to look funky
let g:airline#extensions#branch#enabled = 0         " Do not show the git branch in the status line
let g:airline#extensions#syntastic#enabled = 1      " Do show syntastic warnings in the status line
let g:airline#extensions#tabline#show_buffers = 0   " Do not list buffers in the status line
let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = '[R%04l,C%04v] [LEN=%L]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the delek file position info
let g:airline#extensions#virtualenv#enabled = 0
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
syntax enable 
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme default 
set background=light
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<leader>j"
let g:jsx_ext_required = 0
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=24
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = '\v[\/](build)|dist|tmp|bower_components|node_modules|(\.(swp|git|bak|pyc|swp|DS_Store))$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multiple_files = '1jr'
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 25
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|dist|tmp|q2-uux/app|bower_components|node_modules|(\.(swp|git|bak|pyc|DS_Store))$'
let mapleader=" "
let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ },
	\ 'fallback': 'find %s -type f'
	\ }
nnoremap <Leader>ed <C-w><C-v><C-l>:e $MYVIMRC<CR>
function! s:setup_paste() abort
    let s:paste = &paste
    set paste
endfunction

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

nnoremap <C-S-n> :CtrlP<CR>
nnoremap <Leader>ff :CtrlP<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>d :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader><Leader> <c-^>
nnoremap <Esc><Esc> :nohlsearch<CR>
map <Leader>a :Ack!<space>
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
nnoremap <silent> yp :call <SID>setup_paste()<CR>a 

nnoremap <C-j> <C-w>j  
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap jk <ESC>
