setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt nohup
unsetopt nomatch
setopt prompt_subst                                             # Enable substitution for prompt

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

bindkey -v
export KEYTIMEOUT=1
bindkey '^H' backward-kill-word

# Theming section  
autoload -Uz compinit colors zcalc
# https://github.com/sorin-ionescu/prezto/blob/e149367445d2bcb9faa6ada365dfd56efec39de8/modules/completion/init.zsh#L34=
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
  compinit -i -C
else
  compinit -i
fi
unset _comp_files
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

[ -f $XDG_CONFIG_HOME/shell/functions.zsh ] && source $XDG_CONFIG_HOME/shell/functions.zsh
[ -f $XDG_CONFIG_HOME/shell/git.zsh ] && source $XDG_CONFIG_HOME/shell/git.zsh
[ -f $XDG_CONFIG_HOME/shell/tmux.zsh ] && source $XDG_CONFIG_HOME/shell/tmux.zsh
[ -f $XDG_CONFIG_HOME/shell/venv.zsh ] && source $XDG_CONFIG_HOME/shell/venv.zsh
[ -f $XDG_CONFIG_HOME/zsh/plugins/git ] && source $XDG_CONFIG_HOME/zsh/plugins/git/git.plugin/zsh

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# For some reason the nix `defaultCommand` and `fileWidgetCommand` options are not working
export FZF_CTRL_T_COMMAND="fd --hidden --follow"

bindkey '^P' fzf-cd-widget
bindkey '^F' fzf-file-widget
bindkey '^[[112;9u' fzf-cd-widget
bindkey '^[[102;9u' fzf-file-widget

