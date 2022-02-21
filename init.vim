set number
filetype plugin indent on
" Colorscheme
syntax enable
set showmatch
set shiftwidth =4
set tabstop=4
set encoding=utf-8
set hlsearch
set autoindent
set clipboard=unnamed
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline
set backspace=2
" 打开 24 位真彩色支持
"set termguicolors
" 搜索的时候忽略大小字字母
set ignorecase
" 若搜索内容中有大写字母，则不再忽略大小写
set smartcase
" 高亮第80列
set colorcolumn=80
" 高亮光标所在行
set cursorline


call plug#begin('~/.vim/plugged')
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" > Default
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
" > surround用于高效操作与括号、引号或html、xml标签相关的配对符号(surrounding)
Plug 'tpope/vim-surround'
" > Auto-pairs 高效率完成括号、引号的快速输入和自动补全
Plug 'jiangmiao/auto-pairs'

" > NERDTree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'	" need Install a Nerd Font compatible font

" > Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" > Go
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'

" > Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" > ctrlp 是一款支持对文件、缓冲区( :CtrlPBuffer )、MRU(Most Recently Used)文件( :CtrlPMRU )和标签进行模糊搜索/查找的Vim插件，也支持通过正则表达式搜索 ( <Ctrl>-r 进行切换)
Plug 'ctrlpvim/ctrlp.vim'

" > vim-snippets 代码片段
Plug 'honza/vim-snippets'

" markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

" > Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" > Theme
"Plug 'fatih/molokai'
Plug 'tomasiser/vim-code-dark'

" > Other

call plug#end()

" > Theme -------------------------------------------
" molokai theme
"set t_Co=256
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai

" vim-code-dark theme
set t_Co=256
set t_ut=
colorscheme codedark
let g:airline_theme = 'codedark'

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ','

" > NERDTree -------------------------------------------
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

nnoremap <leader>t :TagbarToggle<cr>
nmap ss <Plug>(easymotion-s2)

" > COC -------------------------------------------
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" > UltiSnips
let g:UltiSnipsExpandTrigger="`"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
"let g:UltiSnipsJumpForwardTrigger="`"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" 使用tab键来选择首个候选项
" NOTE: 使用命令':verbose imap <tab>' 查看tab键是否被其它插件使用
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" > GO -------------------------------------------
" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_doc_popup_window = 1

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" > Markdown -------------------------------------------
" markdown support
let g:vim_markdown_folding_disabled = 1
