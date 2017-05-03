source ~/.antigen/antigen.zsh

local b="antigen-bundle"

# Load the oh-my-zsh's library.
# mkdir -p plugins
# $b robbyrussell/oh-my-zsh plugins/z
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
$b git

# Syntax highlighting on the readline
$b zsh-users/zsh-syntax-highlighting

# history search
$b zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# suggestions
$b tarruda/zsh-autosuggestions

# Load the theme.
# antigen theme robbyrussell
antigen theme refined

# ZSH_THEME=refined

# Tell Antigen that you're done.
$b apply

plugins=(zsh-syntax-highlighting zsh-history-substring-search git)

# autoload -U compinit && compinit

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export GOPATH=$HOME/sandbox/projects/go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/go/bin:/usr/local/opt/go/libexec/bin"

autoload -U compinit && compinit
