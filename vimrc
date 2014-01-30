" pathogen infection {{{
call pathogen#infect()
" }}}

" general settings {{{
set background=dark
set autoindent
set modelines=3
syntax on
filetype plugin on
" this is better than just 'set cindent'
filetype indent on
" standard is 8, which is too much for my taste
set shiftwidth=2
" nifty mechanic which tames the standard 8
" character wide tabstop
set softtabstop=2
set expandtab
" show line numbers
set number
set grepprg=grep\ -nH\ $*
" let's make backspace work as expected
set bs=2
" wrap text at 68 characters
set tw=68
set enc=utf-8
set hlsearch incsearch
set modeline
" Using this has strange effects on copy paste behaviour
set mouse=a
" }}}

" colorscheme {{{
colorscheme vibrantink
" }}}

" spurious whitespace highlighting {{{
" FIXME colorscheme destroys these settings so this block must be in
" .{g,}vimrc
" Obtrusive highlighting for ugly whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
"match ExtraWhitespace /\s\+$/
" Show trailing whitepace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
"match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
"match ExtraWhitespace /^\t*\zs \+/
" Switch off :match highlighting.
"match
"" }}}

" switching between multiple tabs {{{
" <M-...> or <A-...> doesn't seem to work for me... i had to use the
" <C-v><key combination> trick to get these mappings
nmap h :tabprevious<CR>
nmap l :tabnext<CR>
" }}}

" command completion setting <tab> {{{
cnoremap <tab> <c-l><c-d>
" }}}

" taggle pasting with F12 {{{
set pastetoggle=<F12>
" }}}

" shell style completion using TAB-key {{{
" replaces ^p
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
	return "\<tab>"
    else
	return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"}}}

" spell checking {{{
let spell_executable = "aspell"
let spell_language_list = "de_DE"
"let spell_language_list = "en_US"
let spell_root_menu = '-'
let spell_auto_type = ''
let spell_insert_mode = 0
" }}}

" latex settings {{{
" latex german quotes
let g:Tex_SmartQuoteOpen="\"\`"
let g:Tex_SmartQuoteClose="\"\'"

" latex env. adaptions
let g:Tex_Env_figure="\\begin{figure}[htpb]\<cr>\\begin{center}\<cr>\\includegraphics[width=0.5\\textwidth]{figures/<+pdf file+>}\<cr>\\end{center}\<cr>\\caption{<+caption text+>}\<cr>\\label{abb:<+label+>}\<cr>\\end{figure}<++>"

"}}}

" doxygen settings {{{
" DoxygenToolkit
let g:DoxygenToolkit_authorName="Sven Schober <sv3sch@yahoo.de>"
" }}}

" changelog setting {{{
let g:CLAuthor="sschober@sssm.de"
" }}}

" git filetype settings {{{
augroup git
  autocmd!
  autocmd FileType gitcommit sil set pvh=0
  autocmd FileType gitcommit DiffGitCached | wincmd R
augroup END
" }}}

" go filetype settings {{{
augroup golang
  autocmd!
  au BufNewFile,BufRead *.go set ft=go
augroup END
" }}}

" Markdown settings {{{
augroup mkd
  autocmd!
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END
" }}}

" tex filetype settings {{{
augroup tex
  autocmd!
  au BufNewFile,BufRead *.tex set ft=tex
augroup END
" }}}

" Clojur settings {{{
"let clj_want_gorilla = 1
"let clj_paren_rainbow = 1
"let clj_highlight_contrib = 1
" }}}

" java-complete settings {{{
augroup java
  autocmd!
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
augroup END
" }}}

" SaveAndMake on F5 {{{
func! SaveAndMake()
  exec "w"
  exec "make"
endfunc

map <F5> :call SaveAndMake()<CR>
" }}}

" UNKNOWN setting {{{
augroup IDONTKNOW
  autocmd!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
augroup END
" }}}

" Vimscript file settings ------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" "Learn vimscript the hard way" settings {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@ sven.schober@uni-ulm.de

inoremap jk <esc>
inoremap <esc> <nop>
nnoremap OA <nop>
nnoremap OD <nop>
nnoremap OC <nop>
nnoremap OB <nop>
" }}}

" general fold options {{{
set foldcolumn=3
" }}}

" perl folding settings {{{
let perl_fold=1
let perl_include_pod=1
let perl_fold_anonymous_subs=1
let perl_nofold_packages=1
" }}}
