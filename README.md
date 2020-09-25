# my-dev-env-image
This repository holds the dockerfile and some config files for my dev-env

## Use as yours
Clone this repo and run `docker build` in the directory. Note that it creates a user whose name and UID is passed during build [default USER yash_dev, UID 1000].

```cmd
$ docker build -t dev_env --build-arg USER=<user_name>,UID=<user_id> .
```

This will create dev_env:latest image which can be used to create containers

## Contents

This image is based on ubuntu:20.04 and have some tools in it like: 
 - less
 - curl
 - manpages
 - git
 - nano
 - neovim
 
 Other than that it supports 2 languages:
  - node v12.18.4 npm v6.14.6 (installed by nvm hence can be changed easily)
  - golang v1.15.2
  
  The image also has fully configured (tailor made) neovim with vim-plug support and beautiful theme
