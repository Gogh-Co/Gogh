# Terminals whose apply_* function just writes a plain config file, no
# dconf/gsettings/D-Bus involved. Installing the real package isn't strictly
# required for these (Gogh never calls the terminal binary itself), but it
# keeps the test honest about config paths/formats actually matching what
# each terminal ships. Alacritty and Terminator go through a Python helper
# instead of writing the file directly, so they need requirements.txt too --
# no Alacritty/Terminator package themselves, same reasoning as above (the
# helper script writes the file, Gogh never calls the terminal binary).
# Ghostty isn't a Ubuntu 24.04 apt package as of writing, but apply_ghostty
# only writes a file too, so it's testable without it either.
FROM ubuntu:24.04
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
    xfce4-terminal konsole foot kitty kmscon \
    python3 python3-pip \
    bash coreutils \
    --no-install-recommends

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --break-system-packages --no-cache-dir -r /tmp/requirements.txt
