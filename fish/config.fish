set fish_greeting

set -gx TERM xterm-256color

# aliases
alias grep="grep -n --color "
alias fgrep="fgrep -n --color "
alias cls clear
alias g git
alias mux=tmuxinator
alias :q=exit
alias edge="open -a Microsoft\ Edge $1"
command -qv nvim && alias vim nvim
command -qv lazygit && alias lg lazygit

set -gx EDITOR nvim

set -gx PATH $PATH /usr/local/opt/llvm/bin

if type -q eza
    alias ls="eza --color=always --long --icons=always"
    alias ll="ls -G -l "
    alias l1="ls -G -1 "
    alias ls "ls -p -G"
    alias la "ls -A"
    alias lla "ll -A"
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

#Starship
starship init fish | source

#Zoxide
zoxide init --cmd cd fish | source

#Thefuck
thefuck --alias fk | source
