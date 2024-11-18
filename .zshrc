# Включить мгновенный подсказчик Powerlevel10k. Должен находиться близко к началу ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Путь к вашей установке oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Установить название темы для загрузки
ZSH_THEME="powerlevel10k/powerlevel10k"

# Какие плагины вы хотите загрузить?
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Включить проверку небезопасных директорий (опционально)
typeset -g ZSH_DISABLE_COMPFIX=true

# Включить мгновенный подсказчик
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

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
alias h='history'         # История команд
alias df='df -h'          # Показать дисковое пространство в человекочитаемом формате
alias cls='clear'         # Очистка терминала
alias R='ls -R'           # Посмотреть все иректории с поддиректориями и файлами
#my alias
alias cleandown='/home/denis/My_bash_script/cleanup_downloads.sh'
alias mvdir='/home/denis/My_bash_script/mvdir.sh'
alias dlh='/home/denis/My_bash_script/downloader_http.sh'
alias pss='ps -auxf'
# Установить переменную PATH
export PATH="$HOME/bin:$PATH:/usr/bin/python3"

# Настройки истории
HISTFILE=~/.zsh_history   # Файл для хранения истории команд
HISTSIZE=10000            # Максимальное количество записей в истории
SAVEHIST=10000            # Сохранять 10000 записей в истории
setopt append_history      # Добавлять новую историю в конец файла
setopt histignoredups      # Игнорировать дублирующиеся записи в истории

# Чтобы настроить приглашение, запустите `p10k configure` или отредактируйте ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

