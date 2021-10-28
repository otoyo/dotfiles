export EDITOR=nvim
export KEYTIMEOUT=1
export PAGER=lv
export PS1='%1~ %# '

alias vim='nvim'

# tmux
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
[ -f ~/.zsh/tmux-attach-or-new-session.sh ] && \
  source ~/.zsh/tmux-attach-or-new-session.sh && \
  alias t='tmux-attach-or-new-session'

# asdf
[ -f $(brew --prefix asdf)/asdf.sh ] && \
  . $(brew --prefix asdf)/asdf.sh

# direnv
eval "$(direnv hook zsh)"

# Ngrok
[ -d ~/ngrok/bin ] && \
  export PATH=$PATH:$HOME/ngrok/bin

# Terraform
[ -d ~/terraform/bin ] && \
  export PATH=$PATH:$HOME/terraform/bin

# MySQL
[ -d /usr/local/opt/mysql@5.7/bin ] && \
  export PATH=$PATH:/usr/local/opt/mysql@5.7/bin

[ -d /usr/local/opt/mysql-client/bin ] && \
  export PATH=$PATH:/usr/local/opt/mysql-client/bin

# Google Cloud SDK
[ -d ~/google-cloud-sdk/bin ] && \
  export PATH=$PATH:$HOME/google-cloud-sdk/bin

[ -f ~/google-cloud-sdk/path.zsh.inc ] && \
  . ~/google-cloud-sdk/path.zsh.inc

[ -f ~/google-cloud-sdk/completion.zsh.inc ] && \
  . ~/google-cloud-sdk/completion.zsh.inc

# fzf (Remap Ctrl-T to Ctrl-F)
[ -f ~/.fzf.zsh ] && \
  source ~/.fzf.zsh && \
  bindkey '^F' fzf-file-widget && \
  bindkey '^T' transpose-chars

# fzf-git
[ -f ~/.fzf-git.zsh ] && \
  source ~/.fzf-git.zsh && \
  bindkey '^G' fzf-git-widget &&\
  bindkey '^H' fzf-git-commit-widget

# $HOME/bin
export PATH="$PATH:$HOME/bin"

# completion
[ -d ~/.zsh/completion ] && \
  fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u
