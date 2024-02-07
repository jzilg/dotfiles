setopt PROMPT_SUBST

source ./.zsh/alias.sh
source ./.zsh/history.zsh
source ./.zsh/color.sh
source ./.zsh/text.sh
source ./.zsh/git-prompt.sh

if [[ -f ~/.alias.sh ]]; then
  source ~/.alias.sh
fi

PROMPT='${NEWLINE}%B%*%b | %F{green}%n@%m%f | %B%~%b | $(git_prompt)${NEWLINE}%% '
