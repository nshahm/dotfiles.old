#!/bin/zsh

# Install bundles via antigen (ZSH plugin manager)
curl -L git.io/antigen > antigen.zsh
source ~/.zshrc

# framework
antigen use oh-my-zsh

# antigen bundle git 

bundles=(
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
    git
    gitfast
    golang
)
for bundle in "${bundles[@]}"; do
    # if "$(antigen list ${bundle})" ~= /You don\'t have any bundles./ ; then
        echo $bundle
        antigen bundle $bundle
    # elif antigen list "$bundle" > /dev/null 2>&1; then
    #     echo "$bundle already installed... skipping."
    # else
        # antigen bundle $bundle
    # fi
done

# Install themes
themes=(
    pure
)
for theme in "${themes[@]}"; do
    if antigen list "$theme" > /dev/null 2>&1; then
        echo "$theme already installed... skipping."
    else
        antigen theme $theme
    fi
done

