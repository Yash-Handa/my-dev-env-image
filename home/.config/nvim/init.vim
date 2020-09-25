" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
 
 " Declare the list of plugins.
 Plug 'tpope/vim-sensible'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'junegunn/seoul256.vim'
 Plug 'bling/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'ap/vim-css-color'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'fholgado/minibufexpl.vim'
" Plug 'vim-scripts/syntastic'
 Plug 'tpope/vim-fugitive'
 Plug 'ryanoasis/vim-devicons'
 Plug 'vimwiki/vimwiki'
 Plug 'morhetz/gruvbox'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'ekalinin/Dockerfile.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
 
set number
set numberwidth=5
 
" airline settings
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
 
 
" NERDTree settings
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
" autocmd vimenter * NERDTree
 
" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [ 
		\   {'path': '~/Documents/VimWiki/chronicle.wiki'}
		\ ]
 

" gruvbox settings
colorscheme gruvbox
let g:gruvbox_italic = 1
 
" GitGutter settings
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
 

" vim-go settings
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     

 
" deoplete settings
let g:deoplete#enable_at_startup = 1
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()


" custom key bindings for multi-buffer setup with minibufexpl
nmap <C-s> :MBEbd<CR>
nmap <C-l> :MBEbn<CR>
nmap <C-h> :MBEbp<CR>
 
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg, icon)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .'_icon ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .'_icon '. a:icon .' containedin=NERDTreeFile'
endfunction
 
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515', '##')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515', '##')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515', '##')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515', '##')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515', '##')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515', '##')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515', '##')
call NERDTreeHighlightFile('html', 'DarkRed', 'none', 'DarkRed', '#151515', '##')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515', '##')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515', '##')
call NERDTreeHighlightFile('png', 'cyan', 'none', 'cyan', '#151515', '##')
call NERDTreeHighlightFile('txt', 'blue', 'none', 'blue', '#151515', '##')
call NERDTreeHighlightFile('ico', 'yellow', 'none', 'yellow', '#151515', '##')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515', '##')
call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515', '##')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515', '##')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515', '##')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515', '##')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515', '##')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515', '##')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515', '##')
 
" custom key bindings :)
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
 
" imap <Up>    <Nop>
" imap <Down>  <Nop>
" imap <Left>  <Nop>
" imap <Right> <Nop>
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
 
inoremap <S-Tab> <Esc>
onoremap <S-Tab> <Esc>
 
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
