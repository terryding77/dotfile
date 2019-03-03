#!/usr/bin/env zsh
function choose-script(){
    specific_os_script=${ZSH_CUSTOM}/systems/$1.zsh
    if [[ -f ${specific_os_script} ]]
    then
        source "${specific_os_script}"
    else
        echo "no specific file for this OS: $1"
        echo "you can run 'touch ${specific_os_script}' to hide this information"
    fi
}

function detect-os(){
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)
            prettyName=$(cat /etc/*-release | grep PRETTY_NAME | cut -d'"' -f 2)
            case ${prettyName} in
                "Arch Linux"*)  machine="ArchLinux";;
                CentOS*)        machine="CentOS";;
                Debian*)        machine="Debian";;
                Ubuntu*)        machine="Ubuntu";;
                *)              machine="UNKNOWN:${prettyName}"
            esac;;
        Darwin*)    machine="Mac";;
        CYGWIN*)    machine="Cygwin";;
        MINGW*)     machine="MinGw";;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo "${machine}"
}

function run_script_for_specific_os(){
    operating_system=$(detect-os)
    choose-script "${operating_system}"
}

run_script_for_specific_os
