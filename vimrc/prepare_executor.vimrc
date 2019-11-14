call system('pipenv')

if v:shell_error == 0
  let g:python_host_prog = system('echo -n $(pipenv run which python2)')
  let g:python3_host_prog = system('echo -n $(pipenv run which python3)')
else
  let g:python_host_prog = system('echo -n $(which python2)')
  let g:python3_host_prog = system('echo -n $(which python3)')
endif
