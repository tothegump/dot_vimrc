" TODO: http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/225852#225852

set background=dark

" General "{{{
set nocompatible  " disable vi compatibility.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread  
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Buffers
set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   "
" "}}}

" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

" set nowrap " 超出一行不折叠
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=4    " Set the default tabstop
set softtabstop=4
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
filetype plugin indent on             " Automatically detect file types.
" "}}}



" Visual "{{{
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set nolist " Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

set mouse-=a   " Disable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" "}}}

" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!



filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
Bundle 'gmarik/Vundle'
" ...
Bundle 'Valloric/YouCompleteMe'
" 语法关键字补全              
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
"let g:ycm_global_ycm_extra_conf = "/Users/sucre/.gump_conf/ycm_extra_conf.py"
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
Bundle 'A.vim'

" Bundle 'Valloric/YouCompleteMe'
" Bundle 'gmarik/Vundle'
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" Bundle 'A.vim'

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


set nu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  turning-vim-into-a-modern-python-ide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
" minibuffer
Bundle 'fholgado/minibufexpl.vim'
" To make finding and opening files within your project even easier, we are
" going to use the command-t plugin. It does have some parts that need to be
" compiled, so its not already installed by adding it as a submodule. Go to
" your ~/.vim/bundle/command-t folder and run 'rake make'. Yes you need ruby
" installed. By default, command-t is bound to <leader>t. This will use fuzzy
" text matching to find any file in your project.
" It also supports searching only through opened buffers, instead of files
" using <leader>b.
"Bundle 'wincent/Command-T'
"Syntax Highlighting and Validation
Bundle 'mitechie/pyflakes-pathogen'
let g:pyflakes_use_quickfix = 0
" searching, like grep
Bundle 'mileszs/ack.vim'
nmap <leader>a <Esc>:Ack!
" We use ! at the end of it so it doesn't open the first result automatically.
Bundle 'vim-scripts/pep8'
let g:pep8_map='<leader>8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
" todolist
Bundle 'TaskList.vim'
map <leader>td <Plug>TaskList
" NERD Tree is a project file browser.
Bundle 'The-NERD-tree'
map <leader>n :NERDTreeToggle<CR>
" Refactoring and Go to definition
Bundle 'klen/python-mode'
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
map <leader>g :GundoToggle<CR>
Bundle 'fs111/pydoc.vim'


" list of Bundles, for it's easy to check
"
" Bundle 'msanders/snipmate.vim.git'
" Bundle 'tpope/vim-surround.git'
" Bundle 'tpope/vim-git.git'
" Bundle 'ervandew/supertab.git'
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'mitechie/pyflakes-pathogen.git'
" Bundle 'mileszs/ack.vim'
" Bundle 'sjl/gundo.vim.git'
" Bundle 'fs111/pydoc.vim.git'
" Bundle 'vim-scripts/pep8.git'
" Bundle 'alfredodeza/pytest.vim.git'
" Bundle 'reinh/vim-makegreen'
" Bundle 'vim-scripts/TaskList.vim.git'
" Bundle 'vim-scripts/The-NERD-tree.git'
" Bundle 'klen/rope-vim.git'
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Yggdroot/indentLine'
Bundle "airblade/vim-gitgutter"
Bundle "gregsexton/gitv"
Bundle "tpope/vim-commentary"
Bundle "Raimondi/delimitMate"

" indentLine 更加美观的显示缩进对齐线
" GitGutter 实时显示git更改
" Gitv 查看Git详细提交日志(类似gitk)   Gitv 实现了可以用Vim来查看Git的详细提交信息, 只需要打开Vim 执行 :Gitv
" vim-commentary Vim批量注释工具, 可以注释多行和去除多行注释 Visual 模式下 gc 命令可以注释选中的行 普通模式下 gcc 指令可以快速注释一行 gcu 可以撤销注释
autocmd FileType python,shell set commentstring=#\ %s                 " 设置Python注释字符
autocmd FileType mako set cms=##\ %s
" delimitMate 用于补全括号和引号


" Vim doesn't realize that you are in a virtualenv so it wont give you code
" completion for libraries only installed there. Add the following script to
" your ~/.vimrc to fix it:
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


" Code Folding
set foldmethod=indent
set foldlevel=99
" Window Splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>td <Plug>TaskList

filetype plugin indent on     " required!
