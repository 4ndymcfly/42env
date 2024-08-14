autoload -U +X bashcompinit && bashcompinit
PS1='%B%{%F{45}%}%{%F{92}%}[%n@%M] %{%F{39}%}%~%{%f%}$%b '

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/home/$USER/.local/bin"

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

# ALIAS 42env
alias ll='/usr/bin/lsd -lha --group-dirs=first'
alias llo='/usr/bin/lsd -lha --group-dirs=first --permission octal'
alias ls='/usr/bin/lsd --group-dirs=first'
alias vi='/snap/bin/nvim'
alias picture='kitty +kitten icat'
alias 42gcc='gcc -Wall -Werror -Wextra'
alias 42nt='norminette -R CheckForbiddenSourceHeader'
