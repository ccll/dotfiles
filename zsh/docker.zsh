
# Prune all unreferenced images.
docker-prune-images () {
  images=$(docker images -a | grep '^<none>' | awk '{print $3}')
  if [[ "$images" != "" ]]; then
    docker rmi $images
  fi
}

alias dpr="docker-prune-images"
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

# Put files from host to container (the opposite of 'docker cp').
dput () {
  local src=$1
  local container=$2
  local dst=$3
  local id=$(docker inspect -f "{{.Id}}" $container)
  cp -v -r $src /var/lib/docker/aufs/mnt/${id}${dst}
}

# fig
alias fup="fig up"
alias fps="fig ps"
