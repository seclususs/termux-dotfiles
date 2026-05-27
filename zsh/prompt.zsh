############################
# Shell prompt customization
############################

setopt PROMPT_SUBST

autoload -U colors && colors

TERMUX_USER=${USER:-user}
TERMUX_HOST="termux"

COLOR_USR="%F{114}"
COLOR_DIR="%F{39}"
COLOR_ROOT="%F{196}"
RESET="%f"

if [[ "$EUID" -eq 0 ]]; then
    PROMPT="${COLOR_ROOT}root@${TERMUX_HOST}${RESET}:${COLOR_DIR}%~${RESET}# "
else
    PROMPT="${COLOR_USR}${TERMUX_USER}@${TERMUX_HOST}${RESET}:${COLOR_DIR}%~${RESET}$ "
fi

PS2="${COLOR_USR}>${RESET} "
