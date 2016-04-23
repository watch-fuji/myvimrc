" my vim settings
" Author: yuya aoki

syntax on
set number
set noswapfile
set cmdheight=2
set title
set wildmenu
set smartcase
set hlsearch
set background=dark
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
colorscheme darkblue

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

nmap	<Leader>f [unite]



augroup cpp-path
   autocmd!
   autocmd FileType cpp setlocal path=.,/usr/incbude./usr/local/include,/usr/lib/c++/v1
augroup END
if 0 | endif

" put esc-key for delete highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'justmao945/vim-clang'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'supermomonga/vimshell-kawaii.vim'
NeoBundle 'Shougo/unite.vim'
call neobundle#end()

" Required:
filetype plugin indent on



" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
let g:syntastic_python_checkers = ['pyflakes']


NeoBundleLazy 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}

"下の猫がうっとおしかったらこことNeoBundleの部分を消してください

set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]

let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

"C-lang settings
let g:clang_c_options='-std=c11'
let g:clang_cpp_options='-std=c++1z -stdlib=libc++ --pedantic-errors'

