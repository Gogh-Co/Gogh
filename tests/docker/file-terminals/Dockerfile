# Terminals whose apply_* function just writes a plain config file, no
# dconf/gsettings/D-Bus involved. Installing the real package isn't strictly
# required for these (Gogh never calls the terminal binary itself), but it
# keeps the test honest about config paths/formats actually matching what
# each terminal ships.
FROM ubuntu:24.04
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
    xfce4-terminal konsole foot kitty kmscon \
    bash coreutils \
    --no-install-recommends
