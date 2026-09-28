# Terminals whose apply_* function just writes a plain config file, no
# dconf/gsettings/D-Bus involved. Installing the real package isn't strictly
# required for these (Gogh never calls the terminal binary itself), but it
# keeps the test honest about config paths/formats actually matching what
# each terminal ships. No Alacritty/Terminator package, same reasoning as
# above (Gogh only writes their config files, it never calls the terminal
# binary).
# Ghostty isn't a Ubuntu 24.04 apt package as of writing, but apply_ghostty
# only writes a file too, so it's testable without it either.
FROM ubuntu:24.04
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
    xfce4-terminal konsole foot kitty kmscon \
    bash coreutils \
    --no-install-recommends
