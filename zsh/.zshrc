ZSH=$HOME/.oh-my-zsh

export EDITOR=/usr/bin/vim
export PATH="$HOME/yay/pkg/yay/usr/bin/:/usr/bin:$HOME/.local/bin/"

ZSH_THEME="robbyrussell"

# List Plugins
plugins=(git history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting web-search)

# Sources
source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer.sh\n"
bindkey -s ^o "competetive-programming.sh\n"

# Helpful aliases
alias ls='eza -lh  --icons=auto' # long list
alias l='eza -1 --icons=always' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias mkdir='mkdir -p'


# Custom app alias
alias zc="nvim ~/.zshrc"
alias zs="source ~/.zshrc"

alias ta="tmux attach "

# Obsidian
alias oo='cd /mnt/e/obsidian-notes/ && vim '

# Custom dir alias
alias nvc='cd $HOME/.config/nvim && nvim'
alias ic='cd $HOME/.config/i3 && nvim'
alias tmux='tmux -u'
alias t='tmux -u'

alias gd='cd $(fd)'
alias fzf='fzf --preview="batcat --color=always {}"'

alias codes='cd /mnt/d/codes/'

# Drives
alias d="cd /mnt/d"
alias c="cd /mnt/c"
alias e="cd /mnt/e"
alias hdd="cd /mnt/hdd"

# Development
alias server="npm run dev"

# Machin Learning
alias activate="source $HOME/.venv/bin/activate"

# Config Edit alias
alias i="yay -S "
alias hc="cd $HOME/.config/hypr/ && nvim ."
alias df="cd $HOME/.dotfiles/"
alias tks="tmux kill-server"
alias vim="nvim "

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}


