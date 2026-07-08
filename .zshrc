# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initializes Linuxbrew (Homebrew on Linux), setting PATH, MANPATH, etc.,
# so brew-installed packages are found. 
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# setup fzf keybindings and fuzzy completion
eval "$(fzf --zsh)"

# To use eza to preview directories fzf
export FZF_ALT_D_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Open fzf with 'bat' preview
alias fzf="fzf --preview='bat --style=plain  --color=always {}'"

# writing vim will also open nvim
# alias vim="nvim"

# To use eza with "ls"
alias ls="eza -G --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias sl="eza -G --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# to use z instead of "cd"
eval "$(zoxide init zsh)"
alias cd="z"

# to use bat when typing 'cat'
alias cat="bat"

# To use trash-put instead of 'rm'
alias rm="trash-put"

# cls to clear the screen
alias cls="clear"
# csl type to clear the screen
alias csl="clear"

# thefuck alias
eval "$(thefuck --alias fk)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh
