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
"配色
colo evening
"关闭工具栏/滚动条
set go=
"显示最多行
set dy=lastline
"显示匹配括号
set showmatch
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
"背景
set background=dark
"禁用复制自动注释
set paste
"取消确认
set shortmess=atI
"自动保存
set autowrite
"历史记录
set history=1000
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
"最大化窗口
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')
Plugin 'tomasr/molokai'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
"Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
call vundle#end()

"molokai
syntax enable
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
"打开树形列表
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
"emmet 快捷键
let g:user_emmet_expandabbr_key = '<S-Tab>'
"ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
