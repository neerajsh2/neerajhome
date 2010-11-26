set nocompatible
if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  set guifont=Consolas:h10:cANSI
  colorscheme molokai
  set nu
  au guienter * simalt ~x
else
  colorscheme elflord
  set background=dark
  set nonu
endif

set showcmd
set showmatch
set ignorecase
set incsearch
set hlsearch

set autoread

set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set ls=2

" no errors and bells
set noerrorbells
set novisualbell
set vb t_vb=
set magic "Set Magic on, for regular expressions

" No backups needed
set nobackup
set nowb
set noswapfile

set autochdir

" set the syntax on
syntax on
set ruler
filetype on
filetype indent on
filetype plugin on
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

set completeopt=longest,menuone 
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>" 
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
set wildmenu

let mapleader = ","
let g:mapleader = ","
" Fast Saving

nmap <leader>w :w!<cr>
map <leader>e :e!~/_vimrc<cr>

autocmd! bufwritepost vimrc source ~/_vimrc

autocmd BufNewFile * silent! 0r $HOME/vimfiles/templates/%:e.tpl
" Python Omni completion support
autocmd FileType python set omnifunc=pythoncomplete#Complete
map <F12> <ESC>:Tlist<CR><C-W>h<C-W>s:NERDTree<CR>:set nonu<CR><C-W>l

" Open and close all the three plugins on the same time 
nmap <F8>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
nmap <F10>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
nmap <F7>  :TrinityToggleNERDTree<CR> 

"Window mappings
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let treeExplHidden=1
let treeExplVertical=1
let treeExplDirSort=1

iab ddate =strftime(”%A(%d) %B(%m) %Y”)
iab ttime =strftime(”%H:%M”)
vmap ,mc !boxes -d c-cmt<CR>
nmap ,mc !!boxes -d c-cmt<CR>
vmap ,xc !boxes -d c-cmt -r<CR>
nmap ,xc !!boxes -d c-cmt -r<CR>

"#autocmd guienter * simalt ~x
map ; :

" command line stuff
cno $h e ~/
cno $d e /users/neerajsh/
cno $j e ./
cno $a e /
cno $s e /src
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>



func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

func! OpenNotes()
    colorscheme widower
    set guifont=Consolas:h15:cANSI
endfunc


""""""""""""""""""""""""""""""
" => Fuzzy finder
""""""""""""""""""""""""""""""
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD \<CR>
catch
endtry

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


" Open the notes buffer for quick notes
map <leader>q :e ~/notes/scribble.txt <CR>

" Provide a mapping for fullscreen 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

