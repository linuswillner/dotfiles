if [[ -f ~/.zsh_globals ]]; then
  source ~/.zsh_globals
fi

# oh-my-zsh

# Temp fix for https://github.com/ohmyzsh/ohmyzsh/issues/12328#issuecomment-2043492331
zstyle ':omz:alpha:lib:git' async-prompt no 

ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  context
  dir
  virtualenv
  nvm
  git
)

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  plugins=(git)
else
  plugins=(git git-auto-fetch)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

eval "$(mise activate zsh)"

# Aliases
if [[ -f ~/.zsh_aliases ]]; then
  source ~/.zsh_aliases
fi

# Completions
if [[ -f ~/.zsh_completions ]]; then
  source ~/.zsh_completions
fi

# zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

# Docker Desktop
source /Users/linusw/.docker/init-zsh.sh || true # Added by Docker Desktop

# direnv
_direnv_hook() {
  trap -- '' SIGINT
  eval "$("/opt/homebrew/bin/direnv" export zsh)"
  trap - SIGINT
}
typeset -ag precmd_functions
if (( ! ${precmd_functions[(I)_direnv_hook]} )); then
  precmd_functions=(_direnv_hook $precmd_functions)
fi
typeset -ag chpwd_functions
if (( ! ${chpwd_functions[(I)_direnv_hook]} )); then
  chpwd_functions=(_direnv_hook $chpwd_functions)
fi

fastfetch
