#!/bin/bash
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wezm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-autosuggestions zsh-wakatime fzf-zsh z docker)

# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias spacemacs='/Applications/Emacs.app/Contents/MacOS/Emacs'


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

notify() {
  terminal-notifier -title 'Terminal' -message 'Done with task!'
}

touch "${HOME}/.last-fzf-query"
sap() {
  local result
  last_fzf_query=$(cat "${HOME}/.last-fzf-query")
  result="$(ag --nobreak --noheading . | fzf -q "$last_fzf_query" --print-query)"
  echo "$result" | head -1 > "${HOME}/.last-fzf-query"
  echo "$result" | sed "1 d" | grep -E -o '^.*?\:\d+'
}

alias diskbiggest='du -hax . | sort -rh | head -10'
alias git-pull="git branch -r | grep -v  '\->' | while read remote; do git branch --track \"$${remote#origin/}\" \"$$remote\"; done"
alias gls="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(authorname) - (%(color:green)%(committerdate:relative)%(color:reset)) - %(color:red)%(upstream:track)%(color:reset)'"
alias git-clean='for b in `git branch --merged | grep -v \*`; do git branch -D $b; done'
alias up='git push origin HEAD'
alias down='git pull origin `git rev-parse --abbrev-ref HEAD`'
git-who() {
    git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame \
         --line-porcelain HEAD |grep  "^author "|sort|uniq -c|sort -nr
}
new-branch() {
    git checkout master && down && git checkout -b $1;
}
watch() {
    find . -name $1 | entr -s "$2 ; terminal-notifier -title 'entr' -message 'Tests finished!'"
}

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'
TMP=$PROMPT
#export PROMPT="$TMP%{%k%F{yellow}%}
#E %{%f%}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export LANG="en_US.UTF-8"export LC_COLLATE="en_US.UTF-8"export LC_CTYPE="en_US.UTF-8"export LC_MESSAGES="en_US.UTF-8"export LC_MONETARY="en_US.UTF-8"export LC_NUMERIC="en_US.UTF-8"export LC_TIME="en_US.UTF-8"export LC_ALL="en_US.UTF-8"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ERL_AFLAGS="-kernel shell_history enabled"

function dotenv () {
  env "$(cat .env | xargs)" $*
}

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH="$HOME/.jenv/shims:$PATH"

ssh-add

alias kill-bg='kill $(jobs -p)'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
eval "$(direnv hook zsh)"

# Haskell Cabal Stack
export PATH="/Users/krzysztofwende/.local/bin:$PATH"
export PATH="/Users/krzysztofwende/.cabal/bin:$PATH"

# Go
export PATH="/Users/krzysztofwende/go/bin:$PATH"
export GOPATH="/Users/krzysztofwende/go"
