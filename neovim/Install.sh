#!/usr/bin/env zsh
nvim_file_path=$(cd `dirname "$0"`; pwd) # nvim file base dir
echo -e "[info] our vim config directory is $vim_file_path"
bak_dir=~/.bak/nvim/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
echo -e "[info] set vim backup directory as $bak_dir"
mkdir -p $bak_dir

function replace()
{
    # argument in `replace` as order in `ln`
    echo -e "[info] replace local config $2"
    mv -f $2 $bak_dir 2>/dev/null
    ln -s $@
}

nvim_system_config_path=~/.config/nvim
echo $nvim_file_path

replace $nvim_file_path $nvim_system_config_path
