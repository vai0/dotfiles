if exists('g:vscode')
    " VSCode extension
    nnoremap J 5j<CR>
    nnoremap K 5k<CR>
    vnoremap J 5j<CR>
    vnoremap K 5k<CR>

    call plug#begin('~/.vim/plugged')
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    call plug#end()
else
    " ordinary Neovim

    " Sanity
    set nomodeline

    " Enable file type detection
    filetype plugin indent on

    syntax on

    " Basics
    set showcmd         " Show things like partially-entered key sequences
    set number          " Show line numbers
    set relativenumber  " Show relative line numbers
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
    
    
    " TODO: setup all the necessary coc plugins and settings
    "   - autoclosetags
    "   - fix syntax highlighting
    "   - autopairs
    "   - css completion
    
    
    " Plugins
    call plug#begin('~/.vim/plugged')
    
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'jparise/vim-graphql'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
    " Yay
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    
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
    
    " coc config
    let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-yank'
      \ ]
    
    " TextEdit might fail if hidden is not set.
    set hidden
    
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup
    
    " Give more space for displaying messages.
    set cmdheight=2
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=400
    
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
    
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
    
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    let g:coc_start_at_startup = 1
    
    let mapleader = " "
    
    nnoremap J 5j<CR>
    nnoremap K 5k<CR>
    vnoremap J 5j<CR>
    vnoremap K 5k<CR>
    
    inoremap jk <esc>
    
    nnoremap <leader>q :q<CR>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>h :wincmd h<CR>
    nnoremap <leader>j :wincmd j<CR>
    nnoremap <leader>k :wincmd k<CR>
    nnoremap <leader>l :wincmd l<CR>
    nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
    nnoremap <silent> <Leader>= :vertical resize +5<CR>
    nnoremap <silent> <Leader>- :vertical resize -5<CR>
    
    nnoremap <leader>ps :Rg<SPACE>
    nnoremap <C-p> :Files<CR>
    nnoremap <Leader>pf :Files<CR>
    nnoremap <leader>de :!rm "%:p"<CR>
    nnoremap <leader>/ :nohl<CR>
    nnoremap <leader>nt :NERDTreeToggle<CR>
    
    " Fugitive
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gf :diffget //2<CR>
    nnoremap <leader>gj :diffget //3<CR>
    
    " GoTo code navigation.
    nmap <leader>gd <Plug>(coc-definition)
    nmap <leader>gy <Plug>(coc-type-definition)
    nmap <leader>gi <Plug>(coc-implementation)
    nmap <leader>gr <Plug>(coc-references)
    nmap <leader>rr <Plug>(coc-rename)
    nmap <leader>g[ <Plug>(coc-diagnostic-prev)
    nmap <leader>g] <Plug>(coc-diagnostic-next)
    nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
    nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
    nnoremap <leader>cr :CocRestart
endif
