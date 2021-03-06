"Puedes modificar tu init file en dos lados de manera local o manera global
"Si lo haces de manera local sobreescribiras los cambios que ya vinene, es decir,
"no pederas la comfiguracion actual que tines con vim, ya que cuando los
"isntalas viene ya configurardo con algunos cambios por defectos
"Dependediendo tu distribucion se puede encontrar en /etc/vimrc esta para
"distribucion fedora, preguntar en foros sobre donde puede estar
"AHora si lo haces de manera global, se perdera toda tu configuracion y lo
"tienes que hacer desde cero, debes crear tu archibo .vimrc en home ~ (local) o  /etc/vimrc (global)
"Para regresar a la global solo tinees que eliminar la local , ahora el
"sistema reconocera la global como tu archivo vimrc
"Este sera una configuacion local, asi que cree este archivo en home y voy
"activar todas las funcionalidades que yo requiera
"@reference: https://linuxhint.com/configure_vim_vimrc/
"https://chrisyeh96.github.io/2017/12/18/vimrc.html
"https://dougblack.io/words/a-good-vimrc.html
"https://gist.github.com/simonista/8703722
"Guia de commands
"@see: https://www.busindre.com/configuracion_minima_obligatoria_para_vim_.vimrc


set number
syntax on "Para habilitar el color, por defecto no tiene ningun color para language
colorscheme desert
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
