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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
"------------------------ --------------------------------------------------

"--------------------My configuration -------------------------------
set number

syntax on "Para habilitar el color, por defecto no tiene ningun color para language

"colorscheme desert

set tabstop=4 "Para los tabuladores size

set expandtab "Replacing Tabs with White Spaces

set softtabstop=4 "Removing Multiple Spaces on Single Backspace

"So, 4 white spaces for each tab will be removed all together with a single press of the <Backspace> key.

"set cursorline "Highlight the Current Line

"Estos tres van acompados para que funcione perfecto, shiftwidtj ajusta el

"identato de autoindent, en este caso cuatro

set autoindent "Enabling Automatic Indentation,indenta dependiendo del anterior

set smartindent " even better autoindent (e.g. add indent after '{')

set shiftwidth=4 " number of spaces to use for each step of (auto)indent

set mouse=a " enable mouse support (might not work well on Mac OS X), para cambiarme de ventanas

"--------------------- Plugins Vudle--------------------------------------------------
"Instruction : Colacate the plugin an installler, later type PluginInstall
"Para usarlo en fedoraKDE fue con las teclas C-e (Control-e)
Plugin 'mattn/emmet-vim'

"Plugin 'ervandew/supertab'

"Plugin para markdown live
" No me funciona al parecer por npm install -g livedown
Plugin 'shime/vim-livedown'
"the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"

"Este otro plugin no necesita de npm
"Plugin 'JamshedVesuna/vim-markdown-preview'
"Encontre algo mejor Grip, con este solo lo instalas y ya se visuali<a con
"solo poner grip, 

Plugin 'junegunn/goyo.vim'
"Themes
Plugin 'pgavlin/pulumi.vim'
Plugin 'bluz71/vim-nightfly-guicolors'
set termguicolors "Genera una paleta de colores diferente, haciendo como un resaltado
"set background=dark
"Plugin 'levelone/tequila-sunrise.vim'
Plugin 'artanikin/vim-synthwave84'
"colorscheme pulumi
"Configurando el movimiento de los tab para sea mas facil en vez de utilar gt 
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
"Fonts 

colorscheme jellybeans

Plugin 'mhartington/oceanic-next'
"--------------------------------------------------------------------------------
set title  " Muestra el nombre del archivo en la ventana de la terminal
"set nowrap  " No dividir la línea si es muy larga
"set cursorline  " Resalta la línea actual
"set colorcolumn=120  " Muestra la columna límite a 120 caracteres
set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
"set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set termguicolors  " Activa true colors en la terminal
set background=dark  " Fondo del tema: light o dark
colorscheme nightfly

"---------------------------Plugins-----------------------------------------------------  
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'

"Manage VimPlug
"Instalarlo antes de usar, @see:  https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

"-----------------------------Mappings--------------------------------------------------- 
map <C-l> :NERDTreeToggle<CR>
"Entrar NORMAL mode
imap <C-s> <ESC>
"Salir sin guardad
nmap <C-x> :q<CR>
"Salir foruce brute
nmap <C-c> :q!<CR>
"Guardar
nnoremap <C-s> :w<CR>
" Moverse al buffer siguiente con <líder> + l
nnoremap <leader>l :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>


