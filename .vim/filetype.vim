
if exists('b:did_ftplugin')
	finish
endif
let b:did_ftplugin=1


augroup filetypes-settings
	au BufRead,BufNewFile *.py set filetype=python
	au BufRead,BufNewFile *.cpp set filetype=cpp
augroup END


