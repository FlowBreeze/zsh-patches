if type -f - -ftb-fzf >/dev/null; then
  unfunction - -ftb-fzf
  autoload -U - -ftb-fzf
fi
