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
    replace $zsh_file_path/zshrc                            ~/.zshrc
    replace $zsh_file_path/oh-my-zsh                        ~/.oh-my-zsh
    replace $zsh_file_path/custom                           ~/.oh-my-zsh/custom/custom
    touch ~/.zsh_custom && chmod +x ~/.zsh_custom
}

command -v zsh >/dev/null 2>&1 || { echo "cannot found zsh shell"; exit 1; }
version=$(zsh --version | cut -d" " -f2)
if [[ $version < "5.2.0" ]]; then
    echo "this script need at least 5.2.0 version of zsh, please update"
    exit 1
fi

check-env
config-zsh
