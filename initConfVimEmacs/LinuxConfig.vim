"---------------Vudle-----------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
"Plugins Vudle

Plugin 'jiangmiao/auto-pairs'

Plugin 'preservim/nerdtree'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-commentary' 

"Plugin 'ap/vim-css-color'

"Plugin 'octol/vim-cpp-enhanced-highlight'

"Live view html,css, javascript (only linux) @see:  https://github.com/turbio/bracey.vim
":Bracey #Encender servidor, :BraceyStop  #Apagar
"Plugin 'turbio/bracey.vim'

"Instruction : Colacate the plugin an installler, later type PluginInstall
"Para usarlo en fedoraKDE fue con las teclas C-e (Control-e)
"Plugin 'mattn/emmet-vim'

"Plugin 'ervandew/supertab'

"Plugin 'junegunn/goyo.vim' "Cambia la aparariencia mas comoda para escribir en markdown.

"Plugin para markdown live
" No me funciona al parecer por npm install -g livedown
"Plugin 'shime/vim-livedown'
"the browser to use, can also be firefox, chrome or other, depending on your executable
"let g:livedown_browser = "firefox"

"Este otro plugin no necesita de npm
"Plugin 'JamshedVesuna/vim-markdown-preview'
"Encontre algo mejor Grip, con este solo lo instalas y ya se visuali<a con
"solo poner grip, 

"Themes
"Plugin 'pgavlin/pulumi.vim'
"Plugin 'bluz71/vim-nightfly-guicolors'
"Plugin 'levelone/tequila-sunrise.vim'
"Plugin 'artanikin/vim-synthwave84'
"Plugin 'mhartington/oceanic-next'
"colorscheme jellybeans
"colorscheme nightfly
"colorscheme desert
"colorscheme pulumi


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------Manage-VimPlug--------------------------------------------------------------

"Manage VimPlug
"Instalarlo antes de usar, @see:  https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Coc servers

"coc-clangd  # C y C++ language

"coc-java #Instalar jdt version 57 para el error que podria causar el
"servidor, ver issues de la su pagina de github, solo es descargar jdt
"descomprimir, buscar la carpeta del jdt y borrar archivos y poner los
"descargados 

"coc-html #Te recomienda etiquetas y descripcion una vez que hacer tag apertura <label...
"Initialize plugin system
"coc-css autocompletado y ya no se necesita preview-color,viene integrado
"
"
Plug 'mattn/emmet-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
"Plug 'haishanh/night-owl.vim'
"JavaScript support
Plug 'pangloss/vim-javascript'    
"Java support
Plug 'uiiaoo/java-syntax.vim' 
Plug 'franbach/miramare'

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-python/python-syntax'
"Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'artanikin/vim-synthwave84'
Plug 'joshdick/onedark.vim'

call plug#end()

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

set title  " Muestra el nombre del archivo en la ventana de la terminal

set nowrap  " No dividir la línea si es muy larga

"set cursorline  " Resalta la línea actual

" set colorcolumn=80  " Muestra la columna límite a 80 caracteres

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda

set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

"set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set background=dark  " Fondo del tema: light o dark

set termguicolors "Activa true colors en la terminal,Genera una paleta de colores diferente, haciendo como un resaltado

"-----------------------------Mappings--------------------------------------------------- 
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
"Guardar con <líder> + s
"nnoremap <leader>s :w<CR> 
"nnoremap <leader>x :q!<CR>
nnoremap <leader>c :q!<CR>

" " Usar <líder> + y para copiar al portapapeles
" vnoremap <leader>y "+y
" nnoremap <leader>y "+y

" " Usar <líder> + d para cortar al portapapeles
" vnoremap <leader>d "+d
" nnoremap <leader>d "+d

" " Usar <líder> + p para pegar desde el portapapeles
" nnoremap <leader>p "+p
" vnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>P "+P

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
"noremap <Leader>y "*y 

"-----------------------Shortcut para compilar/ejecutar--------------------------------------- 
" % filename with extension
" %< sin extension
"Compilar en java, teclas F9 y F10
"map <F9> :w <CR> :!clear <CR> :!javac % <CR>
"Ejecutar
"map <F10> :!clear <CR> :!java %< <CR>

"--------------------------ConfigurationPlugins--------------------------------------

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

"----------------------
"Emmet 
let g:user_emmet_install_global = 0
autocmd FileType html,php,css EmmetInstall
let g:user_emmet_leader_key='<C-E>'

colorscheme moonfly
let g:python_highlight_all = 1
"Con la extension java-syntax y el teme moonfly
"hi Structure term=bold ctermfg=Cyan guifg=#EBD096 gui=bold 

"Para modificar las classes de java a color amarillo
"http://vimdoc.sourceforge.net/htmldoc/syntax.html#:highlight
"https://stackoverflow.com/questions/1890103/change-syntax-color-in-vim
"https://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
"https://github.com/haishanh/night-owl.vim
"https://superuser.com/questions/627636/better-syntax-highlighting-for-java-in-vim
"https://phoenixnap.com/kb/vim-color-schemes
"https://medium.com/@joao.paulo.silvasouza/change-your-terminals-background-color-dynamically-using-escape-sequences-aba6e5ed2b29
"https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax/

"Para el background, para encontrar la respues tuve que mejor buscar en la
"carpeta de scheme de moonfly y ver como funcionaba y buscar las
"coninicidencias que se utlizaban del color en el archivo y cuales commandos
"utlizaba
"guibg cambia el color del backgraund a oscuro 
"guifg cambia el color de los aperturtas de los paretensis y signos

"highlight Normal ctermbg=232 ctermfg=251 guibg=#1E1E1E guifg=#D4D4D4
"---------------------------------
"colorscheme synthwave84
colorscheme onedark