# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

if [[ $(tty) == /dev/tty* || $TerryUseInTTY == true ]]; then
    export TerryUseInTTY=true
else
    export TerryUseInTTY=false
fi

if [[ $TERMINAL_EMULATOR == "JetBrains-JediTerm" || $TerryUseInTTY == true ]]; then
    # ZSH_THEME="robbyrussell"
    # below is copy from theme robbyrussell, and change for tty specific
    local ret_status="%(?:%{$fg_bold[green]%}\$:%{$fg_bold[red]%})%{$reset_color%}"
    PROMPT='%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)${ret_status} '
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[yellow]%} x%{$fg[blue]%)"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
else
    ZSH_THEME="powerlevel9k/powerlevel9k"

    # enabled plugins
    P9K_LEFT_PROMPT_ELEMENTS=(dir vcs context virtualenv newline os_icon)
    P9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs battery history ram time)

    # font settings
    P9K_MODE="nerdfont-complete"

    #powerlevel9k plugin setings
    #segments/background_jobs
    P9K_BACKGROUND_JOBS_ICON="个任务在后台执行中"
    #segments/battery
    P9K_BATTERY_VERBOSE=true
    #segments/command_execution_time
    P9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
    P9K_COMMAND_EXECUTION_TIME_ICON=""
    #segments/context
    P9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
    P9K_CONTEXT_REMOTE_ICON=" 远程连接"
    #segments/dir
    P9K_DIR_SHORTEN_LENGTH=4
    P9K_DIR_DEFAULT_ICON=''
    P9K_DIR_SHOW_WRITABLE=true
    P9K_DIR_HOME_BACKGROUND='green'
    P9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
    P9K_DIR_NOT_WRITABLE_BACKGROUND="red"
    P9K_DIR_ETC_BACKGROUND="yellow"
    #segments/history
    P9K_HISTORY_ICON=""
    #segments/os_icon
    P9K_OS_ICON_BACKGROUND='darkgrey'
    #segments/ram
    P9K_RAM_ICON="Mem"
    #segments/status
    P9K_STATUS_OK=false
    P9K_STATUS_ERROR_CR_ICON="返回值错误"
    P9K_STATUS_HIDE_SIGNAME=true
    #segments/time
    P9K_TIME_BACKGROUND="black"
    P9K_TIME_FOREGROUND="249"
    P9K_TIME_ICON=""
    P9K_TIME_FORMAT="%D{ %Y-%m-%d  %H:%M:%S}"
    #segments/vcs
    P9K_VCS_SHOW_SUBMODULE_DIRTY=false
    P9K_VCS_HIDE_BRANCH_ICON=true
    P9K_VCS_UNTRACKED_ICON=''
    P9K_VCS_UNSTAGED_ICON='±'
    P9K_VCS_INCOMING_CHANGES_ICON='↓'
    P9K_VCS_OUTGOING_CHANGES_ICON='↑'
    #segments/virtualenv
    P9K_VIRTUALENV_ICON=""
fi
