# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs context ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status root_indicator background_jobs history ram time)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %F{blue}%F{white} "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_MODE="nerdfont-complete"
#powerlevel9k dir plugin
POWERLEVEL9K_FOLDER_ICON=''
#time plugin
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT=" %D{%H:%M  %Y-%m-%d}"
# status
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
# vcs
POWERLEVEL9K_VCS_UNTRACKED_ICON=''
POWERLEVEL9K_VCS_UNSTAGED_ICON='±'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='↓'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='↑'
POWERLEVEL9K_VCS_COMMIT_ICON=''
