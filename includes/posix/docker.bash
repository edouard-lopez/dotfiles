#!/usr/bin/env bash

function configure() {
    function docker-ls() {
        docker images
        echo ''
        docker ps -a
    }
    alias dls='docker-ls '

    function docker-clean() {
        docker-clean-containers
        docker-clean-images
    }
    alias dc='docker-clean'
    function docker-clean-containers() {
        echo "Deleting stopped containers"
        for container in $(docker ps -a -q); do
            docker rm $container
        done
    }
    alias dcc='docker-clean-containers '
    function docker-clean-images() {
        echo "Deleting untagged images"
        for image in $(docker images -q -f dangling=true); do
            docker rmi $image
        done
    }
    alias dci='docker-clean-images '

    function dbuild() {
        docker build "$@"
    }
    function drun() {
        docker run "$@"
    }

    function docker-list-volumes() {
        docker volume ls -qf dangling=true
    }
    alias dlsv='docker-list-volumes '

    function docker-clean-volumes() {
        for volume in $(docker-list-volumes); do
            docker volume rm $volume
        done
    }
    alias dcv='docker-list-volumes '

    function docker-list-container-volumes() {
        docker inspect --format='{{json .Mounts}}' "$1" | python -m json.tool
    }
    alias dlcv='docker-list-container-volumes '

    function docker-compose-infinite() {
        while true; do
            docker-compose stop
            docker-compose rm -f
            docker-compose build
            docker-compose up
        done
    }
    alias infinite-docker-compose='docker-compose-infinite '

    function docker-compose-rebuild() {
        docker-compose stop "$@";
        docker-compose build "$@";
        docker-compose up -d --no-deps "$@";
    }

    function docker-enter(){
        docker exec -it "$1" bash
    }

    function __complete_containers_running(){
         local containers=( $(docker ps --format="{{.Names}}") )
         local cur="${COMP_WORDS[COMP_CWORD]}"
         COMPREPLY=( $(compgen -W "${containers[*]}" -- "$cur") )
    }

    complete -F __complete_containers_running docker-enter
}
configure
