source_env() {
  if [[ -f $ZSH_DOTENV_FILE ]]; then
    # confirm before sourcing .env file
    local confirmation
    echo -n "dotenv: source '$ZSH_DOTENV_FILE' file in the directory? (Y/n) "
    if read -k 1 confirmation && [[ $confirmation = [nN] ]]; then
      return
    fi

    # test .env syntax
    zsh -fn $ZSH_DOTENV_FILE || echo "dotenv: error when sourcing '$ZSH_DOTENV_FILE' file" >&2

    if [[ -o a ]]; then
      source $ZSH_DOTENV_FILE
    else
      set -a
      source $ZSH_DOTENV_FILE
      set +a
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_env

if [[ -z $ZSH_DOTENV_FILE ]]; then
    ZSH_DOTENV_FILE=.env
fi

source_env
