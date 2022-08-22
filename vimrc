set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline.git'

" flake8
Plugin 'nvie/vim-flake8'

" syntax
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hynek/vim-python-pep8-indent'
" 这个插件会让vim编辑json的时候隐藏引号，很不爽
" Plugin 'elzr/vim-json'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kylef/apiblueprint.vim'
Plugin 'leafgarland/typescript-vim'

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
"
"
"============ settings ============="
set so=7
" turn on wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
"
"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" For regular expressions turn magic on
set magic

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set nu
" encoding
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

"为不同的文件类型设置不同的空格数替换TAB
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml,yaml,yml,yal,json set ai
autocmd FileType javascript,html,css,xml,yaml,yml,yal,json set sw=2
autocmd FileType javascript,html,css,xml,yaml,yml,yal,json set ts=2
autocmd FileType javascript,html,css,xml,yaml,yml,yal,json set sts=2

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" flake8 settings ================="
autocmd BufWritePost *.py call Flake8()

"============ shortcut ============="
map ;; :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
map <tab> :tabnext<CR>

" run python in vim
nnoremap <buffer> <F9> :!clear<CR> :exec '!python' shellescape(@%, 1)<cr>


"=========== functions ============="

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
