
" Recognize the platform
function! GetRunningOS()
	if has("win32")
		return "win"
	endif
	if has("unix")
		if system('uname')=~'Darwin'
			return "mac"
		else
			return "linux"
		endif
	endif
endfunction
let os=GetRunningOS()

" linux
if os=~"linux"
	set guifont=NanumGothicCoding\ 10	
	set clipboard=unnamedplus
endif

" mac
if os=~"mac"
	set guifont=NanumGothicCoding:h13
	let g:tagbar_ctags_bin='/usr/local/bin/ctags'
	set clipboard=unnamed
endif

" windows
if os=~"win"
	set clipboard=unnamed
endif

set tags+=./tags

" common
set tabstop=4
set shiftwidth=4
set expandtab " tap->spaces
set smarttab
set smartindent
set autoindent
set wrap
set number
set ignorecase
set hlsearch
set showmatch
set mouse=a
set fencs=usc-bom,utf-8,cp949
set nocompatible
set foldnestmax=1

filetype on
syntax on
syntax enable
colorschem ron

" auto save & load
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

hi CursorLine	cterm=NONE ctermbg=blue ctermfg=white guibg=blue guifg=white
set cursorline
"hi CursorColumn	cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"set cursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'fugitive.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'AutoComplPop'
Plugin 'Tagbar'
Plugin 'grep.vim'
Plugin 'ctrlp.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
"Plugin 'edc-support' " for Tizen development
"Plugin 'bling/vim-airline'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'surround.vim'
"Plugin 'https://github.com/wesleyche/SrcExpl'
"Plugin 'OmniCppComplete'
"Plugin 'Syntastic'

filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" key maps
map <C-n> :tabnew<CR>
"nnoremap <C-k> :m .-2<CR>
"nnoremap <C-j> :m .+1<CR>
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-K> :m '<-2<CR>gv=gv

" NERDtree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
if os=~"win"
	map <F3> :NERDTreeFind<CR>
else
	map <F3> :NERDTreeToggle<CR>
endif

" NerdCommenter
if os=~"linux" " TODO
	map <C-_> <plug>NERDCommenterToggle
	map <Leader>? <plug>NERDCommenterInvert
else
	map <C-_> <plug>NERDCommenterToggle
	map <Leader>? <plug>NERDCommenterInvert
endif

" Tagbar
let g:tagbar_width=30
map <F4> :TagbarToggle<CR>

" grep
let g:Grep_Skip_files='tags'
let g:Grep_Skip_Dirs='boost .git CMakeFiles'
map <F2> :Rgrep -I --exclude="tags"<CR><CR><CR><CR>

" ctrlp
let g:ctrlp_custom_ignore={'dir': '\v[\/](boost)$',}
map <C-p>1 <ESC>:CtrlPMixed<CR>
map <C-p>2 <ESC>:CtrlPBuffer<CR>

" FuzzyFinder
"map <C-p>1 <ESC>:FufCoverageFile!<CR>
"map <C-p>2 <ESC>:FufBuffer!<CR>
map <C-p>3 <ESC>:FufChangeList!<CR>
map <C-p>4 <ESC>:FufLine!<CR>
map <C-p>5 <ESC>:FufJumpList!<CR>

" cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" edc-support
"augroup filetypedetect
	"au BufNewFile,BufRead *.edc setfiletype edc
"augroup END

" EOF
