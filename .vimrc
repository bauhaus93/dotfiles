syntax on
filetype plugin indent on
colorscheme industry
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
set nocompatible exrc secure
set number relativenumber cursorline
set shiftwidth=4 tabstop=4 autoindent smartindent noexpandtab
set autowriteall hidden noswapfile
set laststatus=2
set wildmenu
set clipboard^=unnamed
set ssop-=options
set ssop-=folds
set laststatus=2
set undodir=$HOME/.vim/undo
set undofile
set scrolloff=8

let mapleader=" "
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20

" undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

" vundle

if !filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
	!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'alx741/vim-hindent'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
match ErrorMsg '\s\+$'

"ale

let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_rust_rustfmt_options = "--edition 2021"
let g:ale_linters = {
			\'c': ['cc'],
			\'cpp': ['cc'],
			\'python': ['pylint'],
			\'rust': ['rls'],
			\'tex': ['lacheck'],
			\'haskell': ['hls'],
			\'perl': ['perlcritic'],
			\}

let g:ale_fixers = {
			\'python': ['black', 'isort'],
			\'c': ['clang-format'],
			\'cpp': ['clang-format'],
			\'rust': ['rustfmt'],
			\'cmake': ['cmakeformat'],
			\'elm': ['elm-format'],
			\'html': ['prettier'],
			\'css': ['prettier'],
			\'scss': ['prettier'],
			\'json': ['prettier'],
			\'vue': ['prettier'],
			\'markdown': ['prettier'],
			\'perl': ['perltidy'],
			\'yaml': ['prettier'],
			\'tex': ['latexindent'],
			\'haskell': ['brittany'],
			\'cs': ['dotnet-format', 'uncrustify'],
			\}

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'neiotsraluypfwkmvcxjhkgdb'

" Colemak rebinds
nnoremap N h
nnoremap E j
nnoremap I k
nnoremap O l

"center on g/G
nnoremap gg ggzz
nnoremap G Gzz

" easymotion
nnoremap <leader>s <Plug>(easymotion-s2)
nnoremap <leader>l <Plug>(easymotion-line)

" ag/fzf bindings
nnoremap <leader>fc "ayiw :Ag <C-r>a<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fw :Ag<CR>

" ctags bindings
nnoremap <silent> <leader>t :execute system("ctags -R", "$CWD")<CR>:echom "Updated tags"<CR>
" nnoremap <leader>d <C-]>

" tab/buffer navigation
nnoremap <silent> <C-h> :tabprev<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>


augroup bindings_switch_hdr_src
	autocmd!
	autocmd BufNewFile,BufRead *.c nnoremap <buffer> <leader>s :e %:r.h<CR>
	autocmd BufNewFile,BufRead *.h nnoremap <buffer> <leader>s :e %:r.c<CR>
	autocmd BufNewFile,BufRead *.cpp nnoremap <buffer> <leader>s :e %:r.hpp<CR>
	autocmd BufNewFile,BufRead *.hpp nnoremap <buffer> <leader>s :e %:r.hpp<CR>
augroup end

augroup other_stuff
	autocmd!
	autocmd BufNewFile,BufRead *.elm,*.yml,*.yaml,*.hs set expandtab
augroup end
