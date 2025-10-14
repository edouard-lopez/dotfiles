function docker-ls
    docker images
    echo ''
    docker ps -a
end

function docker-clean
    docker-clean-containers
    docker-clean-images
end

function docker-clean-containers
    echo "Deleting stopped containers"
    for container in (docker ps -a -q)
        docker rm $container
    end
end

function docker-clean-images
    echo "Deleting untagged images"
    for image in (docker images -q -f dangling=true)
        docker rmi $image
    end
end

function docker-list-volumes
    docker volume ls -qf dangling=true
end

function docker-clean-volumes
    for volume in (docker-list-volumes)
        docker volume rm $volume
    end
end

function docker-list-container-volumes
    docker inspect --format='{{json .Mounts}}' $argv[1] | python -m json.tool
end

function docker-compose-infinite
    while true
        docker-compose stop
        docker-compose rm -f
        docker-compose build
        docker-compose up
    end
end
alias infinite-docker-compose docker-compose-infinite

function docker-compose-rebuild
    docker-compose stop $argv;
    docker-compose build $argv;
    docker-compose up -d --no-deps $argv;
end

function docker-enter
    docker exec -it "$1" bash
end