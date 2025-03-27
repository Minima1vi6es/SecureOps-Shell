# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load Command Completion System
autoload -Uz compinit
compinit

# Load Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins — autojump included now!
plugins=(git z sudo command-not-found common-aliases autojump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Suppress Powerlevel10k console output warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Reload P10K alias
alias reloadp10k='source ~/.p10k.zsh && clear && echo "%F{blue}>> Hacker prompt reloaded.%f"'

# Custom Powerlevel10k segments
function prompt_ip() {
  local ip=$(ip route get 1.1.1.1 | awk '{print $NF; exit}')
  [[ -n $ip ]] && p10k segment -b 237 -f 255 -i '' -t "$ip"
}

function prompt_ip_public() {
  local ip=$(curl -s https://api.ipify.org)
  [[ -n $ip ]] && p10k segment -b 238 -f 255 -i '' -t "$ip"
}

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
