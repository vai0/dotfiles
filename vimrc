" Sanity
set nomodeline

" Enable file type detection
filetype plugin indent on

syntax on

" Basics
set showcmd         " Show things like partially-entered key sequences
set number          " Show line numbers
set showmode        " Show status of insert/visual mode in command line
set showmatch       " Highlight brace/paren/etc. which matches one under cursor
set laststatus=2    " Always show statusline
set noerrorbells    " No sound effects

" Indentation
set expandtab       " Use spaces for indentation
set autoindent      " Indent new lines, etc. automagically
set smartindent     " Also indent... automagically. Not sure how its different than autoindent
set tabstop=4       " Display tabs as four spaces wide
set softtabstop=4   " Treat tabs as four spaces for editing (backspace whole expanded tabs, etc.)
set shiftwidth=4    " Treat caret indentation as four spaces

" Searching
set ignorecase      " Make searches case-insensitive...
set smartcase       " ...except when they explicitly contain capitals
set incsearch       " Show matches while typing search patterns
set hlsearch        " Highlight all matches for a search

" Layout
set nowrap          " Let long lines go off screen rather than wrapping to the next line
set colorcolumn=100 " Highlight column 100 (to indicate appropriate line length)
set signcolumn=yes  " Show the sign column even when it is empty
set list            " Show non-printing characters
set listchars=tab:>-,extends:>,precedes:<,trail:X
set scrolloff=5     " show lines above and below cursor (when possible)

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'alvan/vim-closetag'

" Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'haishanh/night-owl.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'tomasiser/vim-code-dark'
Plug 'gruvbox-community/gruvbox'

call plug#end()

colorscheme gruvbox

" enable 24bit true color
if (has("termguicolors"))
    set termguicolors
endif

" Let ripgrep search from the git root of your project, and also have it
" respect the project's .gitignore
if executable('rg')
    let g:rg_derive_root='true'
endif

" TODO: use fzf, use wildignore to explicitly ignore node_modules, and all the
" crap in freya
"
" Exclude these directories from file search
" This only searches for directories tracked by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" Open files in a new vertical split
let g:netrw_browse_split = 2
let g:netrw_banner = 0

" Set width of the directory explorer
let g:netrw_winsize = 25

let g:vim_jsx_pretty_colorful_config = 1

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.html,*.js,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'html,js,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1


" Mappings
let mapleader = " "

nnoremap J 5j<CR>
nnoremap K 5k<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <leader>/ :nohl<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>

