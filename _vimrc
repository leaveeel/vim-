filetype plugin indent on
"关闭兼容
set nocompatible
filetype off
"Windows快捷键
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"字体设置
set guifont=微软雅黑:h13:cGB2312
"当前编辑的文件编码
set fileencoding=utf-8
"支持的编码
set fileencodings=ucs-bom,utf-8,chinese,cp936
set encoding=utf-8
set termencoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决输出乱码
language messages zh_CN.utf-8
"防止特殊符号无法正常显示
set ambiwidth=double
"显示标尺
set ruler
"显示操作
set showcmd
"高亮
syntax on
set cursorline cursorcolumn
"关闭工具栏/滚动条
set go=
"显示最多行
set dy=lastline
"显示匹配括号
"set showmatch
"行号
set number
"制表符缩进4空格
set shiftwidth=4
"制表符宽4字符
set tabstop=4
"制表符替换为空格
set expandtab
"退格删除4个空格
set softtabstop=4
"自动缩进
set autoindent
"显示顶部tab标签
set showtabline=2
"禁用复制自动注释
set paste
"取消确认
set shortmess=atI
"自动保存
set autowrite
"历史记录
set history=1000
"自动折行
set wrap
"禁用方向键
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
"系统剪切板
set clipboard+=unnamed
"不生成备份文件
set noundofile
set nobackup
"不生成意外退出备份文件
"set noswapfile
"禁用鼠标
"set mouse-=a
"设置空格为leader
let mapleader = "\<space>"
"刷新颜色
noremap <Leader>r <Esc>:syntax sync fromstart<CR>
"启动时刷新颜色
autocmd BufNewFile,BufRead * exec ':syntax sync fromstart'
"剪切行
nmap <C-x> dd
"克隆行
nmap <C-d> yyp
"注释
nmap <A-\> :call HtmlAnnotation()<cr>
nmap <A-/> :call JsAnnotation()<cr>

function HtmlAnnotation()
    let line = getline('.')
    if line =~ '^\(	*\| *\)<!-- *.* *-->$'
        normal ^xxxxd^$xxx
        exec ':s/\s*$//g'
        normal j
        return
    else
        normal I<!-- 
        normal $a -->
        normal j
        return
    endif
endfunction

function JsAnnotation()
    let line = getline('.')   
    if line =~ '^\(	*\| *\)// *.*$'
        normal ^xxd^
        normal j
        return
    else
        normal I// 
        normal j
        return
    endif
endfunction
"选中文本添加括号
vmap <A-9> c(<Esc>p
vmap <A-'> c'<Esc>p
vmap <A-"> c"<Esc>p
vmap <A-[> c[,<cr><Esc>k$"_xp
vmap <A-{> c{,<cr><Esc>k$"_xp
"新建函数
imap f<Tab> function() {,<cr><Esc>k$"_xF(a
imap af<Tab> () => {,<cr><Esc>k$"_xF(a
imap as<Tab> async function() {,<cr><Esc>k$"_xF(a
imap c<Tab>  {,<cr><Esc>k$"_xo<Tab>
"自动缩进
"autocmd BufWritePre,BufRead * :normal gg=G
"最大化窗口
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
"新html文件初始化
autocmd BufNewFile *.html exec ':call HTMLModel()'
func HTMLModel()
    call setline(1,"<!DOCTYPE html>")
    call append(line("."),      "<html>")
    call append(line(".")+1,    "    <head>")
    call append(line(".")+2,    "        <meta charset='utf-8' />")
    call append(line(".")+3,    "        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no' />")
    call append(line(".")+4,    "        <meta http-equiv='X-UA-Compatible' content='IE=Edge,chrome=1' />")
    call append(line(".")+5,    "        <meta name='renderer' content='webkit' />")
    call append(line(".")+6,    "        <title></title>")
    call append(line(".")+7,    "    </head>")
    call append(line(".")+8,    "    <body>")
    call append(line(".")+9,    "        ")
    call append(line(".")+10,   "    </body>")
    call append(line(".")+11,   "</html>")
endfunc
autocmd BufNewFile *.html normal 11G$
"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
"Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

"molokai
syntax enable
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
"树形表
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
"emmet 快捷键
let g:user_emmet_expandabbr_key = '<S-Tab>'
"ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'
"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let javascript_enable_domhtmlcss = 1
