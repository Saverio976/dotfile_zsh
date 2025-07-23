FROM archlinux:latest

RUN pacman --noconfirm -Syyuu \
    && pacman --noconfirm -S zsh git

RUN useradd -ms /bin/zsh testuser

COPY --chown=testuser:testuser . /home/testuser/dotfiles
ENV XDG_CONFIG_HOME "/home/testuser/.config"
RUN HOME=/home/testuser zsh "/home/testuser/dotfiles/install.sh" "/home/testuser/dotfiles" "testuser:testuser"

USER testuser

CMD zsh
