autoload -U promptinit
promptinit

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "${fg[red]}!${reset_color}"
zstyle ':vcs_info:*' unstagedstr "${fg[yellow]}?${reset_color}"
zstyle ':vcs_info:*' enable git svn #hg

# TODO some SSH indicator

setopt prompt_subst

precmd(){
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]
  then
    zstyle ':vcs_info:*' formats " on ${fg[magenta]}%b${reset_color}%c%u"
  else # untracked files has period at the end
    zstyle ':vcs_info:*' formats " on ${fg[magenta]}%b${reset_color}%c%u."
  fi


  vcs_info
  if [[ `uname -s` == "Darwin" ]]
  then
    local percent=$(ioreg -n AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; print (max>0? 100*c["\"CurrentCapacity\""]/max: "?")}' | sed -E 's/(^[0-9]+).*/\1/')
    if [[ "${percent}" -lt 15 ]]
    then
      batt="[${fg[red]}${percent}${reset_color}]"
    elif [[ "${percent}" -lt 50 ]]
    then
      batt="[${fg[yellow]}${percent}${reset_color}]"
    elif [[ "${percent}" -lt 96 ]]
    then
      batt="[${fg[green]}${percent}${reset_color}]"
    else
      batt="[${fg[green]}+${reset_color}]"
    fi
  fi

}

PROMPT='
${fg[magenta]}%n${reset_color}@${fg[cyan]}%m${reset_color}${batt} in ${fg_bold[green]}%~${reset_color}${vcs_info_msg_0_}
[%?]%# '
#%(?..${fg_bold[white]}[%?]${reset_color} )'
RPROMPT='%T'

