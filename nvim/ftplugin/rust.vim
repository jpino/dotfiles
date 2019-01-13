
" Linting
let g:ale_linters = {'rust': ['rls'],}
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_set_highlights = 1
let g:ale_set_signs = 1

highlight ALEError cterm=underline
highlight ALEWarning cterm=underline
highlight link ALEErrorSign DiffDelete
let g:ale_sign_error = '⬤'
let g:ale_sign_warning = '▲'
let g:ale_sign_info = 'ℹ'

"Fixing
let g:ale_fixers = {'rust': ['rustfmt'],}
let g:ale_fix_on_save = 1

"Completion



