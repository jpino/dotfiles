" Deoplete configuration
let g:deoplete#enable_at_startup = 1

" LangaugeClient-neovim
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'] }
let g:LanguageClient_autoStart = 0

"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F5> :LanguageClientStart<CR>
nnoremap <silent> <F6> :LanguageClientStop<CR>
nnoremap <silent> <F7> :call LanguageClient_textDocument_formatting()<CR>

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=no
augroup END

let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
    \     "name": "Error",
    \     "texthl": "ALEError",
    \     "signText": "●",
    \     "signTexthl": "ALEErrorSign",
    \ },
    \ 2: {
    \     "name": "Warning",
    \     "texthl": "ALEWarning",
    \     "signText": "▲",
    \     "signTexthl": "ALEWarningSign",
    \ },
    \ 3: {
    \     "name": "Information",
    \     "texthl": "ALEInfo",
    \     "signText": "◼",
    \     "signTexthl": "ALEInfoSign",
    \ },
    \ 4: {
    \     "name": "Hint",
    \     "texthl": "ALEInfo",
    \     "signText": "◼",
    \     "signTexthl": "ALEInfoSign",
    \ },
\}

highlight ALEErrorSign ctermfg=001 ctermbg=018
highlight ALEWarningSign ctermfg=003 ctermbg=018
highlight ALEInfo ctermfg=004 ctermbg=018
