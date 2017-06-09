source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster
export DEFAULT_USER=marnold

# Tell antigen that you're done.
antigen apply

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PROJECTS=$HOME/Code

#DEVDB
export set BUILD_USER=spud

# Software Setup
export CJ_GIT_HOME=$PROJECTS
export CJ_SOFTWARE_HOME=$CJ_GIT_HOME/software
export cj_softwareHome=$CJ_SOFTWARE_HOME
export cj_grailsVersion=1.3.6
export cj_resinVersion=3.1.8

# Software Homes
export JAVA_ROOT=/Library/Java/JavaVirtualMachines/
export JDK7=$JAVA_ROOT/jdk1.7.0_80.jdk/Contents/Home
export JDK8=$JAVA_ROOT/jdk1.8.0_72.jdk/Contents/Home
export JAVA_HOME=$JDK8

# export GRAILS_HOME=$CJ_SOFTWARE_HOME/grails/grails-$cj_grailsVersion
export RESIN_HOME=$CJ_SOFTWARE_HOME/resin/$cj_resinVersion

# DB
export TNS_ADMIN=~
export DEVDB_HOST=devdb.db.cj.com
export DEVDB_PORT=1521
export DEVDB_SID=DEVDB

# MAVEN
export MAVEN_OPTS='-Xmx8G -Xss1G'

# DOCKER
export DOCKERHOST="$(ifconfig en0 inet | grep "inet " | awk -F'[: ]+' '{ print $2 }')"

# KOPS
export KOPS_STATE_STORE=s3://lambda-deployment-cluster-state

#GPG magic
GPG_TTY=$(tty)
export GPG_TTY

#python
export PYTHONSTARTUP=~/.pythonrc

#aws deployment
export SQUAD=lambda

# PATH
export PATH="$HOME/.local/bin:$HOME/software/bin:/usr/local/sbin:$PATH"

