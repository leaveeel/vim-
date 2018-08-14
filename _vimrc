"关闭兼容
set nocompatible
"Windows快捷键
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
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
"高亮
syntax on
"配色
colo evening
"关闭工具栏/滚动条
set go=
"显示最多行
set dy=lastline
"行号
set number
"缩进4空格
set shiftwidth=4
"tab宽4字符
set tabstop=4
"显示tab标签
set showtabline=2
"窗口宽
set columns=200
"窗口高
set lines=50
"tab替换为空格
set expandtab
"退格删除4个空格
set smarttab
"自动缩进
set autoindent
"背景
set background=dark
"禁用复制自动注释
set paste

set softtabstop=4
"打开树形列表
nmap <silent> <c-n> :NERDTreeToggle<CR>

inoremap <C-u> <esc>gUiwea
set shortmess=atI
set autowrite
set history=1000
"禁用方向键
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

set clipboard+=unnamed
"不生成备份文件
set noundofile
set nobackup
set noswapfile
"禁用鼠标
"set mouse-=a


set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            if empty(&shellxquote)
                let l:shxq_sav = ''
                set shellxquote&
            endif
            let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
    endif
endfunction

"emmet 快捷键
let g:user_emmet_expandabbr_key = '<S-Tab>'

"最大化窗口
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
