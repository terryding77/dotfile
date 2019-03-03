# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

if [[ $TERMINAL_EMULATOR == "JetBrains-JediTerm" ]]; then
    ZSH_THEME="robbyrussell"
else
    ZSH_THEME="powerlevel9k/powerlevel9k"
    P9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs context ssh virtualenv)
    P9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status root_indicator background_jobs history ram time)
    P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON=""
    P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON=" %F{blue}%F{white} "
    P9K_PROMPT_ON_NEWLINE=true
    P9K_RPROMPT_ON_NEWLINE=true
    P9K_DIR_SHORTEN_LENGTH=4
    P9K_MODE="nerdfont-complete"
    #powerlevel9k dir plugin
    P9K_DIR_DEFAULT_ICON=''
    #time plugin
    P9K_TIME_BACKGROUND="black"
    P9K_TIME_FOREGROUND="249"
    P9K_TIME_FORMAT=" %D{%H:%M  %Y-%m-%d}"
    # status
    P9K_STATUS_OK_IN_NON_VERBOSE=true
    # vcs
    P9K_VCS_UNTRACKED_ICON=''
    P9K_VCS_UNSTAGED_ICON='±'
    P9K_VCS_INCOMING_CHANGES_ICON='↓'
    P9K_VCS_OUTGOING_CHANGES_ICON='↑'
    P9K_VCS_COMMIT_ICON=''
fi

# POWERLEVEL9K_DIR_HOME_BACKGROUND='191919'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='191919'
# POWERLEVEL9K_DIR_ETC_BACKGROUND='191919'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='191919'

# POWERLEVEL9K_DIR_HOME_FOREGROUND='green'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='green'
# POWERLEVEL9K_DIR_ETC_FOREGROUND='green'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='green'
    #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs context ssh virtualenv)
    #POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status root_indicator background_jobs history ram time)
    #POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    #POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %F{blue}%F{white} "
    #POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    #POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
    #POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
    #POWERLEVEL9K_MODE="nerdfont-complete"
    ##powerlevel9k dir plugin
    #POWERLEVEL9K_FOLDER_ICON=''
    ##time plugin
    #POWERLEVEL9K_TIME_BACKGROUND="black"
    #POWERLEVEL9K_TIME_FOREGROUND="249"
    #POWERLEVEL9K_TIME_FORMAT=" %D{%H:%M  %Y-%m-%d}"
    ## status
    #POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
    ## vcs
    #POWERLEVEL9K_VCS_UNTRACKED_ICON=''
    #POWERLEVEL9K_VCS_UNSTAGED_ICON='±'
    #POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='↓'
    #POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='↑'
    #POWERLEVEL9K_VCS_COMMIT_ICON=''
