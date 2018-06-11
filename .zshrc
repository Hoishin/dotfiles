# Added by zsh initialization
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' '+l:|=* r:|=*' '+'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/Users/kei/.zshrc'
autoload -Uz compinit
compinit
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.zsh_source/.{path,exports,aliases,functions,extra,zsh_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# pyenv
eval "$(pyenv init -)"
export PYENV_ROOT="${HOME}/.pyenv"

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# MUST BE AT THE END
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

