#! /bin/bash
function check-env()
{
    echo -e "\nCheck environment"
    i3_file_path=$(cd `dirname "$0"`; pwd) # tmux base dir
    echo -e "[info] our i3 file directory is $i3_file_path"
    bak_dir=~/.bak/i3/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
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

function config-i3()
{
    echo -e "\nConfig i3"
    replace $i3_file_path/configs ~/.config/i3
    replace $i3_file_path/configs/rofi ~/.config/rofi
}

check-env
config-i3
