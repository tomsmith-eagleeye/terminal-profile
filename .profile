# Profile editing management
alias profile="vim ~/terminal-profile/.profile"
alias pprofile="open ~/terminal-profile/.profile"
alias refresh="source ~/terminal-profile/.profile"
alias terminal="cd ~/terminal-profile"

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

# Docker containers
function dockssh() { docker exec -it $1.local bash }
function dssh() { dax docker:ssh $1.local }
function behat() { docker exec $1.local bin/behat $2 }
function cexecute() { docker exec $1.local $2 }
alias dexec="cexecute"
alias dips="dax docker:ips"
alias compile='docker exec dashboard.local bin/compile-assets'
alias perms="sudo chown $USER:$USER -R ."
# Main containers
alias dup="ddown; (cd ~/dev-environments/air-local && docker compose up -d --remove-orphans)"
alias ddown="(cd ~/dev-environments/air-local && docker compose down)"
# test-dashboard containers
alias testup="(cd ~/dev-environments/test/ && docker compose up -d)"
alias testdown="(cd ~/dev-environments/test/ && docker compose down)"
# Selenoid containers
alias selup="(cd ~/dev-environments/selenoid/ && docker compose up -d && dax docker:generate-hosts)"
alias seldown="(cd ~/dev-environments/selenoid/ && docker compose down)"
# api-recommend containers
alias recup="(recdown; cd ~/web/api-recommend/ && docker compose up -d && dax docker:generate-hosts)"
alias recdown="(cd ~/web/api-recommend/ && docker compose down)"
# test-dashboard and selenoid combo
alias tup="(tdown && selup && testup)"
alias tdown="(testdown && seldown)"
# Wombo combo
alias trestart="(tdown && dup && tup)"

# Dependency management
alias compup="COMPOSER_MEMORY_LIMIT=-1 composer update"
function cupdate() { docker exec $1.local COMPOSER_MEMORY_LIMIT=-1 composer update -vvv }
function lcupdate() { ( cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer update --ignore-platform-req=ext-intl) }
function lcupdateold() { ( cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer update ) }
function cinstall() { docker exec $1.local COMPOSER_MEMORY_LIMIT=-1 composer install -vvv }
function lcinstall() { (cd ~/web/$1 && COMPOSER_MEMORY_LIMIT=-1 composer install --ignore-platform-req=ext-intl) }
function yyarn() { docker exec dashboard-ui.local yarn install }
function cshow() { docker exec $1.local composer show }

# Log management
function log() { cd ~/dev-environments/air-local/mounts/log/eagleeye/$1/app/ && ls -l && tailc application.log }
alias dashlog="cd ~/dev-environments/air-local/mounts/log/eagleeye/dashboard/app && tailc error.log"
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

# MySQL
alias mysqllocal="mysql -uroot -phyperion -hmysql.local"
alias events="mysql -u root -phyperion -h mysql.local  PHOENIX_REBORN < ~/web/phoenix-reborn/data/deployment/events.sql"

# Git
git config --global rebase.autosquash true
alias fetch="git fetch --prune"
alias checkout="git checkout -b"
alias fcheck="fetch && git checkout"
function branch() { git branch -u origin/$1 && git checkout $1 }
alias back="git checkout -"
alias commit="git commit -m"
alias discard="git restore --staged . && git restore ."
alias fixup="git commit --fixup HEAD"
alias rebase="fetch && git rebase -i"
alias squash="git rebase -i HEAD~2"
alias reword="git commit --amend"
alias geturl="git remote get-url origin"
alias graph="git log --graph --oneline --decorate"
alias cbranch="git rev-parse --abbrev-ref HEAD | pbcopy"
alias deletelocal="git branch -d"
alias deleteorigin="git push -d origin"
function deletebranch="deletelocal $1 && deleteorigin $1"
function clone() { git clone git@github.com:Eagle-Eye-Solutions/$1 $2 }

# Docker Compatibility
alias docker-compose="docker compose"

# PHP version management
alias php8="sudo mv /etc/alternatives/php /etc/alternatives/php7 && sudo mv /etc/alternatives/php8 /etc/alternatives/php"
alias php7="sudo mv /etc/alternatives/php /etc/alternatives/php8 && sudo mv /etc/alternatives/php7 /etc/alternatives/php"

# PATH variable
export PATH=~/.composer/vendor/bin:$PATH
