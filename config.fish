export SSH_AUTH_SOCK=/tmp/$USER.agent
ssh-add -l > /dev/null; or ssh-add

function rm
         safe-rm $argv
end
function dps
        docker ps $argv
end
function gp
        git pull $argv
end
function gps
        git push $argv
end
function dexec
        docker exec -it $argv bash ^/dev/null
        if test $status -ne 0
                docker exec -it $argv sh
        end
end

function docker-remote
        env DOCKER_HOST=tcp://"$argv[1]":2375 docker $argv[2..-1]
end

function d
	docker $argv
end

function node
	set containerName "fish-docker-node-"(random)
	set_color green
	echo $containerName
	set_color normal
	docker run \
	    --rm \
	    -i \
	    -u (id -u)":"(id -g) \
	    --env SSH_AUTH_SOCK=/tmp/agent.sock \
	    -v /etc/passwd:/etc/passwd:ro \
	    -v /etc/group:/etc/group:ro \
	    -v "$SSH_AUTH_SOCK":/tmp/agent.sock \
	    -v "$HOME":"$HOME" \
	    -v (pwd):/app \
	    -w /app \
	    --name $containerName \
	    node:8.9-alpine $argv
end

function emacs
	 env emacs $argv -nw
end

function mkcdir
    mkdir -p "$argv[1]" ;
    cd "$argv[1]"
end
