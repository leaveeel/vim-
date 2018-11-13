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
"��ɫ
colo evening
"�رչ�����/������
set go=
"��ʾ�����
set dy=lastline
"��ʾƥ������
set showmatch
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
"����
set background=dark
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

"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"����İ�װ·��
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
"�������б�
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
