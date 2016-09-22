#!/bin/bash

# probably, this can be done a lot simpler, but I still haven't done any real docker tuts :(
# TODO: simplify ;)

docker pull jekyll/jekyll
# docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p $(docker-machine ip `docker-machine active`):4000:4000 jekyll/jekyll
# TODO: find out what the intent is with $(docker-machine ip `docker-machine active`), and why it can be left out
# TODO: enable polling (https://github.com/jekyll/docker/wiki/Usage:-Running#caveats)
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p :4000:4000 jekyll/jekyll
