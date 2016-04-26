echo "cpp"

setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal matchpairs+=<:>



augroup cpp-path
   autocmd!
   autocmd FileType cpp setlocal path=.,/usr/incbude./usr/local/include,/usr/lib/c++/v1
augroup END

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
call neobundle#end()
NeoBundleCheck

NeoBundleLazy 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}


"同期補完
let g:marching_backend="sync_clang_command"
let g:marching_clang_command_option="-std=c++1y"
let g:marching_enable_neocomplete=1

if !exists("g:neocomplete#force_omni_input_patterns")
	elt g:neocomplete#force_omni_input_patterns={}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

