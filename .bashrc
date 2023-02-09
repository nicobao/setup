alias cat="bat -p"
alias neovim="/opt/neovim/nvim.appimage"
alias nvim="/opt/neovim/nvim.appimage"
alias vim="/opt/neovim/nvim.appimage"
alias vi="/opt/neovim/nvim.appimage"
export VISUAL="/opt/neovim/nvim.appimage"
export EDITOR="/opt/neovim/nvim.appimage"
alias l="ls -lrth"
# sudo apt install fd-find
# For Ubuntu
alias fd=fdfind
# For vim fzf and rg:
# echo "path/to/exclude" > .rgignore
# echo "path/to/exclude" > .fdignore
# now :Rg in vim will ignore the said directory
# https://github.com/junegunn/fzf.vim/issues/453#issuecomment-1300519987
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
