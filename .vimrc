" my vim settings
" author yuya aoki
syntax on
set number
colorscheme darkblue
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
augroup cpp-path
   autocmd!
   autocmd FileType cpp setlocal path=.,/usr/incbude./usr/local/include,/usr/lib/c++/v1
augroup END
if 0 | endif

nmap <F5> :!python %

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
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'jmcantrell/vim-virtualenv'
"NeoBundle 'Flake8-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
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

" Jedi for python
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

NeoBundleLazy 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}
let python_major_version = system("python -c 'import sys; print(sys.version_info[0])'")
if python_major_version == 2 && has('python')
    python None
elseif python_major_version == 3 && has('python3')
    python3 None
endif

if ! empty(neobundle#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 1

  nnoremap [jedi] <Nop>
  xnoremap [jedi] <Nop>
  nmap <Leader>j [jedi]
  xmap <Leader>j [jedi]

  let g:jedi#completions_command = "<C-Space>"    " 補完キーの設定この場合はCtrl+Space
  let g:jedi#goto_assignments_command = "<C-g>"   " 変数の宣言場所へジャンプ（Ctrl + g)
  let g:jedi#goto_definitions_command = "<C-d>"   " クラス、関数定義にジャンプ（Gtrl + d）
  let g:jedi#documentation_command = "<C-k>"      " Pydocを表示（Ctrl + k）
  let g:jedi#rename_command = "[jedi]r"
  let g:jedi#usages_command = "[jedi]n"
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0

  autocmd FileType python setlocal completeopt-=preview

  " for w/ neocomplete
    if ! empty(neobundle#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python =
                        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif

set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

"C-lang settings
let g:clang_c_options='-std=c11'
let g:clang_cpp_options='-std=c++1z -stdlib=libc++ --pedantic-errors'


"保存時に自動でチェック
let g:PyFlakeOnWrite = 1

"解析種別を設定
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'

"McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity=10

"visualモードでQを押すと自動で修正
let g:PyFlakeRangeCommand = 'Q'

function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    "--ignote=E501: 一行の長さの補正を無視"
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

" Shift + F でautopep自動修正
nnoremap <S-f> :call Autopep8()<CR>

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
