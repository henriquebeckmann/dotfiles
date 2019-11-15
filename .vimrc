"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

" vundle
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

" Plugins
	Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
	Plugin 'The-NERD-tree'
    Plugin 'wincent/command-t'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'xuyuanp/nerdtree-git-plugin'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'davidhalter/jedi-vim'
	Plugin 'scrooloose/syntastic'
    Plugin 'yggdroot/indentline'
	Plugin 'majutsushi/tagbar'
	Plugin 'bling/vim-airline'
    Plugin 'Lokaltog/powerline'
	Plugin 'vim-airline/vim-airline-themes'
    Plugin 'flazz/vim-colorschemes'

	call vundle#end()
	filetype on
	filetype plugin on
	filetype plugin indent on

" Basic Commands
	syntax enable

	set t_Co=256
	colorscheme dracula

	set number relativenumber
	set ruler
	set ttyfast

	set tabstop=4
	set shiftwidth=4
	set smarttab
	set expandtab
	set autoindent

    set mouse=c

	set cursorline
	set showmatch

	set encoding=utf-8
	language en_US.utf8

	set nobackup
	set nowritebackup
	set noswapfile

	set backspace=indent,eol,start

	set clipboard=unnamed

	set exrc

    set showcmd

    set wrap

    set incsearch
	set ignorecase

" Additional Shortcuts to Esc
    inoremap jj <Esc>
    inoremap kk <Esc>

" Open/close (parentheses, braces, brackets)
	imap ( ()<left>
	imap [ []<left>
	imap { {}<left>

" Navigation between splits
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Auto centering
	:nnoremap j jzz
	:nnoremap k kzz
    :nnoremap <Down> <Down>zz
    :nnoremap <UP> <Up>zz

" Spell-check
	map <leader>o :setlocal spell! spelllang=pt-BR<CR>
    au! BufNewFile,BufRead * let b:spell_language="brasileiro"
    let spell_auto_type="tex,doc,mail"
    set sps=10

" Copy/paste text from clipboard
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P

" Tabs/Buffers Settings
    tab sball
    set switchbuf=useopen
    set laststatus=1
    nmap <C-b> :bprev<CR>
    nmap <C-n> :bnext<CR>

" Disable automatic comment in newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open below and to the left
	set splitbelow splitright

" Automatically delete blanks at end of line when saving
	autocmd BufWritePre * %s/\s\+$//e

" Powerline Settings
	let g:airline_theme='minimalist'
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#formatter='unique_tail'
    let g:airline#extensions#whitespace#enabled=0
	let g:airline_powerline_fonts=1

" UltiSnips Settings
    let g:UltiSnipsExpandTrigger="<leader><Tab>"
    let g:UltiSnipsJumpForwardTrigger="<leader><Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<leader><s-Tab>"
    let g:snips_author="Henrique Beckmann"
    let g:snips_email="henriquebeckmann2@gmil.com"
    let g:snips_github="github.com/beckmannh"

    let g:UltiSnipsEditSplit="vertical"

" Jedi-vim Settings
    let g:jedi#auto_initialization = 1

    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<S-Tab>"
    let g:jedi#rename_command = "<leader>r"

" Syntastic Settings
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

" NERDTree Settings
    autocmd StdinReadPre * let s:std_in=0
    "autocmd VimEnter * NERDTree
    "autocmd VimEnter * wincmd l " Mover para janela princinal após iniciar o NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
	nmap <leader>' :NERDTreeToggle<CR>

" Tagbar Settings
	let g:tagbar_autofocus=0
	let g:tagbar_width=35
	map <C-t> :TagbarToggle<CR>

" YouCompleteMe Settings
    set completeopt-=preview

" Snippets

    " Python
        autocmd FileType python map <leader><Enter> :w %<Enter>: !clear; python '%'<Enter>

    " LaTeX
        autocmd FileType tex map <leader><Enter> :w %<Enter>: !clear; pdflatex -output-format=pdf '%'<Enter>
        autocmd FileType tex map <leader>r :!clear; bibtex '%:r'.aux<Enter>
