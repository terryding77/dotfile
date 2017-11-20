#!/usr/bin/env zsh
function choose-script(){
    specific_os_script=${ZSH_CUSTOM}/os-specific/$1.zsh
    if [[ -f ${specific_os_script} ]]
    then
        source ${specific_os_script}
    else
        echo "no such os specific file ${specific_os_script}"
        echo "you can run 'touch ${specific_os_script}' to cancel this information"
    fi
}
function detect-linux(){
    version_info=`cat /etc/*-release`
    if [[ `echo $version_info | grep -i "ubuntu"` ]];
    then
        linux="Ubuntu"
    elif [[ `echo $version_info | grep -i "arch"` ]];
    then
        linux="Archlinux"
    fi
    echo ${linux}
}
function detect-os(){
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=`detect-linux`;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine}
}
os_name=`detect-os`
choose-script ${os_name}
