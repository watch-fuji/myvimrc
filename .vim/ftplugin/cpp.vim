
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal matchpairs+=<:>



setlocal path+=.,/usr/incbude./usr/local/include,/usr/lib/c++/v1

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'justmao945/vim-clang'
NeoBundle 'neocomplete.vim'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'SingleCompile'
NeoBundle 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}
NeoBundle 'osyo-manga/vim-reunions'

call neobundle#end()
NeoBundleCheck



"補完関係
let g:neocomplete#enable_at_startup=1
let g:neocomplete#skip_auto_completion_time=""


"同期補完
let g:marching_backend="sync_clang_command"
let g:marching_clang_command="C:/clang.exe"
let g:marching_clang_command_option="-std=c++1y"
let g:marching_include_paths=$path

"let g:marching_include_paths = filter(
"			\   split(glob('/usr/include/c++/*'), '\n') +
"			\   split(glob('/usr/include/*/c++/*'), '\n') +
"			\   split(glob('/usr/include/*/'), '\n'),
"			\   'isdirectory(v:val)')
"neocompleteとの併用
let g:marching_enable_neocomplete=1
if !exists("g:neocomplete#force_omni_input_patterns")
	let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

