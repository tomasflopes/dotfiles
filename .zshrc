# Path to your oh-my-zsh installation.
export ZSH="/Users/lopest/.oh-my-zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

alias "edge"="microsoft-edge"
alias "c."="code ."
alias "nv"="nvim"
alias "rr"="shutdown -r 0"
alias "sd"="shutdown 0"
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
alias "cow"="clear && fortune -s | cowsay -pn"
alias "status"="docker run --rm -it -v $(pwd):/git arzzen/git-quick-stats"
alias "docs"="cd ~/docs"
alias "dot"="cd ~/dotfiles"
alias "src"="source ~/.zshrc"
alias "dsta"="docker stop $(docker ps -a -q)"
alias "drma"="docker rm $(docker ps -a -q)"
alias "drmi"="docker rmi $(docker images -q)"
alias "drmav"="docker volume rm $(docker volume ls -q)"

alias "c"="clear"

export TERM=tmux-256color

# Fuzzy finder
#
# To apply the command to CTRL-T as well
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow -E ~/.fdignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden -E ~/.fdignore"

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
  git
  yarn
  docker
  zsh-completions
  fzf-zsh-plugin
  fzf-tab
  zsh-history-substring-search
  fast-syntax-highlighting
  zsh-autosuggestions
  colorize
  you-should-use
  tmux
  autoupdate
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL=/opt/homebrew/bin/nvim
export EDITOR=/opt/homebrew/bin/nvim

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
  line_sep        # Line break
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

unset env
#clear

# Show greeting message on open
fortune -s | cowsay -pn
# Show system specs
# neofetch

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

alias aos="python3 solution.py < in.txt"
alias aot="echo -ne '\\e[0;34m'; python3 solution.py < test.txt; echo -ne '\\e[0m'"
alias aoc="aot; echo; aos"

function aol () {
  if [ $1 ]
  then
      curl --cookie "session=$AOC_COOKIE" https://adventofcode.com/$1/day/$2/input > in.txt
  else
      curl --cookie "session=$AOC_COOKIE" "$(echo `date +https://adventofcode.com/%Y/day/%d/input` | sed 's/\/0/\//g')" > in.txt
  fi
}

gla() {
  for f in */; do; cd $f; git checkout $(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5); git pull; cd ..; done
}


# Load a few important annexes, without Turbo
# (this is currently required for annexes)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
