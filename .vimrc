" Map the leader key to a spacebar.
let mapleader = "\<space>"


" Indentation Lines Making it easy to find the start and end of a code block
set listchars=tab:\|\ 
set list


" Prettier .......................................................... 
nmap <Leader>p <Plug>(Prettier)


"..........................



" For Horizontal and Vertical Lines on the Cursor to make it easy to find it.
" set cursorcolumn
" set cursorline


" Map arrow keys nothing so I can get used to hjkl-style movement.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" For Indenting Visual Blocks
vmap > >gv
vmap < <gv


" To Use Spacebar + h/j/k/l to navigate between split screens
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h


" Remap spacebar+r to redo
nnoremap <leader>r <C-r>


" Remap :term to <leader>t it allows me to use spacebar+r to open terminal in
" vim
nnoremap <leader>t :term<CR>


" This snippet ensures that vim-plug, a popular Vim plugin manager, is installed if it's not already. If vim-plug is newly installed, it will also automatically install the plugins specified in your configuration file the next time you start Vim.

"Install vim-plug if it's not already installed.

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.github.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" It folds the code when a file is opened which makes it easy to navigate
" between large files
set foldmethod=indent


" This ensures that Vim correctly handles files containing UTF-8 encoded text.
set encoding=UTF-8


" For Syntax Highlighting
syntax on 


" Following Two lines will make sure to highligh the exact matching values and
" all the values ignoring case if the exact match is not found
set ignorecase
set smartcase


" For Relative Numbering
set number relativenumber 


" Colorscheme is set to two2tango, I have downloaded a plugin that allows to
" use :SCROLL to navigate through different colorschemes by arrow keys
" colorscheme two2tango


" Configuration of Tabs bar ........................................ 
" Set the background of tabs bar
hi TabLineFill ctermfg=black ctermbg=black 
" Non-Active Tabs Foreground and Background Color
hi TabLine ctermfg=white ctermbg=black 
" Acitve Tab Foreground_Color and Background_Color
hi TabLineSel ctermfg=black ctermbg=white 
" ..................................................................


" To Highlight Searched Words after pressing enter
set hlsearch  


" To highlight letters as you type them 
set incsearch 


" When you start a new line, Vim will automatically copy the indentation of the previous line, which helps in maintaining the structure and readability of your code.
set autoindent 


" The wildmenu provides suggestions as you type commands or filenames in the command-line mode.
" shows a full list of matches and then allow cycling through them with
" Tab/shift+tab or ctrl+n/ctrl+p
" For Example Type :color <tab>
" :help wildmode
set wildmode=list:longest,full


" It makes sure to open vertical split window on the right and horizontal
" split window below
set splitright splitbelow


" It allows to copy and paste between vim and other programs
set clipboard=unnamedplus
" set clipboard=unnamed

" let g:clipboard = {
"     \   'copy': {
"     \       '+': ['wl-copy', '--trim-newline'],
"     \       '*': ['wl-copy', '--trim-newline'],
"     \   },
"     \   'paste': {
"     \       '+': ['wl-paste', '--no-newline'],
"     \       '*': ['wl-paste', '--no-newline'],
"     \   },
"     \ }



" Remaped Esc to exit insert mode  
inoremap jh <Esc> 


"................................................... Emmet .........................................................................

" To let emmet work only in html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" Redefined emmet boiler plate key
let g:user_emmet_leader_key=','



let g:user_emmet_mode='n' " so the emmet words only in normal mode, I don't want emmet to enter text while i am writing ,, for any other reason than web development


" Included some extra meta tags in the head section
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\n"
\              ."\t<script type=\"text/javascript\" src=\"main.js\"></script>\n"	
\              ."\t<link rel=\"icon\" href=\"\" type=\"image/x-icon\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}


".................................................................................................................................


" Map NERDTreeToggle to CTRL+o
map <C-o> :NERDTreeToggle<CR>


" To Use CTRL+L to remove highlights of content
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <silent> <C-L> :nohlsearch<CR>:redraw!<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Show Number of linex with the file
let g:NERDTreeFileLines = 1
" To avoid redrawing screen each time a macro is used
set lazyredraw
" Remap :w to Ctrl+s for rapid saving
noremap <C-s> :w<CR>
" Shortcut for saving and quitting with :wq! is to use leader or '\'+sq
noremap <leader>sq :wq!<CR>
" Shortcut for quitting without saving with :q! is to use '\'+ qq
noremap <leader>qq :q!<CR>


" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>


" For clipboard support in vim/ copy,paste btw vim and other programs 
" First check if your vim supports clipboard
" vim --version | grep clipboard
" If you see '-clipboard' that means your vim does not have support
" Now try to install package from your package manager to see if that
" supports clipboard otherwise one of the options is to compile it 
" from source



call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. call plug#begin('~/.vim/plugged')
"   - Avoid using standard Vim directory names like 'plugin'


" Make sure you use single quotes


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" To delete or add a bracket in pair
Plug 'jiangmiao/auto-pairs'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Include emmet to your vim
Plug 'mattn/emmet-vim'

" To Include Icons in NerdTree
Plug 'ryanoasis/vim-devicons'
" Still need to know how to use it!
Plug 'terryma/vim-smooth-scroll'
" To show color with its hex value
Plug 'ap/vim-css-color'
" To Include Colors to DevIcons in nerdtree
Plug 'lambdalisue/glyph-palette.vim'
" To Add Comments to your code
Plug 'tpope/vim-commentary'



"To add a Bar at the bottom of file providing useful information
Plug 'vim-airline/vim-airline'



" Helpful for browsing through large files
Plug 'preservim/tagbar'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Autoclose HTML tags
Plug 'alvan/vim-closetag' 
" To Delete or change surrounding tags or signs like "" or '' in html etc 
Plug 'tpope/vim-surround'


" Prettier .......................................................
" This configuration installs vim-prettier and ensures dependencies 
" are installed. The plugin will only load for the specified 
" file types.  
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install --frozen-lockfile --production',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
"   'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

   
" You will have to run this command one time to install prettier 
" globally
" npm install -g prettier


" vim-prettier enabled for all file formats
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" ................................................................


" Scroll Through Different Color Schemes in vim by using
" arrow keys (:SCROLL)
Plug 'vim-scripts/ScrollColors'


" Similar to vimium on browser
Plug 'easymotion/vim-easymotion'


" let g:plug_timeout = 300 " Increase vim-plug timeout
" for YouCompleteMe.
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" To Track my Programming Time
Plug 'wakatime/vim-wakatime'
" Language Server Protocol for Vim
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'





" Conquer of Completion(COC)...........................  
 
" For Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" For Tailwind Intellisense
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
".......................................................


" Vim Plugin for GitHub/Git
Plug 'tpope/vim-fugitive'


" Liver Server For Vim
Plug 'https://github.com/wolandark/vim-live-server.git'

call plug#end()



" To set a vertical line of grey color to format code for better
" formatting and understanding
" set colorcolumn=72
" highlight ColorColumn ctermbg=grey


" This results in the character being highlighted in green when the 
" line goes over the 80-character maximum.
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)


" DevIcons in the nerdtree gets colorful
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
