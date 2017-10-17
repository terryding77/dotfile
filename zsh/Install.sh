#! /bin/bash
function check-env()
{
    echo -e "\nCheck environment"
    zsh_file_path=$(cd `dirname "$0"`; pwd) # zsh base dir
    echo -e "[info] our zsh config directory is $zsh_file_path"
    bak_dir=~/.bak/zsh/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
    echo -e "[info] set backup directory as $bak_dir"
    mkdir -p $bak_dir
}

function replace()
{
    # argument in `replace` as order in `ln` 
    echo -e "[info] replace local config $2"
    mv -f $2 $bak_dir 2>/dev/null
    ln -s $@
}

function config-zsh()
{
    echo -e "\nConfig zsh"
    # for oh-my-zsh
    replace $dot_file_path/zshrc                            ~/.zshrc
    replace $dot_file_path/oh-my-zsh                        ~/.oh-my-zsh
    replace $dot_file_path/custom                           ~/.oh-my-zsh/custom/custom
}


check-env
config-zsh
