set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call plug#begin()

" let Vundle manage Vundle, required
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-distinguished'
Plug 'tomasr/molokai'
Plug 'vim-scripts/peaksea'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'will133/vim-dirdiff'
Plug 'fholgado/minibufexpl.vim'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-scripts/sessionman.vim'
Plug 'tpope/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jpalardy/vim-slime'

Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:set t_Co=256

let g:tagbar_left=1
let g:NERDTree_title="[NERD Tree]"
let g:TagBar_title="[TagBar]"
"let g:winManagerWindowLayout='NERDTree|TagList'
"let g:winManagerWindowLayout='NERDTree|TagBar'
let g:winManagerWindowLayout='NERDTree,TagBar'
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'
function! NERDTree_Start()
	exec 'q'
	exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
	return 1
endfunction

function! TagBar_Start()
	exec 'q'
	exec 'TagbarOpen'
endfunction

function! TagBar_IsValid()
	return 0
endfunction
let g:tagbar_vertical = 100

"nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>endif <CR><CR>

"colorscheme distinguished
colorscheme molokai


syntax enable
syntax on
"set showmatch
set number
set numberwidth=1
set hlsearch
set laststatus=2
set ts=4
set sw=4
set expandtab
set ignorecase
set fileformat=unix
set list
set listchars=tab:>-,trail:-

set nocp

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" key map for session
:nmap sl :SessionList<CR>
:nmap ss :SessionSave<CR>
:nmap sc :SessionClose<CR>

:map <F7> <Esc>A("%s,%d \n", __FUNCTION__, __LINE__);<Esc>bbbbbbb
:map <F8> <Esc>O#!/usr/bin/env python<CR>#<CR># -*- coding: utf-8 -*-<CR><Esc>
:map <F9> <Esc>O'''<CR>version: 0.1<CR>'''<Esc>
:map <C-f>d <Esc>0dwp0<Esc>:w<CR>
:map <C-f>u <Esc>0xwp0<Esc>:w<CR>

" key map for cscope
:nmap <C-f>s :cs find s <C-R><C-W><CR>
:nmap <C-f>g :cs find g <C-R><C-W><CR>
:nmap <C-f>c :cs find c <C-R><C-W><CR>
:nmap <C-f>t :cs find t <C-R><C-W><CR>

:set ruler
:set t_Co=256
:highlight ColorColumn ctermbg=239
:set colorcolumn=120

"set cursorline

set noswapfile

let g:airline_powerline_fonts = 1
"set laststatus=2
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme = "molokai"
let g:airline_theme = "distinguished"
"let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0

:set mouse=a
:set ttymouse=xterm2
:set backspace=indent,eol,start

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:startify_custom_header = [
            \ '                                                                                                                                  ',
            \ '                                                          ,r7S2222SXr;:,                                                          ',
            \ '                                                    .ra88a2XX7XX2a8B@@MMMMMW2                                                     ',
            \ '                                                 ,SWMMMMB8ZZSSXrrrrXa80X:i;S02iri                                                 ',
            \ '                                               XWM@S;.. ,:;72ZBB@WW@M@@0  7Z0WMMMM0i                                              ',
            \ '                                             S@MM@@M@W082Xr;:i;X20a;i, X0@WWW@000BWM0.                                            ',
            \ '                                           ,WMBXrii:;rX280@MMWWWWB@0  2BBWM87.iB@B00@M7                                           ',
            \ '                                          rMW082X;:.       :S0ZaSa2;rWWBWS   aM0;.0W0BM2                                          ',
            \ '                                         rMB8880WWMMMMMMM@@BBB0ar  ;MBBZ, rWMS   8MXaB@MX                                         ',
            \ '                                        .M08Z80W@M@@BB000BBWWW@MM; MWZZaZWMS   ZB7  W@;ZM                                         ',
            \ '                                        0W0ZB@@ar.                 .,X00B0a:SWMi  SM2  0MX                                        ',
            \ '                                       .MB80@X             ,,,     .BM@0a00W@0  aMW: XMMM:                                        ',
            \ '                                       :M80W7      ir;r, .7;rrr    WM8;;BB@BZZ0MMB8a@MZ:                                          ',
            \ '                                       ,MB0W       7;;;7,.;;i;r,       BW8r,WMW2  :7   7BM,                                       ',
            \ '                                        @@MZ ;rr;: ,ri;ir:;;;i;;        ,   i     iMM.MMBM2                                       ',
            \ '                                        ;MM. r;;;ri,i;;;i; ir;i7,   ,@MMMMM7 aMMMM @M;XiM8                                        ',
            \ '                                          .. .;;;i;;i.;r;;. :r;ir.  iW2  XMM,MW :MaMM   r                                         ',
            \ '                                           Xr;i,iri;;, ,;7r  .r;;7,     7MM  WMWMM   ,ir;i                                        ',
            \ '                                           .7;r. .;rrr,  i7r   r;iri  aMMM:iWW     :;r7;,                                         ',
            \ '                                             rrri  .;rri  ,7r:  ;;;r;.r0W@MM@;  .;;rri.                                           ',
            \ '                                              :r7r:  .;rr.  rr;.,;ii;;:       i;r;7;.                                             ',
            \ '                                                i777:  :;ri.,;iri;iiiiiiiii;;;;;;r,                                               ',
            \ '                                                  ,;77;:;i;;;i;iiiiiiiiiiiiiii;;;                                                 ',
            \ '                                                     irriii;iiiiiii;iiiiiiiii;r;                                                  ',
            \ '                                                       ,;;iiiiiiiiiiiiiiiiii;;;                                                   ',
            \ '                                                       i ,;;iiiiiiiii;iiiii;;r                                                    ',
            \ '                                                       ,B  iriiiiiiiii;iiiii7,                                                    ',
            \ '                                                        XM. ,;i;iiiiiiiiiii;;                                                     ',
            \ '                                                         MMr  r;;iiiiiiiiii;i                                                     ',
            \ '                                                         8@MS  ri;iiiiiiiiir.                                                     ',
            \ '                                                         ZW0MZ  ;;;i;iiiii;;,                                                     ',
            \ '                                                         BB88M0  ;;iiii;iiir:                                                     ',
            \ '                                                        i@0Z88@B  ;;;iiiii;;;                                                     ',
            \ '                                                        BB88Z88@B  ;;;iiiiiir,                                                    ',
            \ '                                                       ZM88Z8Z88@B  :;;iiiii;;.                                                   ',
            \ '                                                    ;.:M08Z8Z8Z88WB   ;ri;iii;r:                                                  ',
            \ '                                                  .0Z 8W8Z8Z8Z8Z88W@r  .;;;i;i;r;                                                 ',
            \ '                                                iZMM  @B8ZZ8Z8Z8Z88BM0:   .ii;;;rri:                                              ',
            \ '                                          i;XS0WMWW0  MB8Z8Z8Z8Z8Z8Z0BMBS.      ..:::,                                            ',
            \ '                                          WMMM@W000W  XMB088Z8Z8Z8Z8Z88B@MW027;i,::ir28Bi                                         ',
            \ '                                           .X8@@M@@MW  ;WM@BB008080808000BWWMMMMMMMMMW2.                                          ',
            \ '                                               .iX20@Ma,.raBWM@MMMMM@M@MMM@@WW082Xi.                                              ',
            \ '                                                                                                                                  ',
\]

" config moin
"au! BufRead,BufNewFile *.moin
"    \ if getline(1) =~ '^@@ Syntax: 1\.5$' | setf moin1_5
"    \ | else | setf moin1_6 | endif

nmap <leader>fb :%!xxd -g1 <CR> :%s/^.\{9\}//g <CR> :%s/.\{18\}$//g <CR> :%s/0a *\%$//g<CR> :g/^$/d<CR> :%s/^/0x/g<CR>  :%s/ /,0x/g<CR> :1,$-1s/$/,/g<CR>

"
let g:rbpt_colorpairs = [
    \ ['032',       'RoyalBlue3'],
    \ ['040',       'SeaGreen3'],
    \ ['056',       'DarkOrchid3'],
    \ ['072',       'firebrick3'],
    \ ['096',       'RoyalBlue3'],
    \ ['112',       'SeaGreen3'],
    \ ['128',       'DarkOrchid3'],
    \ ['144',       'firebrick3'],
    \ ['152',       'RoyalBlue3'],
    \ ['136',       'SeaGreen3'],
    \ ['120',       'DarkOrchid3'],
    \ ['104',       'firebrick3'],
    \ ['080',       'RoyalBlue3'],
    \ ['064',       'SeaGreen3'],
    \ ['048',       'DarkOrchid3'],
    \ ['024',       'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" MiniBufExpl  config
:let g:did_minibufexplorer_syntax_inits = 1
hi MBENormal               ctermfg=223  guifg=#808080 guibg=fg
hi MBEChanged              ctermfg=202 guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        ctermfg=202 guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       ctermfg=215  guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  ctermfg=202 guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged ctermfg=228 guifg=#F1266F guibg=fg

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l


" NERDTree config
noremap <leader>nf :NERDTreeFind<CR>

" vim-bookmarks config
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
highlight BookmarkSign ctermbg=166 ctermfg=89
highlight BookmarkAnnotationSign ctermbg=30  ctermfg=89
highlight BookmarkLine ctermbg=166 ctermfg=NONE
highlight BookmarkAnnotationLine ctermbg=30  ctermfg=NONE

" Disable beeping
set noerrorbells
set vb t_vb=

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

set encoding=utf-8


"slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1



" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.

"if has('patch8.1.1068')
"  " Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
