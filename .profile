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
alias dup="ddown; (cd ~/dev-environments/air-local && docker-compose up -d --remove-orphans)"
alias ddown="(cd ~/dev-environments/air-local && docker-compose down)"
alias testdown="(cd ~/dev-environments/test/ && docker-compose down)"
alias seldown="(cd ~/dev-environments/selenoid/ && docker-compose down)"
alias testup="(cd ~/dev-environments/test/ && docker-compose up -d)"
alias selup="(cd ~/dev-environments/selenoid/ && docker-compose up -d && dax docker:generate-hosts)"
alias tdown="(testdown && seldown)"
alias tup="(tdown && selup && testup)"
alias trestart="(tdown && dup && tup)"
alias recup="(recdown; cd ~/web/api-recommend/ && docker-compose up -d && dax docker:generate-hosts)"
alias recdown="(cd ~/web/api-recommend/ && docker-compose down)"
alias dips="dax docker:ips"
alias dashlog="cd ~/dev-environments/air-local/mounts/log/eagleeye/dashboard/app && tail -f error.log"
alias compile='dax docker:run dashboard.local "bin/compile-assets"'
function dssh() { dax docker:ssh $1.local }
function cupdate() { dax docker:run $1.local "COMPOSER_MEMORY_LIMIT=-1 composer update -vvv" }
function cinstall() { dax docker:run $1.local "COMPOSER_MEMORY_LIMIT=-1 composer install -vvv" }
function behat() { dax docker:run $1.local "bin/behat $2" }
function cshow() { dax docker:run $1.local "composer show" }
function log() { cd ~/dev-environments/air-local/mounts/log/eagleeye/$1/app/ && ls -l }

# MySQL
alias mysqllocal="mysql -uroot -phyperion -hmysql.local"
alias events="mysql -u root -phyperion -h mysql.local  PHOENIX_REBORN < ~/web/phoenix-reborn/data/deployment/events.sql"

# Git
git config --global rebase.autosquash true
alias fetch="git fetch --prune"
alias checkout="git checkout -b"
alias back="git checkout -"
alias commit="git commit -m"
alias fixup="git commit --fixup HEAD"
alias squash="git rebase -i HEAD~2"
alias reword="git rebase -i HEAD~1"
alias diff="git diff HEAD "
alias geturl="git remote get-url origin"
alias graph="git log --graph --oneline --decorate"
function clone() { git clone git@github.com:Eagle-Eye-Solutions/$1 $2 }

# PATH variable
export PATH=~/.composer/vendor/bin:$PATH
