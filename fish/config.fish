set fish_greeting

set -gx TERM xterm-256color

# aliases
alias grep "grep -n --color "
alias fgrep "fgrep -n --color "
alias cls clear
alias g git
alias mux tmuxinator
alias :q exit
alias lg lazygit
alias vim nvim
alias ls "eza --color=always -l --icons=always"
alias la "ls -a"
alias ll "ls -g"
alias l1 "ls -g -1 "
alias lla "ll -a"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH node_modules/.bin $PATH

#Starship
starship init fish | source

#Zoxide
zoxide init --cmd cd fish | source

#Thefuck
thefuck --alias fk | source
