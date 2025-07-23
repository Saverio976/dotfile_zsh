FROM archlinux:latest

RUN pacman --noconfirm -Syyuu \
    && pacman --noconfirm -S zsh git

RUN useradd -ms /bin/zsh testuser

RUN mkdir -p /home/testuser/dotfiles
COPY --chown=testuser:testuser . /home/testuser/dotfiles/zsh
ENV XDG_CONFIG_HOME "/home/testuser/.config"
RUN HOME=/home/testuser zsh "/home/testuser/dotfiles/zsh/install.sh" "/home/testuser/dotfiles/zsh" "testuser:testuser"

USER testuser

CMD zsh
