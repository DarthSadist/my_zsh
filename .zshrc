# Включить мгновенный подсказчик Powerlevel10k. Должен находиться близко к началу ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Отключение предупреждений Powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Путь к вашей установке oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Настройка fzf
export FZF_BASE="$HOME/.fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Настройка горячих клавиш fzf
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude .git || find . -type f"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git || find . -type d"
bindkey '^F' fzf-history-widget           # Ctrl+F для поиска по истории
bindkey '^P' fzf-file-widget             # Ctrl+P для поиска файлов
bindkey '\ec' fzf-cd-widget              # Alt+C для перехода по директориям

# Дополнительные настройки fzf
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Установить название темы для загрузки
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Какие плагины вы хотите загрузить?
plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo copypath dirhistory fzf)

# Загрузить Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Включить автоисправление команд
ENABLE_CORRECTION="true"

# Включить меню автозаполнения
zstyle ':completion:*' menu select

# Настройка цветов терминала
autoload -U colors && colors

# Настройки цветного приглашения
PROMPT='%{$fg[cyan]%}%n@%m %{$fg[green]%}%~ %{$reset_color%}❯ '

# Алиасы
alias ll='ls -la'         # Подробный список файлов
alias la='ls -A'          # Список файлов, включая скрытые
alias l='ls -CF'          # Список файлов в виде колонок
alias g='git'             # Упрощение команды git
alias ..='cd ..'          # Переход на уровень выше
alias ...='cd ../..'      # Переход на два уровня выше
alias ....='cd ../../..'  # Переход на три уровня выше
alias h='history'         # История команд
alias df='df -h'          # Показать дисковое пространство в человекочитаемом формате
alias cls='clear'         # Очистка терминала
alias R='ls -R'           # Посмотреть все директории с поддиректориями и файлами
alias mkdir='mkdir -pv'   # Создавать родительские директории автоматически
alias ports='netstat -tulanp' # Показать открытые порты
alias mem='free -h'       # Показать использование памяти
alias disk='du -sh * | sort -hr' # Показать размер файлов/папок
alias myip='curl http://ipecho.net/plain; echo' # Показать внешний IP
alias update='sudo apt update && sudo apt upgrade' # Обновление системы
#my alias
alias cleandown='/home/denis/My_bash_script/cleanup_downloads.sh'
alias mvdir='/home/denis/My_bash_script/mvdir.sh'
alias dlh='/home/denis/My_bash_script/downloader_http.sh'
alias pss='ps -auxf'

# Установить переменную PATH
export PATH="$HOME/bin:$PATH:/usr/bin/python3"

# Настройки истории
HISTFILE=~/.zsh_history
HISTSIZE=50000            # Увеличиваем размер истории
SAVEHIST=50000
setopt append_history
setopt hist_ignore_all_dups # Игнорировать все дубликаты
setopt hist_find_no_dups    # Не показывать дубликаты при поиске
setopt hist_reduce_blanks   # Убирать лишние пробелы
setopt hist_verify          # Показывать команду перед выполнением из истории
setopt share_history        # Делиться историей между сессиями

# Улучшенное автодополнение
setopt auto_cd              # Автоматический cd при вводе пути
setopt auto_pushd           # Автоматически добавлять директории в стек
setopt pushd_ignore_dups    # Игнорировать дубликаты в стеке директорий
setopt extended_glob        # Расширенный глоббинг

# Настройки для быстрой навигации
setopt auto_list            # Автоматически показывать список при неоднозначном завершении
setopt auto_menu            # Автоматически использовать меню при множественном завершении

# Чтобы настроить приглашение, запустите p10k configure или отредактируйте ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
