FROM ubuntu:22.10

ARG USERNAME=docker
ARG PASSWORD=docker

# add new user and give it sudo priviledges
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN useradd -m $USERNAME && echo "$USERNAME:$PASSWORD" | chpasswd && adduser $USERNAME sudo

RUN apt update
RUN apt install -y neovim git openjdk-17-jdk
RUN apt install -y clang-format

WORKDIR /home/$USERNAME

VOLUME work work

USER $USERNAME

# copy neovim configs over
RUN mkdir -p .config/nvim/ftplugin .config/nvim/lua .local/jdtls
COPY nvim/init.lua .config/nvim/init.lua
COPY nvim/ftplugin/java.lua .config/nvim/ftplugin/java.lua
COPY nvim/lua/paq.lua .config/nvim/lua/paq.lua
COPY nvim/lua/plugins.lua .config/nvim/lua/plugins.lua

RUN nvim --headless -u NONE -c 'lua require("plugins").bootstrap_paq()'

COPY ./jdt/jdt-language-server-1.20.0-202302020244.tar.gz .local/jdtls/jdtls.tar.gz
RUN cd .local/jdtls && tar -xf jdtls.tar.gz

RUN chown -R $USERNAME /home/$USERNAME
