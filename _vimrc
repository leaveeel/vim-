filetype plugin indent on
"�رռ���
set nocompatible
filetype off
"Windows��ݼ�
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"��������
set guifont=΢���ź�:h13:cGB2312
"��ǰ�༭���ļ�����
set fileencoding=utf-8
"֧�ֵı���
set fileencodings=ucs-bom,utf-8,chinese,cp936
set encoding=utf-8
set termencoding=utf-8
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"����������
language messages zh_CN.utf-8
"��ֹ��������޷�������ʾ
set ambiwidth=double
"��ʾ���
set ruler
"��ʾ����
set showcmd
"����
syntax on
set cursorline cursorcolumn
"�رչ�����/������
set go=
"��ʾ�����
set dy=lastline
"��ʾƥ������
"set showmatch
"�к�
set number
"�Ʊ������4�ո�
set shiftwidth=4
"�Ʊ����4�ַ�
set tabstop=4
"�Ʊ���滻Ϊ�ո�
set expandtab
"�˸�ɾ��4���ո�
set softtabstop=4
"�Զ�����
set autoindent
"��ʾ����tab��ǩ
set showtabline=2
"���ø����Զ�ע��
set paste
"ȡ��ȷ��
set shortmess=atI
"�Զ�����
set autowrite
"��ʷ��¼
set history=1000
"���÷����
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
"ϵͳ���а�
set clipboard+=unnamed
"�����ɱ����ļ�
set noundofile
set nobackup
"�����������˳������ļ�
"set noswapfile
"�������
"set mouse-=a
"��󻯴���
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
"��ʼ��
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
"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"����İ�װ·��
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
"���α�
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
"emmet ��ݼ�
let g:user_emmet_expandabbr_key = '<S-Tab>'
"ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
