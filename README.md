Gogh
====

<div align="center">
  <img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/gogh/Gogh-logo-dark.png" alt="Gogh" width="100%">
</div>

<div align="center">
  :small_blue_diamond: <a href="http://Gogh-Co.github.io/Gogh"> Visit the Website </a> :small_blue_diamond:
</div>

## Color scheme for your terminal

Color Schemes For Ubuntu, Linux Mint, Elementary OS and all distributions that use Gnome Terminal, Pantheon Terminal, Tilix, or XFCE4 Terminal; initially inspired by Elementary OS Luna. Also works on iTerm for macOS. You can check out the themes [here](https://Gogh-Co.github.io/Gogh/).

![elementary](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/demos/themes.gif)

----

## ⚙️ Pre-Install

In your terminal type:

```bash
sudo apt-get install dconf-cli uuid-runtime
```

You can now install in interactive mode (easy) or non-interactive mode (ideal for scripting)

## ⚙️ Install (interactive mode)

**1. Just copy and paste this one-line command:**

```bash
bash -c "$(wget -qO- https://git.io/vQgMr)"
```

Or, if you are a Mac user:

```bash
bash -c "$(curl -sLo- https://git.io/vQgMr)"
```

**2. Select the color theme installed from the terminal**

**DEMO:**

![gogh-demo-profile](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/demos/gogh-demo-profile.gif)

<br/>
<br/>

## Install (non-interactive mode)

```bash
# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# necessary in the Alacritty terminal
pip install -r requirements.txt
export TERMINAL=alacritty

# Enter themes dir
cd themes

# install themes
./atom.sh
./dracula.sh
```

## 💻 Terminals

- Alacritty - [Web](https://github.com/alacritty/alacritty)
- Cygwin - [Web](https://www.cygwin.com/)
- Foot - [Web](https://codeberg.org/dnkl/foot)
- Gnome - [Web](https://help.gnome.org/users/gnome-terminal/stable/)
- Guake - [Web](http://guake-project.org/)
- iTerm - [Web](https://iterm2.com/)
- Kitty - [Web](https://sw.kovidgoyal.net/kitty/)
- Konsole - [Web](https://konsole.kde.org/)
- Mate - [Web](https://github.com/mate-desktop/mate-terminal)
- Mintty - [Web](https://mintty.github.io/)
- Pantheon / Elementary - [Web](https://github.com/elementary/terminal)
- Tilix - [Web](https://gnunn1.github.io/tilix-web/)
- XFCE4 - [Web](https://docs.xfce.org/apps/terminal/start)

<br/>

## 🎨 [Themes](https://Gogh-Co.github.io/Gogh/)

We have lots of themes. Check them out [here](https://Gogh-Co.github.io/Gogh/)!

also all themes in json format: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json

<br/>
<br/>

## 📌 [How to](https://github.com/Gogh-Co/Gogh/blob/master/content/howto.md)

If you want to create your own color scheme or contribute to the project, [start here](https://github.com/Gogh-Co/Gogh/blob/master/content/howto.md).

<br/>

## :thinking: [Help](https://github.com/Gogh-Co/Gogh/blob/master/content/help.md)

<br/>
<br/>


## :heart: Credits:

- [4bit](https://ciembor.github.io/4bit/)
- [Bluloco Light Theme](https://github.com/uloco/theme-bluloco-light)
- [Catppuccin](https://github.com/catppuccin)
- [Chalk](https://github.com/chalk/chalk) by [Sindre Sorhus](https://github.com/sindresorhus)
- [Dracula](https://github.com/dracula/dracula-theme) by [Zeno Rocha](https://github.com/zenorocha)
- [Elementary OS](https://elementary.io/)
- [Everblush](https://github.com/Everblush)
- [Fairy Floss](https://github.com/sailorhg/fairyfloss)
- [Flat Remix](https://github.com/daniruiz/flat-remix)
- [Flat UI Terminal Theme](https://dribbble.com/shots/1021755-Flat-UI-Terminal-Theme)
- [Gooey](http://simey.me/editor-themes/) by [Matt Harris](https://github.com/mdh34)
- [Gotham](https://github.com/whatyouhide/vim-gotham) by [Andrea Leopardi](https://github.com/whatyouhide)
- [Gruvbox](https://github.com/morhetz/gruvbox) by [Pavel Pertsev](https://github.com/morhetz)
- [Hemisu](https://noahfrederick.com/log/hemisu-for-os-x-terminal/) by [Noah Frederick](https://github.com/noahfrederick)
- [kokuban](https://github.com/ygkn/kokuban) by [ygkn](https://github.com/ygkn)
- [Monokai](https://web.archive.org/web/20161117102850/https://www.monokai.nl/blog/2006/07/15/textmate-color-theme) by [Wimer Hazenberg](https://github.com/monokai)
- [Nightfox](https://github.com/EdenEast/nightfox.nvim)
- [Ocean](https://github.com/fabianperez/ocean-dark-iterm) by [Fabian Perez](https://github.com/fabianperez)
- [Omni](https://github.com/getomni)
- [One Dark & Light theme set](https://github.com/nathanbuchar/one-dark-terminal) by [Nathan Buchar](https://github.com/nathanbuchar)
- [Panda](https://github.com/PandaTheme) by [Siamak](https://github.com/siamak)
- [Peppermint](https://noahfrederick.com/log/lion-terminal-theme-peppermint/) by [Noah Frederick](https://github.com/noahfrederick)
- [Rosé Pine](https://github.com/rose-pine)
- [SMYCK](http://color.smyck.org/) by [John-Paul Bader](https://github.com/hukl)
- [Snazzy](https://github.com/sindresorhus/hyper-snazzy) by [Sindre Sorhus](https://github.com/sindresorhus)
- [Solarized](https://ethanschoonover.com/solarized) by [Ethan Schoonover](https://github.com/altercation)
- [Sonokai](https://github.com/sainnhe/sonokai) by [Sainnhe Park](https://github.com/sainnhe)
- [Srcery](https://github.com/srcery-colors/srcery-terminal) by [Daniel Berg](https://github.com/roosta)
- [Summer Pop](https://github.com/guillermoap/Gogh) by [Guillermo Aguirre](https://github.com/guillermoap)
- [SynthWave '84 ](https://github.com/robb0wen/synthwave-vscode)
- [SynthWave Alpha](https://github.com/vikpe/synthwave-alpha)
- [Terminal Sexy](https://terminal.sexy) by [George Czabania](https://github.com/stayradiated)
- [Tilix](https://github.com/storm119/Tilix-Themes)
- [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme)
- [Tomorrow color theme set](https://github.com/chriskempson/tomorrow-theme) by [Chris Kempson](https://github.com/chriskempson)
- Material theme by [Mitchel van Eijgen](https://gist.github.com/mvaneijgen/4c56701215847dd5ddcf) and [Liu Xinan](https://gist.github.com/xinan/ca2b82fef6aaa0d1e099)
- [KANAGAWA.nvim](https://github.com/rebelot/kanagawa.nvim)

<br/>
<br/>


## :heart: Contributors:

- [@contributors](https://github.com/Gogh-Co/Gogh/graphs/contributors)

<br/>
<br/>

## Why Gogh?

There is no blue without yellow and without orange.
-- [Vincent Van Gogh](https://en.wikipedia.org/wiki/Vincent_van_Gogh)

<br/>
<br/>

## Author

- Miguel D. Quintero - [Lanet.co](https://lanet.co)


[💵 Buy me a coffee - paypal](https://paypal.me/mgldvd?country.x=CO&locale.x=es_XC)



## 📣 Mentions

- [VSCode Theme](https://marketplace.visualstudio.com/items?itemName=Avetis.gogh-theme)
- [Awesome-Shell](https://github.com/alebcay/awesome-shell)
- [Hipertextual](https://hipertextual.com/archivo/2014/11/4bit/)
- [MuyLinux](https://www.muylinux.com/2015/06/06/ping-91)
- [Reddit - elementaryos](https://www.reddit.com/r/elementaryos/comments/3ivnb7/how_to_change_terminals_colors/)
- [dev.to](https://dev.to/Gogh-Co/color-scheme-for-your-terminal-1pea)

## Themes in `json` format

In your terminal type:

```bash
bash tools/generate.sh
```

This generates a json file located at `gh-pages/data/themes.json`

Original script source: https://gist.github.com/rapgru/09b449285231d18f4e4536c5f48fc927


## 🌟 Stargazers over time

[![Stargazers over time](https://starchart.cc/Gogh-Co/Gogh.svg)](https://starchart.cc/Gogh-Co/Gogh)


