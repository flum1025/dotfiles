let g:ale_enabled = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_tslint_executable = 'eslint'

let g:ale_go_gometalinter_options = '--fast'

let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint', 'stylelint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop'],
\   'go': ['gofmt', 'goimports'],
\   'python': ['autopep8', 'black', 'isort']
\}

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint', 'stylelint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop'],
\   'go': ['gometalinter'],
\   'python': ['flake8']
\}

let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified'],
  \    ['ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'ALEGetStatusLine'
  \}
\ }
