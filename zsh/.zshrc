# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/
export PATH="/bin:$HOME/.local/share/bin:$HOME/.venv/bin/pip:$HOME/.venv/bin/python:$HOME/anaconda3/bin:$PATH"

# Starship
eval "$(starship init zsh)"
# ZSH_THEME="robbyrussell"


# List Plugins
plugins=(git history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting web-search)

# sources
source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer.sh\n"
bindkey -s ^r "find-recurrsive.sh\n"
bindkey -s ^o "competetive-programming.sh\n"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Helpful aliases
alias tt='yazi ~/Pictures/timetable.png'
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1 --icons=always' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Handy change dir shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'


#Display Pokemon
# pokemon-colorscripts --no-title -r 1,3,6

# Custom app alias
alias cls= "clear"
alias ml="cd ~/Codes/machine-learning"
alias zconf="nvim ~/.zshrc"
alias zcompile="source ~/.zshrc"
# alias t="tmux "
alias ta="tmux attach "
# alias tas="tmux attach-session "
alias t="sh ~/.local/share/bin/tmux-sessionizer.sh"
alias setwall="swww img --transition-type=random "
alias notes="~/Documents/Obsidian-Notes && nvim"
alias cat="bat -pp"
# alias leet="nvim leetcode.nvim"
alias pwdy="echo $(pwd) | wl-copy -p"
alias view="yazi "
alias lg="lazygit"
alias rg="sh search.sh"

# Custom dir alias
alias clones="cd ~/Downloads/clones"
alias desk="cd ~/Desktop"
alias temp="cd ~/temp"
alias nvc='cd $HOME/.config/nvim && nvim'

# Custom Fuzzy finder
# alias inv="fzf --delimiter=' ' | nvim -f -"
# alias ff='fzf --preview="bat --color=always {}"'
alias fd="find ~ -type d -not -path '*/.*/*' -not -path '*/.*' -not -path '*/node_modules/*' -not -path '*/node_modules' -not -path '*/.git/*' -not -path '*/.git' | fzf"
alias gd='cd $(fd)'
alias fzf='fzf --preview="bat --color=always {}"'
# alias froot='fzf --walker=,dir --walker-root=/ --walker-skip=/home'

alias fcodes='fzf --walker=,dir --walker-root=$HOME/Codes/'
alias codes='cd $(fcodes)'
alias vim='nvim '

# Disabled
# alias twd='alacritty --working-directory=$(pwd) & exit'
# alias fon='nvim $(ff)'
# alias home='cd $(fhome)'
# alias root='cd $(froot)'
# alias vc='code' # gui code editor

# Drives
alias d="cd /mnt/drive"
alias e="cd /mnt/drive2"
alias hdd="cd /mnt/hdd"
alias window="cd /mnt/windows"

# Custom Courses Video Play
alias vid="cd /mnt/drive2/Telegram/0-100Cohort/0-100Cohort"
# alias play="mpv --playlist=/mnt/drive/Telegram/LoveBabbar"
alias play="sh ~/.local/share/bin/radio.sh"

# Git
alias ga="git add "
alias gc="git commit -m"
alias gr="git reset "
alias gs="git status "

# Development
alias server="npm run dev"

# Custom Scripts
alias sol="~/.local/share/bin/search-on-yt.sh"
alias cpro="sh ~/.local/share/bin/competetive-programming.sh "

# Machin Learning
alias activate="source $HOME/.venv/bin/activate"
alias postman="~/Downloads/postman-linux-x64/Postman/Postman"

# Python
alias piv="~/.venv/bin/pip "

# Jupyter
alias jn='jupyter notebook --no-browser'
alias jc='jupyter console'
alias jl='jupyter lab --core-mode' # Fix for M1 mac

# Exports
# export EDIOTOR=nvim
# export VISUAL=nvim
export JUPYTER_NOTEBOOK_STYLE='from IPython.display import HTML;HTML("<style>div.text_cell_render{font-size:130%;padding-top:50px;padding-bottom:50px}</style>")'
export NVM_DIR="$HOME/.nvm"

# Nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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


