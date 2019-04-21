function fish_prompt
  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end

  # Git related stuff start here
  if not set -q __fish_git_prompt_show_informative_status
      set -g __fish_git_prompt_show_informative_status 1
  end

  if not set -q __fish_git_prompt_showupstream
      set -g __fish_git_prompt_showupstream "informative"
  end

  # Git stuff ends here

  set_color cyan
  printf '%s' (whoami)
  set_color normal
  printf '@'

  set_color cyan
  echo -n (prompt_hostname)
  set_color normal
  printf ' in '

  set_color brred
  printf '%s' (prompt_pwd)
  set_color normal
  if __fish_is_git_repository
    printf ' on'
  end

  set_color red
  printf '%s ' (__fish_vcs_prompt)
  set_color normal


  # Line 2
  echo
  printf '🐠 '
  set_color normal
end
