vim.cmd(
  [[
    call gina#custom#command#alias('branch', 'br')
    call gina#custom#command#option('br', '-v', 'v')
    call gina#custom#command#option(
      \ '/\%(log\|reflog\)',
      \ '--opener', 'vsplit'
      \)
    call gina#custom#command#option(
      \ 'log', '--group', 'log-viewer'
      \)
    call gina#custom#command#option(
      \ 'reflog', '--group', 'reflog-viewer'
      \)
    call gina#custom#command#option(
      \ 'diff', '--group', 'diff'
      \)
    call gina#custom#command#option(
      \ 'commit', '-v|--verbose'
      \)
    call gina#custom#mapping#nmap(
      \ 'status', '<C-c><C-c>',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
    call gina#custom#mapping#nmap(
      \ 'commit', '<C-s><C-s>',
      \ ':<C-u>Gina status<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
    call gina#custom#execute(
      \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
      \ 'setlocal winfixheight',
      \)
    call gina#custom#mapping#nmap(
      \ 'status', 'dj',
      \ 'j:<C-u>call gina#action#call("diff:preview:top")<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
    call gina#custom#mapping#nmap(
      \ 'status', 'dk',
      \ 'k:<C-u>call gina#action#call("diff:preview:top")<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
  ]], false
)
