#! /bin/bash
function check-env()
{
    echo -e "Check environment"
    vim_file_path=$(cd `dirname "$0"`; pwd) # vim file base dir
    echo -e "[info] our vim config directory is $vim_file_path"
    bak_dir=~/.bak/vim/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
    echo -e "[info] set vim backup directory as $bak_dir"
    mkdir -p $bak_dir
}

function replace()
{
    # argument in `replace` as order in `ln` 
    echo -e "[info] replace local config $2"
    mv -f $2 $bak_dir 2>/dev/null
    ln -s $@
}

function config-vim()
{
    echo -e "\nConfig vim"
    check-env
    replace $vim_file_path/configs ~/.vim
}

config-vim
