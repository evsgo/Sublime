# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# System-wide bashrc file

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Set a default prompt of: user@host, MSYSTEM variable, and current_directory
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n\$ '

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh


# //////////////////////////////////////////////////////////
# Clean cache
alias npmcln='npm cache clean'
alias bowercln='bower cache clean'

# Browser-sync reload and sync all browsers
alias bsync='browser-sync start --server --files "css/*.css, *.html"'

# Git list commands
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph  --date=short\
  --max-count=40'
alias gs='git status'
alias ga='git add .'
alias push='git push -u origin master'
alias pull='git pull'


# ###########################################################
#                 TEMPLATE FOR STARTING
# ###########################################################
# 1. Create template
alias tem='mkdir -p project/{\
{dist,src}/{js,images/touch},dist/css,\
src/{jade/partials,{sass,stylus}/{layouts,modules,states,base,app}\
}};
touch project/{\
dist/{css/main.css,js/main.js,index.html},\
src/{sass/main.scss,stylus/main.styl,js/main.js,\
jade/{index,partials/{header,footer,scripts,head}}.jade\
}};
echo "
<!DOCTYPE html>
html(lang=\"\")
  head
    meta(charset=\"UTF-8\")
    title Web Starter
    link(rel=\"stylesheet\", href=\"css/main.css\")
  body
    header
      h1 Web Starter
" > project/src/jade/index.jade;

echo "
html body
  margin 0
body
  font-family: "Arial", sans-serif
  h1
    padding: 60px 20px
    margin: 0
    color: #fff
    background-color: #2492F1
" > project/src/stylus/main.styl;

echo "
html, body {
  margin: 0;
}
body {
  font-family: "Arial", sans-serif;
  h1 {
    padding: 60px 20px;
    margin: 0;
    color: #fff;
    background-color: #2492F1;
  }
}
" > project/src/sass/main.scss;
cd project'
# END template

# 2. Start Sublime Text and open index.jade for edit. NOTE: from the project folder
alias sbljade='subl ./src/jade/index.jade'

# Variables for build
alias syncserve='browser-sync start --server dist/ --files="**/*.css, **/*.html"'
alias servejade='jade --pretty -w */**/index.jade -o ./dist/'
alias servesass='sass -w src/sass/main.scss:dist/css/main.css --style expanded'
alias servestylus='stylus -w */**/main.styl -o ./dist/css/'

# 3.SELECT build sass or stylus
alias distsass='servesass & servejade & syncserve'
alias diststylus='servestylus & servejade & syncserve'
