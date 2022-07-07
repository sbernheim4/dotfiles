" ########################################################################
" ######## Ale
" ########################################################################
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'] }
let g:ale_fixers = { 'javascript': [ 'eslint' ], 'typescript': [ 'eslint' ] }
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 0
