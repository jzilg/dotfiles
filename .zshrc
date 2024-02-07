setopt prompt_subst

source ./.zsh/autocomplete.zsh
source ./.zsh/alias.sh
source ./.zsh/history.zsh
source ./.zsh/color.sh
source ./.zsh/text.sh
source ./.zsh/git-prompt.sh
source ./.zsh/plugins.zsh

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

PROMPT='${NEWLINE}%B%*%b | %F{green}%n@%m%f | %B%~%b | $(git_prompt)${NEWLINE}%% '
