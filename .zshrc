# Path to your oh-my-zsh installation.
export ZSH="/home/kappa-laptop/.oh-my-zsh"

alias "emulator"="/home/kappa-laptop/Android/Sdk/emulator/emulator"
alias "edge"="microsoft-edge"
alias "c."="code-insiders ."
alias "nv"="nvim"
alias "rr"="shutdown -r 0"
alias "sd"="shutdown 0"
alias "n"="nautilus"
alias "open"="nautilus"
alias "m"="tmuxinator"
alias "flux"="gammastep -O 4000 -b .85 &"
alias "wifi-list"="nmcli device wifi list"
alias "wl"="wifi-list"
alias "wifi-con"="nmcli device wifi connect"
alias "wic"="wifi-con"
alias "up"="sudo dnf update -y"
alias "i"="sudo dnf install"
alias "z"="tar -zcvf"
alias "unz"="tar -xvg"
alias "cow"="clear && fortune -as | cowsay -pn"
alias "status"="docker run --rm -it -v $(pwd):/git arzzen/git-quick-stats"
alias "docs"="cd ~/docs"
alias "dot"="cd ~/dotfiles"
alias "src"="source ~/.zshrc"

alias "c"="clear"

alias "vpn-on"="sudo surfshark-vpn"
alias "vpn-off"="sudo surfshark-vpn down"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export XDG_CURRENT_DESKTOP=GNOME
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/opt/apache-maven-3.8.5/bin:$PATH

export TERM=tmux-256color

# Fuzzy finder
#
# To apply the command to CTRL-T as well
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow -E ~/.fdignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden -E ~/.fdignore"

## Default prompt
export EDTOR=vim
export VISUAL=/usr/bin/nvim

# Remove Teams from autostart everytime it appears
if [[ -f  ~/.config/autostart/teams.desktop ]]; then
  rm ~/.config/autostart/teams.desktop
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-history-enquirer
  git
  tmux
  zsh-completions
  fzf-zsh-plugin
  fzf-tab
  zsh-history-substring-search
  fast-syntax-highlighting
  zsh-autosuggestions
  colorize
  you-should-use
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Open with tmux
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## SPACESHIP CONFIG
SPACESHIP_PROMPT_ORDER=(
  time            # Time stamps section
  user            # Username section
  dir             # Current directory section
  host            # Hostname section
  git             # Git section (git_branch + git_status)
  hg              # Mercurial section (hg_branch  + hg_status)
  exec_time       # Execution time
  line_sep        # Line break
  vi_mode         # Vi-mode indicator
  docker          # Docker section
  jobs            # Background jobs indicator
  exit_code       # Exit code section
  char            # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_PACKAGE_PREFIX="via·"
SPACESHIP_PACKAGE_SUFFIX=" "
SPACESHIP_PACKAGE_COLOR="green"
SPACESHIP_PROMPT_SEPARATE_LINE=true

# Remember passphrase for git
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
clear

# Show greeting message on open
fortune -as | cowsay -pn
# Show system specs
# neofetch

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(github-copilot-cli alias -- "$0")"


# Change dump dir
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# pnpm
export PNPM_HOME="/home/kappa-laptop/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# AOC STUFF
AOC="~/dev/personal/aoc-2024"

alias aos="python3 main.py < input.txt"
alias aot="echo -ne '\\e[0;34m'; python3 main.py < test.txt; echo -ne '\\e[0m'"
alias aoc="aot; echo; aos"

# !FIRST EXPORT THE AOC_COOKIE
function aol() {
    if [ $1 ]
    then
        curl --cookie "session=$AOC_COOKIE" https://adventofcode.com/$1/day/$2/input > input.txt
    else
        curl --cookie "session=$AOC_COOKIE" "$(echo `date +https://adventofcode.com/%Y/day/%d/input` | sed 's/\/0/\//g')" > input.txt
    fi
}

pull_all() {
  for f in */; do; cd $f; git checkout $(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5); git pull; cd ..; done
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kappa-laptop/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kappa-laptop/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kappa-laptop/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kappa-laptop/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


