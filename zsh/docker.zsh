
# Purge all unactive containers.
docker-purge-containers () {
  docker rm $(docker ps -a -q)
}

# Purge all dangled images.
docker-purge-images () {
  images=$(docker images | grep '^<none>' | awk '{print $3}')
  if [[ "$images" != "" ]]; then
    docker rmi $images
  fi
}

# Remove a container.
docker-rm-container () {
  if [[ "$1" == "" ]]; then
    echo "Please specify a container!"
  else
    docker kill $1 && docker rm $1
  fi
}

# aliases
alias dpc="docker-purge-containers"
alias dpi="docker-purge-images"
alias drm="docker-rm-container"
alias di="docker images"
alias dc="docker ps"
alias dca="dps -a"

