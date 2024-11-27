if [[ -f ~/.zsh_globals ]]; then
  source ~/.zsh_globals
fi

# oh-my-zsh

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

plugins=(git)

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

# direnv
_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

fastfetch
