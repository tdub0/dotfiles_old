if [[ "$OSTYPE" = "msys" ]]; then
   #PS1='\[\033\]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]' # set window title
   PS1=''
   PS1="$PS1"'\[\033[32m\]'   # change to green
   PS1="$PS1"'\u@\h '         # user@host<space>
   PS1="$PS1"'\[\033[33m\]'   # change to brownish yellow
   PS1="$PS1"'\W'             # current working directory
   PS1="$PS1"'\[\033[0m\]'    # change color to white

   if test -z "$WINELOADERNOEXEC"
   then
      GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
      COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
      COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
      COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
      if test -f "$COMPLETION_PATH/git-prompt.sh"
      then
         . "$COMPLETION_PATH/git-completion.bash"
         . "$COMPLETION_PATH/git-prompt.sh"
         PS1="$PS1"'\[\033[36m\]'   # change color to cyan
         PS1="$PS1"'`__git_ps1`'    # bash function
         PS1="$PS1"'\[\033[0m\]'    # change color to white
      fi
   fi
   PS1="[$PS1]$ "    # prompt: always $

   MSYS2_PS1="$PS1"

   echo -ne "\e[2 q" # change to block cursor
   #echo -ne "\e[6 q" # change to beam cursor
fi
