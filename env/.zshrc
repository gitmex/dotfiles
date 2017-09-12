

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename '/home/mex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.command_history
HISTSIZE=2048
SAVEHIST=4096
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e


typeset -Ag FX FG BG

LSCOLORS="exfxcxdxbxegedabagacad"
LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

FX=(
    reset     "%{0m%}"
    bold      "%{1m%}" no-bold      "%{m%}"
    italic    "%{3m%}" no-italic    "%{m%}"
    underline "%{4m%}" no-underline "%{m%}"
    blink     "%{5m%}" no-blink     "%{m%}"
    reverse   "%{7m%}" no-reverse   "%{m%}"
)

for color in {000..255}; do
    FG[$color]="%{;5;${color}m%}"
    BG[$color]="%{;5;${color}m%}"
done

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

# autoload -U add-zsh-hook
autoload -Uz vcs_info

# # enable VCS systems you use
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' check-for-changes true

setopt prompt_subst
autoload -U promptinit
promptinit


# Look at http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
# for mor options
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '[%b%|%a%c%u%]%f'
zstyle ':vcs_info:*' formats ':%b%c%u%f'


zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PROMPT='[%n@%m %~${vcs_info_msg_0_}] %{$reset_color%}'

alias ls="ls --color=auto"
alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias now='date +%s'