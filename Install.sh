#! /bin/bash
function check-env()
{
    echo -e "\nCheck environment"
    dot_file_path=$(cd `dirname "$0"`; pwd) # git repo base dir
    echo -e "[info] our dotfile git repo directory is $dot_file_path"
    bak_dir=~/.bak/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
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
    replace $dot_file_path/zsh/.zshrc                           ~/.zshrc
    replace $dot_file_path/zsh/oh-my-zsh                        ~/.oh-my-zsh

    # for shell color
    replace $dot_file_path/zsh/dircolors.txt                    ~/.oh-my-zsh/custom/dircolors
    replace $dot_file_path/zsh/base16-tomorrow-night.sh         ~/.oh-my-zsh/custom/base16-tomorrow-night.sh

    # for custom zsh additions
    replace $dot_file_path/zsh/themes                           ~/.oh-my-zsh/custom/themes
    for plugin_name in `ls $dot_file_path/zsh/plugins/`
    do
        replace $dot_file_path/zsh/plugins/$plugin_name         ~/.oh-my-zsh/custom/plugins/$plugin_name
    done
}

function config-vim()
{
    echo -e "\nConfig vim"
    replace $dot_file_path/vim/.vim ~/.vim
    replace $dot_file_path/vim/.vimrc ~/.vimrc
}

function config-pip()
{
    echo -e "\nConfig pip"
    replace $dot_file_path/pip/.pip ~/.pip
}

function main()
{
    echo -e "Start setting my personal configration"
    check-env
    config-zsh
    config-vim
    config-pip
    echo -e "\nEnd configration"
}

main
