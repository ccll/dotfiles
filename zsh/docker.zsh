
alias dpr="docker rmi \$(docker images -q -f dangling=true)"
alias drm="docker rm"
alias drmi="docker rmi"
alias di="docker images"
alias dia="docker images -a"
alias dc="docker ps"
alias dca="docker ps -a"
alias dr="docker run"
alias db="docker build"
alias dn="docker inspect"
alias dnip="docker inspect -f \"{{.NetworkSettings.IPAddress}}\""
alias dt="docker tag"
alias de="docker exec"
alias dcp="docker cp"
alias dl="docker logs"
alias did="docker inspect -f \"{{.Id}}\""

dsh() {
  docker exec -ti $1 bash
}

# Put files from host to container (the opposite of 'docker cp').
dput () {
  local src=$1
  local container=$2
  local dst=$3
  local id=$(docker inspect -f "{{.Id}}" $container)
  cp -v -r $src /var/lib/docker/aufs/mnt/${id}${dst}
}

# boot2docker on MacOS
OS=`uname -s`
if [[ "$OS" == "Darwin" ]]; then
  alias bd="boot2docker"
  alias bdshell="\$(boot2docker shellinit)"
fi

# fig
alias fup="fig build && fig up"
alias fps="fig ps"
alias fl="fig logs"
alias fcl="fig stop && fig rm --force"
