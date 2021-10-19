#!/bin/bash
docker build -t ft_python .

docker run --name ft_python -it -p 80:80 -p 443:443 --rm -v ~/Desktop/ft_python:/home/python-test ft_python