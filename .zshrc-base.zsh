setopt prompt_subst

source ~/.zsh/autocomplete.zsh
source ~/.zsh/alias.sh
source ~/.zsh/history.zsh
source ~/.zsh/color.sh
source ~/.zsh/text.sh
source ~/.zsh/git-prompt.sh
source ~/.zsh/plugins.zsh

if [[ -f ~/.zshrc.local.zsh ]]; then
  source ~/.zshrc.local.zsh
fi

PROMPT='${NEWLINE}${FONT_BOLD}%*${FONT_NORMAL} | ${TEXT_GREEN}%n@%m${TEXT_DEFAULT} | ${FONT_BOLD}%~${FONT_NORMAL} | $(git_prompt)${NEWLINE}%% '
