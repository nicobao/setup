alias cat="bat -p"
alias neovim="/opt/neovim/nvim.appimage"
alias nvim="/opt/neovim/nvim.appimage"
alias vim="/opt/neovim/nvim.appimage"
alias vi="/opt/neovim/nvim.appimage"
export VISUAL="/opt/neovim/nvim.appimage"
export EDITOR="/opt/neovim/nvim.appimage"
alias l="ls -lrth"

# This will delete all local branches that used to had an upstream remote branch, but the remote branch has been deleted.
alias git-prune-local-branches="git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"
