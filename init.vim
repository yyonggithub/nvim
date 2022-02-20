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
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'

" > NERDTree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'	" need Install a Nerd Font compatible font

Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

" > Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" > Go
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'

" > Search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
"Plug 'ray-x/lsp_signature.nvim'


call plug#end()

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif


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
let mapleader = ' '

" vim-go
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

" disable all linters as that is taken care of by coc.nvim
"let g:go_diagnostics_enabled = 0
"let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
"let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

":GoInfo
"# 自动显示info信息,当光标停留在合法的描述符上后，会自动显示info信息
"let g:go_auto_type_info = 1
"# shortcut
autocmd FileType go nmap <Leader>i <Plug>(go-info)
"# 设置停留时间
set updatetime=500

" Open :GoDeclsDir with ctrl-g
"nmap <C-g> :GoDeclsDir<cr>
"imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" > Find
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" > NERDTree config
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1

nnoremap <leader>t :TagbarToggle<cr>
nmap ss <Plug>(easymotion-s2)

" ale-setting {{{
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>l :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"let g:ale_linters = {
"    \ 'go': ['golint', 'go vet', 'go fmt'],
"	\ 'python': ['flake8', 'pylint'],
"	\ 'rust': ['cargo'],
"    \ }

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

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" markdown support
let g:vim_markdown_folding_disabled = 1

" Automatically remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
