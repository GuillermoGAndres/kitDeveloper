"  ____ _____ 
" |  _ \_   _|  Derek Taylor (DistroTube)
" | | | || |    http://www.youtube.com/c/DistroTube
" | |_| || |    http://www.gitlab.com/dwt1/
" |____/ |_|
"        
" A customized init.vim for neovim (https://neovim.io/)     
" https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.vim


set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins

"-------------Manage-VimPlug--------------------------------------------------------------

call plug#begin('~/.vim/plugged')
"Instalarlo antes de usar, @see:  https://github.com/junegunn/vim-plug

Plug 'neoclide/coc.nvim', {'branch': 'release'} "Coc servers
"coc-clangd  # C y C++ language
"coc-java #Instalar jdt version 57 para el error que podria causar el
"servidor, ver issues de la su pagina de github, solo es descargar jdt
"descomprimir, buscar la carpeta del jdt y borrar archivos y poner los
"descargados 
"coc-html #Te recomienda etiquetas y descripcion una vez que hacer tag apertura <label...
"Initialize plugin system
"coc-css autocompletado y ya no se necesita preview-color,viene integrado
"Plug 'ap/vim-css-color'                            " Color previews for CSS
"Plug 'gmarik/Vundle.vim'                           " Vundle

"{{ The Basics }}
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
"{{ File management }}
    Plug 'vifm/vifm.vim'                               " Vifm
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks
"{{ Syntax Highlighting and Colors }}
"    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting 
"    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting resalta indentacion
    Plug 'vim-python/python-syntax'                    " Python highlighting
"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

"{{ Development } }
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"--------------------------Configuration Coc plugin--------------------------------------

"Configuracion para coc, para los pop-ups 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"Para puedas visualizar las opciones en cualquier lugar de la palabra
"Control-space
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

"Navegar opciones  hacia adelante y hacia atras con Tab y Shift Tab.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Que la primera ocurrecia de pop-up() sea selacionada automaticamente al
"presionar enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"--------------------------------------------------------------------------

" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
"set number relativenumber       " Display line numbers
set number
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------My configuration -------------------------------------------------
"You can toggle relative numbering on and off using:
":set rnu    " toggle relative numbering on
":set rnu!   " toggle relative numbering off

"set number relativenumber
set number                     " Show current line number

"set relativenumber             " Show relative line numbers

set encoding=utf-8 " Codifica los caractares para ser mostrados como los acentos o ñ

syntax on "Para habilitar el color, por defecto no tiene ningun color para language

set tabstop=4 "Para los tabuladores size

set expandtab "Replacing Tabs with White Spaces

set softtabstop=4 "Removing Multiple Spaces on Single Backspace

"So, 4 white spaces for each tab will be removed all together with a single press of the <Backspace> key.

"Estos tres van acompados para que funcione perfecto, shiftwidtj ajusta el

"identato de autoindent, en este caso cuatro

set autoindent "Enabling Automatic Indentation,indenta dependiendo del anterior

set smartindent " even better autoindent (e.g. add indent after '{')

set shiftwidth=4 " number of spaces to use for each step of (auto)indent

set shiftround

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set mouse=a " enable mouse support (might not work well on Mac OS X), para cambiarme de ventanas

"set title  " Muestra el nombre del archivo en la ventana de la terminal

set nowrap  " No dividir la línea si es muy larga

"set cursorline  " Resalta la línea actual

" set colorcolumn=80  " Muestra la columna límite a 80 caracteres

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda

set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

"set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

"set background=dark  " Fondo del tema: light o dark

"set termguicolors "Activa true colors en la terminal,Genera una paleta de colores diferente, haciendo como un resaltado

"-----------------------------Mappings-------------------------------------------------- 
map <C-l> :NERDTreeToggle<CR>
"map <C-b> :NERDTreeToggle<CR>
"Entrar NORMAL mode
imap <C-s> <ESC>
"imap <C-x> <ESC>
"Guardar
nnoremap <C-s> :w<CR> 
"nnoremap <C-x> :w<CR>
"Salir sin guardad
"nmap <C-x> :q<CR>
nmap <C-c> :q<CR>
"nmap <C-x><C-c> :q!<CR>
"Salir foruce brute
"nmap <C-c> :q!<CR>

let g:mapleader = ' '  " Definir espacio como la tecla líder
" https://stsewd.dev/es/posts/neovim-installation-configuration/
"Guardar con <líder> + s
"nnoremap <leader>s :w<CR> 
"nnoremap <leader>x :q!<CR>
nnoremap <leader>c :q!<CR>

" Moverse entre buffers
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

"Configurando el movimiento de los tab para sea mas facil en vez de utilar gt 
"nnoremap <C-Left> :tabprevious<CR>                                                                            
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <C-j> :tabprevious<CR>                                                                            
"nnoremap <C-k> :tabnext<CR>

"Definir la letra leader

" Moverse al buffer siguiente con <líder> + l
"nnoremap <leader>l :bnext<CR>
" Moverse al buffer anterior con <líder> + j
"nnoremap <leader>j :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
"nnoremap <leader>q :bdelete<CR>
"noremap <Leader>y "*y -

" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
":imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
"highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
"highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
"highlight Statement        ctermfg=2    ctermbg=none    cterm=none
"highlight Directory        ctermfg=4    ctermbg=none    cterm=none
"highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
"highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
"highlight NERDTreeClosable ctermfg=2
"highlight NERDTreeOpenable ctermfg=8
"highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
"highlight Constant         ctermfg=12   ctermbg=none    cterm=none
"highlight Special          ctermfg=4    ctermbg=none    cterm=none
"highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
"highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
"highlight String           ctermfg=12   ctermbg=none    cterm=none
"highlight Number           ctermfg=1    ctermbg=none    cterm=none
"highlight Function         ctermfg=1    ctermbg=none    cterm=none

" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight Spellare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://fish<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

