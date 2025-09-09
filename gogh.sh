#!/usr/bin/env bash

# Variables to avoid repeated calls to tput
for n in {0..15}; do
  declare C$n=$(tput setaf $n)
done
CR=$(tput sgr0)
CS0=$(tput sgr 0)

# Define traps and trapfunctions early in case any errors before script exits
GLOBAL_VAR_CLEANUP(){
  echo "Cleanup up..."
  [[ -n "$(command -v TILIX_TMP_CLEANUP)" ]] && TILIX_TMP_CLEANUP
  [[ -n "$(command -v ALACRITTY_APPLY_TMP_CLEANUP)" ]] && ALACRITTY_APPLY_TMP_CLEANUP
  [[ -n "$(command -v TERMINATOR_APPLY_TMP_CLEANUP)" ]] && TERMINATOR_APPLY_TMP_CLEANUP
  [[ -n "$(command -v APPLY_SCRIPT_TMP_CLEANUP)" ]] && APPLY_SCRIPT_TMP_CLEANUP
  unset PROFILE_NAME
  unset PROFILE_SLUG
  unset TILIX_RES
  unset TERMINAL
  echo "Done"
}

trap 'GLOBAL_VAR_CLEANUP; trap - EXIT' EXIT HUP INT QUIT PIPE TERM

# TO-DO: Investigate dynamically building this array e.g.
# curl -s https://github.com/Gogh-Co/Gogh/tree/master/themes | grep -o "title=.*\.sh\" " | awk -F '=' '{print $2}'
declare -a THEMES=(
  '3024-day.sh'
  '3024-night.sh'
  'aci.sh'
  'acme.sh'
  'aco.sh'
  'adventure-time.sh'
  'afterglow.sh'
  'alien-blood.sh'
  'apprentice.sh'
  'arc-dark.sh'
  'arc-light.sh'
  'argonaut.sh'
  'arthur.sh'
  'astrodark.sh'
  'atelier-cave.sh'
  'atelier-dune.sh'
  'atelier-estuary.sh'
  'atelier-forest.sh'
  'atelier-heath.sh'
  'atelier-lakeside.sh'
  'atelier-plateau.sh'
  'atelier-savanna.sh'
  'atelier-seaside.sh'
  'atelier-sulphurpool.sh'
  'atom.sh'
  'aura.sh'
  'ayaka.sh'
  'ayu-dark.sh'
  'ayu-light.sh'
  'ayu-mirage.sh'
  'azu.sh'
  'base2tone-cave.sh'
  'base2tone-desert.sh'
  'base2tone-drawbridge.sh'
  'base2tone-earth.sh'
  'base2tone-evening.sh'
  'base2tone-field.sh'
  'base2tone-forest.sh'
  'base2tone-garden.sh'
  'base2tone-heath.sh'
  'base2tone-lake.sh'
  'base2tone-lavender.sh'
  'base2tone-mall.sh'
  'base2tone-meadow.sh'
  'base2tone-morning.sh'
  'base2tone-motel.sh'
  'base2tone-pool.sh'
  'base2tone-porch.sh'
  'base2tone-sea.sh'
  'base2tone-space.sh'
  'base2tone-suburb.sh'
  'base4tone-classic-a.sh'
  'base4tone-classic-b.sh'
  'base4tone-classic-c.sh'
  'base4tone-classic-d.sh'
  'base4tone-classic-e.sh'
  'base4tone-classic-f.sh'
  'base4tone-classic-i.sh'
  'base4tone-classic-l.sh'
  'base4tone-classic-o.sh'
  'base4tone-classic-p.sh'
  'base4tone-classic-q.sh'
  'base4tone-classic-r.sh'
  'base4tone-classic-s.sh'
  'base4tone-classic-t.sh'
  'base4tone-classic-u.sh'
  'base4tone-classic-w.sh'
  'base4tone-modern-c.sh'
  'base4tone-modern-n.sh'
  'base4tone-modern-w.sh'
  'belafonte-day.sh'
  'belafonte-night.sh'
  'bim.sh'
  'birds-of-paradise.sh'
  'blazer.sh'
  'blue-dolphin.sh'
  'blue-moon-light.sh'
  'blue-moon.sh'
  'bluloco-light.sh'
  'bluloco-zsh-light.sh'
  'borland.sh'
  'breadog.sh'
  'breath-darker.sh'
  'breath-light.sh'
  'breath-silverfox.sh'
  'breath.sh'
  'breeze.sh'
  'broadcast.sh'
  'brogrammer.sh'
  'butrin.sh'
  'c64.sh'
  'cai.sh'
  'campbell.sh'
  'catppuccin-frappe.sh'
  'catppuccin-latte.sh'
  'catppuccin-macchiato.sh'
  'catppuccin-mocha.sh'
  'chalk.sh'
  'chalkboard.sh'
  'chameleon.sh'
  'ciapre.sh'
  'city-lights.sh'
  'clone-of-ubuntu.sh'
  'clrs.sh'
  'cobalt-2.sh'
  'cobalt-neon.sh'
  'colorcli.sh'
  'crayon-pony-fish.sh'
  'dark-pastel.sh'
  'darkside.sh'
  'dehydration.sh'
  'desert.sh'
  'dimmed-monokai.sh'
  'dissonance.sh'
  'doom-one.sh'
  'dracula.sh'
  'earthsong.sh'
  'elemental.sh'
  'elementary.sh'
  'elic.sh'
  'elio.sh'
  'espresso-libre.sh'
  'espresso.sh'
  'everblush.sh'
  'everforest-dark-hard.sh'
  'everforest-dark-medium.sh'
  'everforest-dark-soft.sh'
  'everforest-light-hard.sh'
  'everforest-light-medium.sh'
  'everforest-light-soft.sh'
  'fairy-floss-dark.sh'
  'fairy-floss.sh'
  'fishtank.sh'
  'flat-remix.sh'
  'flat.sh'
  'flatland.sh'
  'flexoki-dark.sh'
  'flexoki-light.sh'
  'foxnightly.sh'
  'freya.sh'
  'frontend-delight.sh'
  'frontend-fun-forrest.sh'
  'frontend-galaxy.sh'
  'geohot.sh'
  'github-dark.sh'
  'github-light.sh'
  'gogh.sh'
  'gooey.sh'
  'google-dark.sh'
  'google-light.sh'
  'gotham.sh'
  'grape.sh'
  'grass.sh'
  'gruvbox-dark.sh'
  'gruvbox-material-dark.sh'
  'gruvbox-material-light.sh'
  'gruvbox.sh'
  'guezwhoz.sh'
  'hardcore.sh'
  'harper.sh'
  'hemisu-dark.sh'
  'hemisu-light.sh'
  'highway.sh'
  'hipster-green.sh'
  'homebrew-light.sh'
  'homebrew-ocean.sh'
  'homebrew.sh'
  'horizon-bright.sh'
  'horizon-dark.sh'
  'hurtado.sh'
  'hybrid.sh'
  'ibm-3270-high-contrast.sh'
  'ibm3270.sh'
  'ic-green-ppl.sh'
  'ic-orange-ppl.sh'
  'iceberg.sh'
  'idle-toes.sh'
  'ir-black.sh'
  'jackie-brown.sh'
  'japanesque.sh'
  'jellybeans.sh'
  'jup.sh'
  'kanagawa-dragon.sh'
  'kanagawa-lotus.sh'
  'kanagawa-wave.sh'
  'kibble.sh'
  'kokuban.sh'
  'laserwave.sh'
  'later-this-evening.sh'
  'lavandula.sh'
  'liquid-carbon-transparent.sh'
  'liquid-carbon.sh'
  'lunaria-dark.sh'
  'lunaria-eclipse.sh'
  'lunaria-light.sh'
  'maia.sh'
  'man-page.sh'
  'mar.sh'
  'material.sh'
  'mathias.sh'
  'medallion.sh'
  'minimalist-dark.sh'
  'miramare.sh'
  'misterioso.sh'
  'modus-operandi-tinted.sh'
  'modus-operandi.sh'
  'modus-vivendi-tinted.sh'
  'modus-vivendi.sh'
  'molokai.sh'
  'mona-lisa.sh'
  'mono-amber.sh'
  'mono-cyan.sh'
  'mono-green.sh'
  'mono-red.sh'
  'mono-white.sh'
  'mono-yellow.sh'
  'monokai-dark.sh'
  'monokai-pro-light-sun.sh'
  'monokai-pro-light.sh'
  'monokai-pro-machine.sh'
  'monokai-pro-ocatagon.sh'
  'monokai-pro-ristretto.sh'
  'monokai-pro-spectrum.sh'
  'monokai-pro.sh'
  'monokai-soda.sh'
  'moonfly.sh'
  'morada.sh'
  'n0tch2k.sh'
  'nanosecond.sh'
  'neon-night.sh'
  'neopolitan.sh'
  'nep.sh'
  'neutron.sh'
  'night-owl.sh'
  'nightfly.sh'
  'nightlion-v1.sh'
  'nightlion-v2.sh'
  'nighty.sh'
  'nord-light.sh'
  'nord.sh'
  'novel.sh'
  'obsidian.sh'
  'ocean-dark.sh'
  'oceanic-next.sh'
  'ollie.sh'
  'omni.sh'
  'one-dark.sh'
  'one-half-black.sh'
  'one-light.sh'
  'oxocarbon-dark.sh'
  'palenight.sh'
  'pali.sh'
  'panda.sh'
  'paper.sh'
  'papercolor-dark.sh'
  'papercolor-light.sh'
  'paraiso-dark.sh'
  'paul-millr.sh'
  'pencil-dark.sh'
  'pencil-light.sh'
  'peppermint.sh'
  'pixiefloss.sh'
  'pnevma.sh'
  'powershell.sh'
  'predawn.sh'
  'pro.sh'
  'purple-people-eater.sh'
  'quiet.sh'
  'red-alert.sh'
  'red-sands.sh'
  'relaxed.sh'
  'rippedcasts.sh'
  'rose-pine-dawn.sh'
  'rose-pine-moon.sh'
  'rose-pine.sh'
  'royal.sh'
  'sat.sh'
  'sea-shells.sh'
  'seafoam-pastel.sh'
  'selenized-black.sh'
  'selenized-dark.sh'
  'selenized-light.sh'
  'selenized-white.sh'
  'seoul256-light.sh'
  'seoul256.sh'
  'seti.sh'
  'shaman.sh'
  'shel.sh'
  'slate.sh'
  'smyck.sh'
  'snazzy.sh'
  'soft-server.sh'
  'solarized-darcula.sh'
  'solarized-dark-higher-contrast.sh'
  'solarized-dark.sh'
  'solarized-light.sh'
  'sonokai.sh'
  'spacedust.sh'
  'spacegray-eighties-dull.sh'
  'spacegray-eighties.sh'
  'spacegray.sh'
  'sparky.sh'
  'spring.sh'
  'square.sh'
  'srcery.sh'
  'summer-pop.sh'
  'sundried.sh'
  'sweet-eliverlara.sh'
  'sweet-terminal.sh'
  'symphonic.sh'
  'synthwave-alpha.sh'
  'synthwave.sh'
  'teerb.sh'
  'tempus-autumn.sh'
  'tempus-classic.sh'
  'tempus-dawn.sh'
  'tempus-day.sh'
  'tempus-dusk.sh'
  'tempus-fugit.sh'
  'tempus-future.sh'
  'tempus-night.sh'
  'tempus-past.sh'
  'tempus-rift.sh'
  'tempus-spring.sh'
  'tempus-summer.sh'
  'tempus-tempest.sh'
  'tempus-totus.sh'
  'tempus-warp.sh'
  'tempus-winter.sh'
  'tender.sh'
  'terminal-basic.sh'
  'terminix-dark.sh'
  'thayer-bright.sh'
  'tin.sh'
  'tokyo-night-light.sh'
  'tokyo-night-storm.sh'
  'tokyo-night.sh'
  'tomorrow-night-blue.sh'
  'tomorrow-night-bright.sh'
  'tomorrow-night-eighties.sh'
  'tomorrow-night.sh'
  'tomorrow.sh'
  'toy-chest.sh'
  'treehouse.sh'
  'twilight.sh'
  'ura.sh'
  'urple.sh'
  'vag.sh'
  'vaombe.sh'
  'vaughn.sh'
  'vibrant-ink.sh'
  'vs-code-dark.sh'
  'vs-code-light.sh'
  'warm-neon.sh'
  'website.sh'
  'wez.sh'
  'wild-cherry.sh'
  'wombat.sh'
  'wryan.sh'
  'wzoreck.sh'
  'zenburn.sh'
)

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}
PROGRESS_URL="https://raw.githubusercontent.com/phenonymous/shell-progressbar/1.0/progress.sh"

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

capitalize() {
  local ARGUMENT=$1
  local RES=""
  local STR=""
  local RES_NO_TRAIL_SPACE=""

  for CHAR in $ARGUMENT; do
    STR=$(echo "${CHAR:0:1}" | tr "[:lower:]" "[:upper:]")"${CHAR:1} "
    RES="${RES}${STR}"
    RES_NO_TRAIL_SPACE="$(echo -e "${RES}" | sed -e 's/[[:space:]]*$//')"
  done

  echo "${RES_NO_TRAIL_SPACE}"
}


# Used to get required python scripts, either from the internet or from local directory
if [[ ! -f "${SCRIPT_PATH}/apply-alacritty.py" ]]; then
  ALACRITTY_APPLY_TMP_CLEANUP() {
    rm -rf "${GOGH_ALACRITTY_SCRIPT}"
    unset GOGH_ALACRITTY_SCRIPT
  }
  export GOGH_ALACRITTY_SCRIPT="$(mktemp -t gogh.alacritty.XXXXXX)"
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    curl -so "${GOGH_ALACRITTY_SCRIPT}" "${BASE_URL}/apply-alacritty.py"
  else
    # Linux ships with wget
    wget -qO "${GOGH_ALACRITTY_SCRIPT}" "${BASE_URL}/apply-alacritty.py"
  fi
fi


# Used to get required python scripts, either from the internet or from local directory
if [[ ! -e "${SCRIPT_PATH}/apply-terminator.py" ]]; then
  TERMINATOR_APPLY_TMP_CLEANUP() {
    rm -rf "${GOGH_TERMINATOR_SCRIPT}"
    unset GOGH_TERMINATOR_SCRIPT
  }
  export GOGH_TERMINATOR_SCRIPT="$(mktemp -t gogh.terminator.XXXXXX)"
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    curl -so "${GOGH_TERMINATOR_SCRIPT}" "${BASE_URL}/apply-terminator.py"
  else
    # Linux ships with wget
    wget -qO "${GOGH_TERMINATOR_SCRIPT}" "${BASE_URL}/apply-terminator.py"
  fi
fi


# Used to get required shell scripts, either from the internet or from local directory
if [[ ! -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
  APPLY_SCRIPT_TMP_CLEANUP() {
    rm -rf "${GOGH_APPLY_SCRIPT}"
    unset GOGH_APPLY_SCRIPT
  }
  export GOGH_APPLY_SCRIPT="$(mktemp -t gogh.apply.XXXXXX)"
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    curl -so "${GOGH_APPLY_SCRIPT}" "${BASE_URL}/apply-colors.sh"
  else
    # Linux ships with wget
    wget -qO "${GOGH_APPLY_SCRIPT}" "${BASE_URL}/apply-colors.sh"
  fi
fi


set_gogh() {
  string=$1
  string_r="${string%???}"
  string_s=${string_r//\./_}
  result=$(capitalize "${string_s}")
  url="${BASE_URL}/installs/$1"

  export {PROFILE_NAME,PROFILE_SLUG}="$result"

  if [[ -e "${SCRIPT_PATH}/installs/$1" ]]; then
    bash "${SCRIPT_PATH}/installs/$1"
  else
    if [[ "$(uname)" = "Darwin" ]]; then
      # OSX ships with curl
      bash -c "$(curl -sLo- "${url}")"
    else
      # Linux ships with wget
      bash -c "$(wget -qO- "${url}")"
    fi
  fi
}


remove_file_extension (){
  echo "${1%.*}"
}


### Get length of an array
ARRAYLENGTH=${#THEMES[@]}


# |
# | ::::::: Print logo
# |
tput clear
if [[ ${COLUMNS:-$(tput cols)} -ge 80 ]]; then
  gogh_str=""
  gogh_str+="                                                                                \n"
  gogh_str+="                    █████████                    █████                          \n"
  gogh_str+="                   ███     ███                    ███                           \n"
  gogh_str+="                  ███           ██████   ███████  ███████                       \n"
  gogh_str+="                  ███          ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                  ███    █████ ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                   ███    ███  ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                    █████████   ██████   ███████ ████ █████                     \n"
  gogh_str+="    ${C0}█████████${C1}█████████${C2}█████████${C3}█████████${C4}█████${CS0}███${C4}█${C5}█████████${C6}█████████${C7}█████████    \n"
  gogh_str+="    ${C0}█████████${C1}█████████${C2}█████████${C3}█████████${CS0}███${C4}██${CS0}███${C4}█${C5}█████████${C6}█████████${C7}█████████    \n"
  gogh_str+="    ${C0}█████████${C1}█████████${C2}█████████${C3}█████████${C4}█${CR}██████${C4}██${C5}█████████${C6}█████████${C7}█████████    \n"
  gogh_str+="    ${C8}█████████${C9}█████████${C10}█████████${C11}█████████${C12}█████████${C13}█████████${C14}█████████${C15}█████████${CS0}    \n"
  gogh_str+="    ${C8}█████████${C9}█████████${C10}█████████${C11}█████████${C12}█████████${C13}█████████${C14}█████████${C15}█████████${CS0}    \n"
  gogh_str+="    ${C8}█████████${C9}█████████${C10}█████████${C11}█████████${C12}█████████${C13}█████████${C14}█████████${C15}█████████${CS0}    \n"
  gogh_str+="                                                                                "


  printf '%b\n' "${gogh_str}"
  sleep 2.5
else
  echo -e "\nGogh\n"
  for c in C{0..15}; do
    echo -n "${!c}█████${CR}"
    [[ $c == C7 ]] && echo # new line
  done
  echo
fi


# |
# | ::::::: Print Themes
# |
echo -e "\nThemes:\n"

# Cross-platform function to format theme names
format_theme_name() {
  local name="$1"
  # Remove .sh extension and any other extensions
  name="${name%.*}"
  # Replace hyphens with spaces
  name="${name//-/ }"
  # Capitalize first letter of each word using awk (cross-platform)
  echo "$name" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1'
}

# Column display of available themes
# Note: /usr/bin/column uses tabs and does not support ANSI codes yet (merged but not released)
MAXL=$(( $(printf "%s\n" "${THEMES[@]}" | wc -L) - 3 )) # Biggest theme name without the extension
NCOLS=$(( ${COLUMNS:-$(tput cols)} / (10+MAXL) ))       # number of columns, 10 is the length of '  ( xxx ) '
NROWS=$(( (ARRAYLENGTH-1)/NCOLS + 1 ))                  # number of rows
row=0

while ((row < NROWS)); do
  col=0
  while ((col < NCOLS)); do
    NUM=$((col*NROWS+row))
    NAME="${THEMES[$NUM]}"
    if [[ -n $NAME ]]; then
      FORMATTED_NAME=$(format_theme_name "$NAME")
      printf "  ( ${C4}%3d${CR} ) %-${MAXL}s" $((NUM+1)) "$FORMATTED_NAME"
    fi
    ((col++))
  done
  echo
  ((row++))
done

echo -e "  (${C4} ALL ${CR}) All themes"

# |
# | ::::::: Select Option
# |
echo -e "\nUsage : Enter Desired Themes Numbers (${C4}OPTIONS${CR}) Separated By A Blank Space"
echo -e "        Press ${C4}ENTER${CR} without options to Exit\n"
read -r -p 'Enter OPTION(S) : ' -a OPTION

# Automagically generate options if user opts for all themes
[[ "$OPTION" == ALL ]] && OPTION=($(seq -s " " $ARRAYLENGTH))

# |
# | ::::::: Get terminal
# |
if [[ -z "${TERMINAL:-}" ]]; then
  # |
  # | Check for the terminal name (depening on os)
  # | ===========================================
  OS="$(uname)"
  if [[ "$OS" = "Darwin" ]]; then
    TERMINAL=$TERM_PROGRAM
  elif [[ "${OS#CYGWIN}" != "${OS}" ]]; then
    TERMINAL="mintty"
  elif [[ "$TERM" = "xterm-kitty" ]]; then
    TERMINAL="kitty"
  elif [[ "${TERM}" = "linux" ]]; then
    TERMINAL="linux"
  elif [[ "${HOME}" = *com.termux* ]]; then
    TERMINAL="termux"
  else
    # |
    # | Depending on how the script was invoked, we need
    # | to loop until pid is no longer a subshell
    # | ===========================================
    pid="$$"
    TERMINAL="$(ps -h -o comm -p $pid)"
    while [[ "${TERMINAL:(-2)}" == "sh" ]]; do
      pid="$(ps -h -o ppid -p $pid)"
      TERMINAL="$(ps -h -o comm -p $pid)"
    done
  fi
fi


# |
# | ::::::: Fancy progressbar for lengthy operations
# |
if [[ ${#OPTION[@]} -gt 5 ]]; then
  # Note: We use eval here because we want the functions to be available in this script
  if [[ "$(uname)" = "Darwin" ]]; then
    eval "$(curl -so- ${PROGRESS_URL})" 2> /dev/null
  else
    eval "$(wget -qO- ${PROGRESS_URL})"  2> /dev/null
  fi
fi


# |
# | Tilix supports fg/bg in color schemes - ask wether user wants to go that route
# | This is to avoid creating multiple profiles just for colors
# | ===========================================
if [[ "$TERMINAL" = "tilix" ]] && [[ ${#OPTION[@]} -gt 0 ]]; then
  echo
  read -r -p "Tilix detected - use color schemes instead of profiles? [y/N] " -n 1 TILIX_RES
  echo

  # |
  # | When selecting multiple themes and user opts for color schemes, we save all themes
  # | in a tmpdir and copy the files once all themes has been processed.. If a user
  # | desides to abort before all themes has been processed this section will cleanup the tmpdir
  # | =======================================
  if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
    TILIX_TMP_CLEANUP() {
      echo
      echo "Cleaning up"
      rm -rf "$scratchdir"
      unset LOOP OPTLENGTH scratchdir
      echo "Done..."
      exit 0
    }

    scratchdir=$(mktemp -d -t gogh.tilix.XXXXXXXX)
    export scratchdir
  fi
fi


# |
# | ::::::: Export one-off variables
# |
[[ -n "${TILIX_RES:-}" ]] && export TILIX_RES
export TERMINAL LOOP OPTLENGTH=${#OPTION[@]}


# |
# | ::::::: Apply Theme
# |

declare color_dot_str
for c in C{0..15}; do
  color_dot_str+="${!c}•${CR}"
  [[ $c == C7 ]] && color_dot_str+=" "
done

# Note:
# Constants with a leading 0 are interpreted as octal numbers
# Hence option 08 and 09 will not work
# Solution is to remove the leading 0 from the parsed options
command -v bar::start > /dev/null && bar::start
for OP in "${OPTION[@]#0}"; do
  # See appy_tilixschemes in apply-colors.sh for usage of LOOP
  LOOP=$((${LOOP:-0}+1))

  command -v bar::status_changed > /dev/null && bar::status_changed $LOOP ${#OPTION[@]}

  if [[ OP -le ARRAYLENGTH && OP -gt 0 ]]; then

    FILENAME=$(remove_file_extension "${THEMES[((OP-1))]}")
    FILENAME_SPACE="${FILENAME//-/ }"
    echo -e "\nTheme: $(capitalize "${FILENAME_SPACE}")"
    echo "${color_dot_str}"
    echo

    SET_THEME="${THEMES[((OP-1))]}"
    set_gogh "${SET_THEME}"
  else
    echo -e "${C1} ~ INVALID OPTION! ~${CR}"
    exit 1
  fi
done
# If you skip || : and the command does not exist the script will exit with code 1
# this will always return exit code 0 if we got this far
command -v bar::stop > /dev/null && bar::stop || :
