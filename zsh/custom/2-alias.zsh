alias vi="vim"

alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

alias sudo='sudo '
# the reason of why sudo alias can help shell recognize other alias, such as `sudo vi` can be identified `sudo vim` for `alias vi=vim`.
#From the bash manual:
#
#Aliases allow a string to be substituted for a word when it is used as the first word of a simple command. 
#The shell maintains a list of aliases that may be set and unset with the alias and unalias builtin commands.
#
#The first word of each simple command, if unquoted, is checked to see if it has an alias. 
#If so, that word is replaced by the text of the alias. 
#The characters ‘/’, ‘$’, ‘`’, ‘=’ and any of the shell metacharacters or quoting characters listed above may not appear in an alias name. 
#The replacement text may contain any valid shell input, including shell metacharacters. 
#The first word of the replacement text is tested for aliases, 
#but a word that is identical to an alias being expanded is not expanded a second time. 
#This means that one may alias ls to "ls -F", for instance, and Bash does not try to recursively expand the replacement text. 
#If the last character of the alias value is a space or tab character, 
#then the next command word following the alias is also checked for alias expansion.
alias zshrc="$EDITOR ~/.zsh_custom ~/.zshrc $ZSH_CUSTOM/*.zsh"
alias vimrc="$EDITOR ~/.vim/settings/* ~/.vim/vimrc"
alias tmuxrc="$EDITOR ~/.tmux.conf"

bindkey '^n' autosuggest-accept
