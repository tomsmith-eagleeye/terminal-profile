# Profile editing management
alias profile="vim ~/terminal-profile/.profile"
alias pprofile="open ~/terminal-profile/.profile"
alias refresh="source ~/terminal-profile/.profile"

# cd shortcuts
alias web="cd ~/web"
alias dev="cd ~/dev-environments"
alias dashboard="cd ~/web/dashboard"
alias phoenix="cd ~/web/phoenix-reborn"
alias hydra="cd ~/web/hydra"
alias hercules="cd ~/web/hercules"
alias medusa="cd ~/web/medusa"
alias tomato="cd ~/web/tomato"
alias potato="cd ~/web/potato"
function repo() { cd ~/web/$1 }

# General useful commands
alias open="xdg-open"
alias reveal="xdg-open ."
alias install="sudo apt-get install "
alias pbcopy="xclip -sel clip"
alias copy="fc -ln -1 | pbcopy"
alias dirsize="du -hs"
function search() { find . -print | xargs grep "$1" }
function searchf() { find . -type f -print | xargs grep "$1" }
function searchd() { find . -type d -print | xargs grep "$1" }
function tailc(){
tail -f -n 50 $@ | awk -W interactive '
  /DEBUG/ {print "\033[32m" $0 "\033[39m"}
  /INFO/ {print "\033[92m" $0 "\033[39m"}
  /NOTICE/ {print "\033[33m" $0 "\033[39m"}
  /WARNING/ {print "\033[93m" $0 "\033[39m"}
  /ERROR/ {print "\033[31m" $0 "\033[39m"}
  /CRITICAL/ {print "\033[91m" $0 "\033[39m"}
  /ALERT/ {print "\033[35m" $0 "\033[39m"}
  /EMERGENCY/ {print "\033[39m" $0 "\033[41m"}
'}

# Docker containers
alias dupold="(cd ~/dev-environments/air-local && docker-compose -f docker-compose-php7.4.yml up -d)"
alias dup="ddown; (cd ~/dev-environments/air-local && docker compose up -d --remove-orphans)"
alias ddown="(cd ~/dev-environments/air-local && docker compose down)"
alias testdown="(cd ~/dev-environments/test/ && docker compose down)"
alias seldown="(cd ~/dev-environments/selenoid/ && docker compose down)"
alias testup="(cd ~/dev-environments/test/ && docker compose up -d)"
alias selup="(cd ~/dev-environments/selenoid/ && docker compose up -d && dax docker:generate-hosts)"
alias recup="(recdown; cd ~/web/api-recommend/ && docker compose up -d && dax docker:generate-hosts)"
alias recdown="(cd ~/web/api-recommend/ && docker compose down)"
alias tdown="(testdown && seldown)"
alias tup="(tdown && selup && testup)"
alias trestart="(tdown && dup && tup)"
alias recup="(recdown; cd ~/web/api-recommend/ && docker-compose up -d && dax docker:generate-hosts)"
alias recdown="(cd ~/web/api-recommend/ && docker-compose down)"
alias dips="dax docker:ips"
alias dashlog="cd ~/dev-environments/air-local/mounts/log/eagleeye/dashboard/app && tail -f error.log"
alias compile='docker exec dashboard.local bin/compile-assets'
alias perms="sudo chown $USER:$USER -R ."
function dockssh() { docker exec -it $1.local bash }
function dssh() { dax docker:ssh $1.local }
function cupdate() { docker exec $1.local COMPOSER_MEMORY_LIMIT=-1 composer update -vvv }
alias compup="COMPOSER_MEMORY_LIMIT=-1 composer update"
function lcupdate() { ( cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer update --ignore-platform-req=ext-intl) }
function lcupdateold() { ( cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer update ) }
alias dashlog="cd ~/dev-environments/air-local/mounts/log/eagleeye/dashboard/app && tailc error.log"
function cinstall() { docker exec $1.local COMPOSER_MEMORY_LIMIT=-1 composer install -vvv }
function lcinstall() { (cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer install --ignore-platform-req=ext-intl) }
function behat() { docker exec $1.local bin/behat $2 }
function cshow() { docker exec $1.local composer show }
function log() { cd ~/dev-environments/air-local/mounts/log/eagleeye/$1/app/ && ls -l && tailc application.log }
function cexecute() { docker exec $1.local $2 }

# MySQL
alias mysqllocal="mysql -uroot -phyperion -hmysql.local"
alias events="mysql -u root -phyperion -h mysql.local  PHOENIX_REBORN < ~/web/phoenix-reborn/data/deployment/events.sql"

# Git
git config --global rebase.autosquash true
alias fetch="git fetch --prune"
alias checkout="git checkout -b"
function branch() { git branch -u origin/$1 && git checkout $1 }
alias back="git checkout -"
alias commit="git commit -m"
alias fixup="git commit --fixup HEAD"
alias squash="git rebase -i HEAD~2"
alias reword="git commit --amend"
alias geturl="git remote get-url origin"
alias graph="git log --graph --oneline --decorate"
function clone() { git clone git@github.com:Eagle-Eye-Solutions/$1 $2 }

# PHP version management
alias php8="sudo mv /etc/alternatives/php /etc/alternatives/php7 && sudo mv /etc/alternatives/php8 /etc/alternatives/php"
alias php7="sudo mv /etc/alternatives/php /etc/alternatives/php8 && sudo mv /etc/alternatives/php7 /etc/alternatives/php"

# PATH variable
export PATH=~/.composer/vendor/bin:$PATH
