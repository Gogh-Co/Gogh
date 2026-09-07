# GNOME Terminal, MATE Terminal, Tilix, and Guake -- all apply their theme
# through dconf/gsettings. GNOME/MATE/Tilix share the same "profile list/
# default read back empty on a fresh install" schema-default gap (see
# apply-colors.sh's seed_profile_list_from_gsettings()); Guake writes
# straight into guake.style.font instead of a profile list, so it's checked
# separately. dbus-x11 provides dbus-run-session, needed for a real (if
# fresh/empty) dconf session -- see tests/docker/README.md for why this
# can't be done on the host.
FROM ubuntu:24.04
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
    gnome-terminal mate-terminal tilix guake \
    dconf-cli libglib2.0-bin dbus-x11 bash \
    --no-install-recommends
