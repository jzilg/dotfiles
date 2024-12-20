#!/bin/sh

DEFAULT_COLOR=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

git_prompt() {
  insideGitRepo="$(git status 2>/dev/null)"

  if ! [ "$insideGitRepo" ]; then
    return
  fi

  gitStatus=$(git status -sb)
  branchName=$(git branch --show-current)

  # Detect rebase
  if [ -d "$(git rev-parse --git-dir)/rebase-merge" ] || [ -d "$(git rev-parse --git-dir)/rebase-apply" ]; then
    rebaseIndicator="${BOLD}rebasing →"
  fi

  # Detect merge
  if [ -f "$(git rev-parse --git-dir)/MERGE_HEAD" ]; then
    mergeIndicator=" ${BOLD}merging →"
  fi

  # Detect stashed files
  if [ -n "$(git stash list)" ]; then
    stashedFiles="${DEFAULT_COLOR}*"
  fi

  aheadCount=$(echo "$gitStatus" | grep -o "ahead [0-9]*" | grep -o "[0-9]*$")
  if [ "$aheadCount" -gt 0 ]; then
    ahead="${DEFAULT_COLOR}↑${aheadCount}"
  fi

  behindCount=$(echo "$gitStatus" | grep -o "behind [0-9]*" | grep -o "[0-9]*$")
  if [ "$behindCount" -gt 0 ]; then
    behind="${DEFAULT_COLOR}↓${behindCount}"
  fi

  statusIsCleanIndicator="${GREEN}${BOLD}✔${NORMAL}"

  # if git status is not clean check for reasons
  if [ "$(echo "$gitStatus" | wc -l | xargs)" -ne 1 ]; then
    statusIsCleanIndicator=""

    untrackedFilesCount=$(echo "$gitStatus" | grep -c "??")
    if [ "$untrackedFilesCount" -gt 0 ]; then
      untrackedFiles="${RED}…?"
    fi

    notStagedFilesCount=$(echo "$gitStatus" | grep -Ec '^(.M|.A|.R|.C|.D)')
    if [ "$notStagedFilesCount" -gt 0 ]; then
      notStagedFiles="${RED}●$notStagedFilesCount"
    fi

    stagedFilesCount=$(echo "$gitStatus" | grep -Ec '^(M|A|R|C|D)')
    if [ "$stagedFilesCount" -gt 0 ]; then
      stagedFiles="${GREEN}●$stagedFilesCount"
    fi

    conflictedFilesCount=$(echo "$gitStatus" | grep -Ec "^(DD|AU|UD|UA|DU|AA|UU)")
    if [ "$conflictedFilesCount" -gt 0 ]; then
      conflictedFiles="${RED}${BOLD}$conflictedFilesCount Conflicted!${NORMAL}"
    fi
  fi

  echo "${ORANGE}[${branchName}${rebaseIndicator}${mergeIndicator}${ahead}${behind} ${statusIsCleanIndicator}${conflictedFiles}${stagedFiles}${notStagedFiles}${untrackedFiles}${stashedFiles}${ORANGE}]${DEFAULT_COLOR}"
}
