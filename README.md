<h1 align="center">
  Gogh
</h1>

<div align="center">
  <img src=".images/intro.gif" alt="Gogh" width="80%">
</div>

<br>

<div align="center">
🔹🔹🔹 <a href="http://Gogh-Co.github.io/Gogh"> gogh.website </a> 🔹🔹🔹
</div>

## Color Scheme Implementer for Terminals

Gogh is a collection of color schemes for terminal emulators across Linux and macOS (plus Cygwin/Mintty on Windows) — see the [Terminal Support](#-terminal-support) table below for the full list. These schemes are designed to make your terminal more visually appealing and improve readability with better contrast and color differentiation.

The inspiration for Gogh came from the clean and minimalistic design of Elementary OS, but the project has since grown to include a variety of unique and beautiful options across platforms.

##### Run:

```bash
bash -c "$(curl -fsSL https://gogh.website/gogh)"
```

<br>

<div align="center">
This project is here for anyone to use, no expectations. <br>
If you want to buy me a coffee voluntarily, you can use this link.

[![☕ Buy me a coffee](https://img.shields.io/badge/%E2%98%95-Buy%20me%20a%20coffee-FFA500?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://paypal.me/mgldvd?country.x=CO&locale.x=es_XC)

</div>

<table>
<tr>
<td>
<img width="441" height="1">

<b style="font-size:30px">Index:</b>

<br>

- [Pre-Install](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#%EF%B8%8F-pre-install)
- **[Install](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-install)**
- [Install (Non-Interactive mode)](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#%EF%B8%8F-install-non-interactive-mode)
- [Terminal Support](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-terminal-support)
- [Available Themes](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-themes)
- [Help](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-help)
- [Create your Own Theme!](docs/CONTRIBUTING.md)
- [WCAG - Accessibility Contrast](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-wcag---accessibility-contrast)
- [First commit](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-first-commit)
- [Credits](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#heart-credits)
- [Contributors](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#heart-contributors)
- [Author](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-author-contributor)
- [Why Gogh?](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#%EF%B8%8F-why-gogh)
- [Mentions](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-mentions)
- [Work with Agents](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-work-with-agents)
- [License](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-license)
- [Star History](https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#-star-history)

</td>
<td>
<img width="441" height="1">
<br>
<br>

![gogh](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/demos/themes.gif)

</td>
</table>

<br>

## ⚙️ Pre-Install

In your terminal, type:

For **Debian/Ubuntu:**

```bash
sudo apt-get install dconf-cli uuid-runtime
```

For **Arch Linux:**

```bash
sudo pacman -S dconf util-linux
```

You can now install Gogh in Interactive Mode (Easier) or Non-Interactive Mode! (Ideal for Scripting)

<br>
<br>

## ⚙️ Install

### Interactive Mode

**1. Run the one-line install command:**

**Linux**

```bash
bash -c "$(wget -qO- https://gogh.website/gogh)"
```

**macOS**

```bash
bash -c "$(curl -fsSL https://gogh.website/gogh)"
```

**Using Fish or NuShell?** Run this instead:

```bash
bash -c 'bash -c "$(wget -qO- https://gogh.website/gogh)"'
```

**2. Select your theme from the interactive list.**

**DEMO:**

![gogh-demo-profile](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/demos/gogh-demo-profile.gif)

<br/>
<br/>

## ⚙️ Install (Non-Interactive Mode)

For scripting, dotfiles, provisioning tools, CI, or container images.

- **[Non-Interactive Install Guide](docs/NON_INTERACTIVE.md)** — both install methods (clone the repo, or download just the required files), selecting themes by name/slug as CLI arguments, and the full environment variable reference (`TERMINAL`, `GOGH_NONINTERACTIVE`, `GOGH_USE_NEW_THEME`, and the `GOGH_*_SCRIPT` path overrides).

<br/>
<br/>

## 💻 Terminal Support

Here are some terminals that Gogh is supported with:

| Terminal                       | Web                                                         | Implementation                                                                                                                                                                 |
| ------------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Alacritty                      | [Web](https://github.com/alacritty/alacritty)               | [`apply_alacritty()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L625)                                                                                        |
| Cygwin                         | [Web](https://www.cygwin.com/)                              | [`apply_cygwin()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L593)                                                                                           |
| Foot                           | [Web](https://codeberg.org/dnkl/foot)                       | [`apply_foot()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L703)                                                                                             |
| Ghostty                        | [Web](https://ghostty.org/)                                 | [`apply_ghostty()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L734)                                                                                          |
| Gnome                          | [Web](https://help.gnome.org/users/gnome-terminal/stable/)  | [`apply_gtk()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L986)                                                                                              |
| Guake                          | [Web](http://guake-project.org/)                            | [`apply_guake()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1078)                                                                                           |
| iTerm                          | [Web](https://iterm2.com/)                                  | [`apply_darwin()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L953)                                                                                           |
| Kitty                          | [Web](https://sw.kovidgoyal.net/kitty/)                     | [`apply_kitty()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L813)                                                                                            |
| kmscon                         | [Web](https://github.com/dvdhrm/kmscon)                     | [`apply_kmscon()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L870)                                                                                           |
| Konsole                        | [Web](https://konsole.kde.org/)                             | [`apply_konsole()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L900)                                                                                          |
| linux (Linux virtual terminal) | [Web](https://man7.org/linux/man-pages/man4/console.4.html) | [`apply_linux_vt()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1247)                                                                                        |
| Mate                           | [Web](https://github.com/mate-desktop/mate-terminal)        | [`apply_gtk()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L986)                                                                                              |
| Mintty                         | [Web](https://mintty.github.io/)                            | [`apply_cygwin()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L593)                                                                                           |
| Pantheon / Elementary          | [Web](https://github.com/elementary/terminal)               | [`apply_elementary()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L571)                                                                                       |
| Termux                         | [Web](https://termux.dev/)                                  | [`apply_termux()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1278)                                                                                          |
| Tilix                          | [Web](https://gnunn1.github.io/tilix-web/)                  | [`apply_gtk()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L986) / [`appy_tilixschemes()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1107) |
| Wezterm                        | [Web](https://wezterm.org/)                                 | [`apply_wezterm()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1319)                                                                                         |
| XFCE4                          | [Web](https://docs.xfce.org/apps/terminal/start)            | [`apply_xfce4-terminal()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L1154)                                                                                  |
| Terminator                     | [Web](https://github.com/gnome-terminator/terminator)       | [`apply_terminator()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L674)                                                                                       |

- **[Request a terminal](https://github.com/Gogh-Co/Gogh/issues/new?template=terminal-support.yml)** — don't see your terminal on this list? Open a support request.

<br/>
<br/>

## 🎨 Themes

We have lots of themes in stock!

- **[Browse themes](https://Gogh-Co.github.io/Gogh/)** — the full catalog.
- **json**: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json
- **json min**: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes-min.json

<br/>

- **csv**: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.csv
- **[Color Hash](docs/COLOR_HASH.md)** — how the `hash`/`hash_bg` fields in `themes.json` are computed, for comparing palettes across themes.

<br/>

## 👀 WCAG - Accessibility Contrast

- **[Web](https://gogh-co.github.io/Gogh/wcag)** — the WCAG contrast report.
- **wcag**: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/wcag.json
- **wcag min**: https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/wcag-min.json
- **[More information](https://webaim.org/resources/contrastchecker/)** — WebAIM's contrast checker.

<br/>
<br>

## ❓ HELP

- **[Issue Policy](docs/ISSUE_POLICY.md)** — how issues are triaged and when they're closed.
- **[Troubleshooting](docs/TROUBLESHOOTING.md)** — common installation problems by platform (Arch, Debian, Elementary OS, Fedora, Termux, Ubuntu) with the fixes that worked for other users.

<br>
<br>

## 🖼️ Create your Own Theme!

- **[Contributing Guide](docs/CONTRIBUTING.md)** — the single source of truth for adding a theme: the `.yml` template, the field-by-field reference, the rules a theme PR needs to follow, and how to check it locally with `task validate` before opening the PR.

<br>

## 🤖 Work with Agents

`master` does not track agent-context files — `AGENTS.md` and the `memory/` folder
(architecture decisions + current project status) live on a dedicated orphan branch,
`meta/agents-master`, so the project's own history stays focused on Gogh itself.

If you want to work on this repo with an AI coding agent, bring those files into your
working copy:

```bash
git restore --source meta/agents-master -- AGENTS.md
git restore --source meta/agents-master -- memory/
```

That gives you:

- `AGENTS.md` — the entry-point pointer any agent should read first.
- `memory/STATUS.md` — the real, current state of the project (what's in progress,
  what's uncommitted).
- `memory/decisions/` — Architecture Decision Records (ADRs) for choices already made,
  with their rationale, so an agent doesn't re-propose something already settled.

**Note:** tool-specific folders such as `.agents/` and `.claude/` (agent *skills*) are
intentionally left out of this — there isn't an established, tool-agnostic standard
yet for how skills should be structured or shared, so for now they stay local/
untracked rather than committed to either branch.

<br/>

## 🌱 First commit:

Nov 18, 2013 - [aa9871e](https://github.com/Gogh-Co/Gogh/commit/aa9871e2d6008d5dc8986b90356fa7cf433a0bb3)

<br/>

## :heart: Credits:

- **[Credits](docs/CREDITS.md)** — the full theme-by-theme author list.

<br/>

## :heart: Contributors:

Many thanks to all who have participated in this project.

[@contributors](https://github.com/Gogh-Co/Gogh/graphs/contributors)

<a href="https://github.com/Gogh-Co/Gogh/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=Gogh-Co/Gogh&max=500" />
</a>

<br/>
<br/>

## 🧠 Author (contributor)

I cannot claim to be the only author of this project. Without the help of the people who have contributed, this would not have been possible. Therefore, that's why all contributors are listed first in this document. While I am listed as the author, the true authors are all those who are mentioned in the document. I would like to express my gratitude to all of them, as well as to future contributors.

- Miguel D. Quintero - [Lanet.co](https://lanet.co)

<div align="center">

[![X](https://img.shields.io/badge/X-Mgldvd__tech-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/Mgldvd_tech)
[![GitHub](https://img.shields.io/badge/GitHub-Mgldvd-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Mgldvd)

</div>

<div align="center">
This project is here for anyone to use, no expectations. <br>
If you want to buy me a coffee voluntarily, you can use this link.

[![☕ Buy me a coffee](https://img.shields.io/badge/%E2%98%95-Buy%20me%20a%20coffee-FFA500?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://paypal.me/mgldvd?country.x=CO&locale.x=es_XC)

</div>

<br/>
<br/>

## 🖌️ Why Gogh?

There is no blue without yellow and without orange.

-- [Vincent Van Gogh](https://en.wikipedia.org/wiki/Vincent_van_Gogh) --

<br/>
<br/>

## 📣 Mentions

- **[Mentions](docs/MENTIONS.md)** — the full list of blogs, forums, videos, and comparison sites that have mentioned Gogh.

<br/>

## 📜 License

Gogh is dual-licensed under either the [MIT license](LICENSE-MIT) or the
[Apache License, Version 2.0](LICENSE-APACHE), at your option.

<br/>

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/chart?repos=gogh-co/gogh&type=date&legend=top-left)](https://www.star-history.com/?repos=gogh-co%2Fgogh&type=date&legend=top-left)

[![Star History Rank](https://api.star-history.com/badge?repo=Gogh-Co/Gogh&type=rank)](https://www.star-history.com/gogh-co/gogh)