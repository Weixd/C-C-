" show row number
set number

" not compatible with vi
set nocompatible

" search highlight
set hlsearch

" set tab = 4 space
set tabstop=4
"set tabstop=2

" not compatible with vi
set nocompatible

" highlight currnt line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

filetype off
	set rtp+=~/.vim/bundle/vundle/
	" if in windows, set like this:
	"set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" open file type detection
filetype plugin indent on

"let Vundle manage Vundle
Bundle 'gmarik/vundle'
" Bundles托管插件示例 代码在github上,使用github帐号/项目名，例如：
" Bundle 'tpope/vim-fugitive'
" 代码在vimscript上，使用插件名称，插件名字可以在"http://vim-scripts.org/vim/scripts.html页面中查找，例如：
" Bundle 'vimwiki'
" 非github的插件，使用其git地址，例如：
" Bundle 'git://git.wincent.com/command-t.git'
"Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - 删除插件首先要在.vimrc中注释掉插件相应的行，再运行该命令
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" my bundle manage

" syntax check
"Bundle 'scrooloose/syntastic'

" code completion
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第 2 个字符开始补全
let g:ycm_min_num_of_chars_for_completion= 2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"定义快捷键补全
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"设置关健字触发补全
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', ' ', '(', '[', '&'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1
"定义函数跟踪快捷健
nnoremap <leader>gf :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap<C-a> :YcmCompleter FixIt<CR>
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'

" vim state and line status
Bundle 'vim-airline/vim-airline'

" show tree view
Bundle "scrooloose/nerdtree"
"autocmd vimenter * NERDTree
"nmap <C-t> :TagbarToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim tagbar class view
Bundle 'majutsushi/tagbar'
"nmap <C-t> :TagbarToggle<CR>

" comments auto create
Bundle 'vim-scripts/DoxygenToolkit.vim'

" git modify highlight
Bundle 'airblade/vim-gitgutter'

" markdown
"Bundle 'iamcco/markdown-preview.vim'

" theme color
Bundle "tomasr/molokai"
