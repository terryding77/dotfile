#! /bin/bash
function check-env()
{
    echo -e "\nCheck environment"
    tmux_file_path=$(cd `dirname "$0"`; pwd) # tmux base dir
    echo -e "[info] our tmux file directory is $tmux_file_path"
    bak_dir=~/.bak/tmux/`date "+%Y-%m-%d"`/`date "+%H:%M:%S"`/
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

function config-tmux()
{
    echo -e "\nConfig tmux"
    replace $tmux_file_path/tmux.conf ~/.tmux.conf
    mkdir -p ~/.tmux/plugins/
    replace $tmux_file_path/tpm ~/.tmux/plugins/tpm
}

command -v tmux >/dev/null 2>&1 || { echo "cannot found tmux"; exit 1; }
version=$(tmux -V | cut -d" " -f2)
if [[ $version < "2.3" ]]; then
    echo "this script need at least 2.3 version of tmux, please update"
    exit 1
fi

check-env
config-tmux
