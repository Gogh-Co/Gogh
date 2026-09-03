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
  '0x96f.sh'
  '12-bit-rainbow.sh'
  '3024-day.sh'
  '3024-night.sh'
  'aardvark-blue.sh'
  'aardvark-ink.sh'
  'abernathy.sh'
  'aci.sh'
  'acid-lime.sh'
  'acme.sh'
  'aco.sh'
  'adventure-time.sh'
  'adventure.sh'
  'adwaita-dark.sh'
  'adwaita.sh'
  'afterglow.sh'
  'agave.sh'
  'aizen-dark.sh'
  'aizen-light.sh'
  'alabaster.sh'
  'alien-blood.sh'
  'amber-crt-retro.sh'
  'andromeda.sh'
  'apple-classic.sh'
  'apple-system-colors-light.sh'
  'apple-system-colors.sh'
  'apprentice.sh'
  'arc-dark.sh'
  'arc-light.sh'
  'arcoiris.sh'
  'ardoise.sh'
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
  'atlas-ragnarok.sh'
  'atom-one-dark.sh'
  'atom-one-light.sh'
  'atom.sh'
  'aubade.sh'
  'aura-dark.sh'
  'aura.sh'
  'aurora.sh'
  'ayaka.sh'
  'ayu-dark.sh'
  'ayu-light-lost.sh'
  'ayu-light.sh'
  'ayu-mirage-lost.sh'
  'ayu-mirage.sh'
  'ayu.sh'
  'azu.sh'
  'banana-blueberry.sh'
  'base16-icy.sh'
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
  'batman.sh'
  'belafonte-day.sh'
  'belafonte-night.sh'
  'bim.sh'
  'birds-of-paradise.sh'
  'black-metal-bathory.sh'
  'black-metal-burzum.sh'
  'black-metal-dark-funeral.sh'
  'black-metal-gorgoroth.sh'
  'black-metal-immortal.sh'
  'black-metal-khold.sh'
  'black-metal-marduk.sh'
  'black-metal-mayhem.sh'
  'black-metal-nile.sh'
  'black-metal-venom.sh'
  'black-metal.sh'
  'blazer.sh'
  'blue-berry-pie.sh'
  'blue-dolphin.sh'
  'blue-matrix.sh'
  'blue-moon-light.sh'
  'blue-moon.sh'
  'bluloco-dark.sh'
  'bluloco-light.sh'
  'bluloco-zsh-light.sh'
  'borland.sh'
  'box.sh'
  'branch.sh'
  'breadog.sh'
  'breath-darker.sh'
  'breath-light.sh'
  'breath-silverfox.sh'
  'breath.sh'
  'breeze.sh'
  'bright-lights.sh'
  'broadcast.sh'
  'brogrammer.sh'
  'builtin-dark.sh'
  'builtin-light.sh'
  'builtin-pastel-dark.sh'
  'builtin-tango-dark.sh'
  'builtin-tango-light.sh'
  'butrin.sh'
  'c64.sh'
  'cai.sh'
  'calamity.sh'
  'campbell.sh'
  'carbonfox.sh'
  'cassette-tape.sh'
  'catppuccin-frappe.sh'
  'catppuccin-latte.sh'
  'catppuccin-macchiato.sh'
  'catppuccin-mocha.sh'
  'cga.sh'
  'chalk-lost.sh'
  'chalk.sh'
  'chalkboard.sh'
  'challenger-deep.sh'
  'chameleon.sh'
  'chester.sh'
  'ciapre.sh'
  'citrus-ink.sh'
  'citruszest.sh'
  'city-lights.sh'
  'claude-dark.sh'
  'claude-light.sh'
  'claude.sh'
  'clear-dark.sh'
  'clear-light.sh'
  'clone-of-ubuntu.sh'
  'clrs.sh'
  'cobalt-neon.sh'
  'cobalt-next-dark.sh'
  'cobalt-next-minimal.sh'
  'cobalt-next.sh'
  'cobalt2.sh'
  'coffee-theme.sh'
  'colorcli.sh'
  'cool-night.sh'
  'crayon-pony-fish.sh'
  'crt-amber.sh'
  'cursor-dark.sh'
  'cursor-light.sh'
  'cutie-pro.sh'
  'cyberdyne.sh'
  'cyberpunk-icy.sh'
  'cyberpunk-scarlet-protocol.sh'
  'cyberpunk.sh'
  'dalton-dark.sh'
  'dark-modern.sh'
  'dark-pastel.sh'
  'dark.sh'
  'darkermatrix.sh'
  'darkmatrix.sh'
  'darkside.sh'
  'datum-dark.sh'
  'datum-light.sh'
  'dawnfox.sh'
  'daybreak.sh'
  'dayfox.sh'
  'deep.sh'
  'dehydration.sh'
  'desert.sh'
  'detuned.sh'
  'dimidium.sh'
  'dimmed-monokai.sh'
  'dissonance.sh'
  'django-reborn-again.sh'
  'django-smooth.sh'
  'django.sh'
  'dogxi-misty.sh'
  'doom-one-lost.sh'
  'doom-one.sh'
  'doom-peacock.sh'
  'dot-gov.sh'
  'dracula-lost.sh'
  'dracula.sh'
  'draculaplus.sh'
  'driftwood.sh'
  'duckbones.sh'
  'duotone-dark.sh'
  'duskfox.sh'
  'earthsong.sh'
  'eclipse.sh'
  'electron-highlighter-day.sh'
  'electron-highlighter.sh'
  'elegant.sh'
  'elemental.sh'
  'elementary-lost.sh'
  'elementary.sh'
  'elic.sh'
  'elio.sh'
  'embark.sh'
  'embers-dark.sh'
  'emerald-synth.sh'
  'encom.sh'
  'espresso-libre.sh'
  'espresso.sh'
  'everblush.sh'
  'everforest-dark-hard.sh'
  'everforest-dark-med.sh'
  'everforest-dark-medium.sh'
  'everforest-dark-soft.sh'
  'everforest-light-hard-lost.sh'
  'everforest-light-hard.sh'
  'everforest-light-med.sh'
  'everforest-light-medium.sh'
  'everforest-light-soft-lost.sh'
  'everforest-light-soft.sh'
  'fahrenheit.sh'
  'fairy-floss-dark.sh'
  'fairyfloss-lost.sh'
  'fairyfloss.sh'
  'farmhouse-dark.sh'
  'farmhouse-light.sh'
  'fideloper.sh'
  'firefly-traditional.sh'
  'firefox-dev.sh'
  'firewatch.sh'
  'fish-tank.sh'
  'flat-lost.sh'
  'flat-remix.sh'
  'flat.sh'
  'flatland.sh'
  'flexoki-dark-lost.sh'
  'flexoki-dark.sh'
  'flexoki-light.sh'
  'floraverse.sh'
  'forest-blue.sh'
  'forge-ember.sh'
  'foxnightly.sh'
  'framer.sh'
  'freya.sh'
  'front-end-delight.sh'
  'frostbyte.sh'
  'fun-forrest.sh'
  'galaxy.sh'
  'galizur.sh'
  'geohot.sh'
  'ghostty-default-style-dark.sh'
  'github-dark-colorblind.sh'
  'github-dark-default.sh'
  'github-dark-dimmed.sh'
  'github-dark-high-contrast.sh'
  'github-dark.sh'
  'github-light-colorblind.sh'
  'github-light-default.sh'
  'github-light-high-contrast.sh'
  'github-light.sh'
  'github.sh'
  'gitlab-dark-grey.sh'
  'gitlab-dark.sh'
  'gitlab-light.sh'
  'glacier.sh'
  'gleam-classic.sh'
  'gleam.sh'
  'gogh-lost.sh'
  'gogh.sh'
  'gooey.sh'
  'google-dark.sh'
  'google-light.sh'
  'gotham.sh'
  'grape.sh'
  'graphite.sh'
  'grass.sh'
  'green-phosphor-crt.sh'
  'grey-green.sh'
  'grok-day.sh'
  'grok-night.sh'
  'gruber-darker.sh'
  'gruvbox-dark-hard.sh'
  'gruvbox-dark.sh'
  'gruvbox-light-hard.sh'
  'gruvbox-light.sh'
  'gruvbox-material-dark.sh'
  'gruvbox-material-light.sh'
  'gruvbox-material.sh'
  'guezwhoz.sh'
  'hacktober.sh'
  'hardcore.sh'
  'harper.sh'
  'havn-daggry.sh'
  'havn-skumring.sh'
  'hax0r-blue.sh'
  'hax0r-gr33n.sh'
  'hax0r-r3d.sh'
  'heeler.sh'
  'hemisu-dark.sh'
  'hemisu-light.sh'
  'highway.sh'
  'hipster-green.sh'
  'hivacruz.sh'
  'homebrew.sh'
  'hopscotch-256.sh'
  'hopscotch.sh'
  'horizon-bright-lost.sh'
  'horizon-bright.sh'
  'horizon-dark.sh'
  'horizon.sh'
  'hot-dog-stand-mustard.sh'
  'hot-dog-stand.sh'
  'hurtado.sh'
  'hybrid-lost.sh'
  'hybrid.sh'
  'ibm-3270-high-contrast.sh'
  'ibm-5153-cga-black.sh'
  'ibm-5153-cga.sh'
  'ibm3270.sh'
  'ic-green-ppl-lost.sh'
  'ic-green-ppl.sh'
  'ic-orange-ppl.sh'
  'iceberg-dark.sh'
  'iceberg-light.sh'
  'iceberg.sh'
  'idea.sh'
  'idle-toes.sh'
  'ir-black-lost.sh'
  'ir-black.sh'
  'irix-console.sh'
  'irix-terminal.sh'
  'iterm2-dark-background.sh'
  'iterm2-default.sh'
  'iterm2-light-background.sh'
  'iterm2-pastel-dark-background.sh'
  'iterm2-smoooooth.sh'
  'iterm2-solarized-dark.sh'
  'iterm2-solarized-light.sh'
  'iterm2-tango-dark.sh'
  'iterm2-tango-light.sh'
  'jackie-brown.sh'
  'japanesque.sh'
  'jellybeans.sh'
  'jetbrains-darcula.sh'
  'jetbrains-islands-dark.sh'
  'jetcalm-light.sh'
  'jubi.sh'
  'jup.sh'
  'kanagawa-dragon.sh'
  'kanagawa-lotus.sh'
  'kanagawa-wave.sh'
  'kanagawabones.sh'
  'kanso-ink.sh'
  'kanso-mist.sh'
  'kanso-pearl.sh'
  'kanso-zen.sh'
  'karasu-night.sh'
  'karasu-snow.sh'
  'karma-dark-dimmed.sh'
  'karma-dark-hc.sh'
  'karma-dark.sh'
  'karma-light-dimmed.sh'
  'karma-light-hc.sh'
  'karma-light.sh'
  'keys-ocean-sunset-hc.sh'
  'keys-ocean-sunset.sh'
  'kibble.sh'
  'kitty-default.sh'
  'kitty-low-contrast.sh'
  'klein-void.sh'
  'kokuban.sh'
  'kolorit.sh'
  'konsolas.sh'
  'kurokula.sh'
  'lab-fox.sh'
  'laser.sh'
  'laserwave.sh'
  'later-this-evening.sh'
  'lavandula.sh'
  'letterpress.sh'
  'light-owl.sh'
  'liquid-carbon-transparent.sh'
  'liquid-carbon.sh'
  'london-bonfire-night.sh'
  'london-columbia-road.sh'
  'london-embankment-dusk.sh'
  'london-soho-night.sh'
  'lovelace.sh'
  'lunaria-dark.sh'
  'lunaria-eclipse.sh'
  'lunaria-light.sh'
  'maia.sh'
  'man-page.sh'
  'mar.sh'
  'mariana.sh'
  'matcha-zen.sh'
  'material-dark.sh'
  'material-darker.sh'
  'material-design-colors.sh'
  'material-lost.sh'
  'material-ocean.sh'
  'material.sh'
  'mathias.sh'
  'matrix.sh'
  'matte-black.sh'
  'medallion.sh'
  'melange-dark.sh'
  'melange-light.sh'
  'mellifluous.sh'
  'mellow.sh'
  'mesila-one.sh'
  'miami-heat.sh'
  'miasma.sh'
  'midnight-arcade.sh'
  'midnight-in-mojave.sh'
  'minimalist-dark.sh'
  'mirage.sh'
  'miramare.sh'
  'misterioso.sh'
  'modus-operandi-deuteranopia.sh'
  'modus-operandi-tinted.sh'
  'modus-operandi-tritanopia.sh'
  'modus-operandi.sh'
  'modus-vivendi-deuteranopia.sh'
  'modus-vivendi-tinted.sh'
  'modus-vivendi-tritanopia.sh'
  'modus-vivendi.sh'
  'molokai-lost.sh'
  'molokai.sh'
  'mona-lisa.sh'
  'mono-amber.sh'
  'mono-cyan.sh'
  'mono-green.sh'
  'mono-red.sh'
  'mono-white.sh'
  'mono-yellow.sh'
  'monokai-classic.sh'
  'monokai-dark.sh'
  'monokai-pro-light-sun.sh'
  'monokai-pro-light.sh'
  'monokai-pro-machine.sh'
  'monokai-pro-octagon.sh'
  'monokai-pro-ristretto-lost.sh'
  'monokai-pro-ristretto.sh'
  'monokai-pro-spectrum.sh'
  'monokai-pro.sh'
  'monokai-remastered.sh'
  'monokai-soda.sh'
  'monokai-sublimetext.sh'
  'monokai-vivid.sh'
  'monospace-dark.sh'
  'monospace-light.sh'
  'moonfly.sh'
  'moonwalk.sh'
  'morada.sh'
  'n0tch2k.sh'
  'nachtschicht.sh'
  'nanosecond.sh'
  'nebula-drift.sh'
  'neobones-dark.sh'
  'neobones-light.sh'
  'neon-night.sh'
  'neon-purple.sh'
  'neon.sh'
  'neopolitan.sh'
  'nep.sh'
  'neutron.sh'
  'night-lion-v1.sh'
  'night-lion-v2.sh'
  'night-owl.sh'
  'night-owlish-light.sh'
  'nightfly.sh'
  'nightfox.sh'
  'nighty.sh'
  'niji.sh'
  'no-clown-fiesta-light.sh'
  'no-clown-fiesta.sh'
  'noctis-azureus.sh'
  'noctis-bordo.sh'
  'noctis-hibernus.sh'
  'noctis-lilac.sh'
  'noctis-lux.sh'
  'noctis-minimus.sh'
  'noctis-obscuro.sh'
  'noctis-sereno.sh'
  'noctis-uva.sh'
  'noctis-viola.sh'
  'noctis.sh'
  'nocturnal-winter.sh'
  'nord-light-lost.sh'
  'nord-light.sh'
  'nord-wave.sh'
  'nord.sh'
  'nordfox.sh'
  'novel.sh'
  'novmbr.sh'
  'nvim-dark.sh'
  'nvim-light.sh'
  'obsidian.sh'
  'ocean-dark.sh'
  'ocean.sh'
  'oceanic-material.sh'
  'oceanic-next-lost.sh'
  'oceanic-next.sh'
  'ollie.sh'
  'omni.sh'
  'one-dark-two.sh'
  'one-dark.sh'
  'one-double-dark.sh'
  'one-double-light.sh'
  'one-half-black.sh'
  'one-half-dark.sh'
  'one-half-light.sh'
  'one-light.sh'
  'onenord-light.sh'
  'onenord.sh'
  'opaline.sh'
  'operator-mono-dark.sh'
  'outrun-electric.sh'
  'overnight-slumber.sh'
  'owl.sh'
  'oxblood.sh'
  'oxide.sh'
  'oxocarbon-dark.sh'
  'oxocarbon.sh'
  'pale-night-hc.sh'
  'palenight.sh'
  'pali.sh'
  'panda.sh'
  'pandora.sh'
  'paper.sh'
  'papercolor-dark.sh'
  'papercolor-light.sh'
  'paraiso-dark.sh'
  'patina-dark-soft.sh'
  'patina-dark.sh'
  'patina-lichen.sh'
  'patina-light.sh'
  'patina-moss.sh'
  'patina-stellar.sh'
  'patina.sh'
  'paul-millr.sh'
  'pencil-dark.sh'
  'pencil-light.sh'
  'peppermint-lost.sh'
  'peppermint.sh'
  'phala-green-dark.sh'
  'piatto-light.sh'
  'pierre-dark.sh'
  'pierre-light.sh'
  'pixiefloss.sh'
  'pnevma.sh'
  'poimandres-darker.sh'
  'poimandres-storm.sh'
  'poimandres-white.sh'
  'poimandres.sh'
  'popping-and-locking.sh'
  'porcelain.sh'
  'powershell.sh'
  'predawn.sh'
  'primary.sh'
  'prism.sh'
  'pro-light.sh'
  'pro.sh'
  'punk-bg.sh'
  'punk.sh'
  'purple-people-eater.sh'
  'purple-portal.sh'
  'purple-rain.sh'
  'purplepeter.sh'
  'pyrokai-light.sh'
  'pyrokai.sh'
  'quiet.sh'
  'rapture.sh'
  'raycast-dark.sh'
  'raycast-light.sh'
  'rebecca.sh'
  'red-alert.sh'
  'red-planet.sh'
  'red-sands.sh'
  'relaxed.sh'
  'retro-legends.sh'
  'retro.sh'
  'rippedcasts.sh'
  'rose-pine-dawn.sh'
  'rose-pine-moon.sh'
  'rose-pine.sh'
  'rouge-2.sh'
  'royal.sh'
  'ryuuko.sh'
  'sakura.sh'
  'sandstone-classic.sh'
  'sandstone-ink.sh'
  'sandstone-warm.sh'
  'sat.sh'
  'sauber.sh'
  'scarlet-protocol.sh'
  'sea-shells.sh'
  'seafoam-pastel.sh'
  'seedflip-abyss.sh'
  'seedflip-amethyst.sh'
  'seedflip-canopy.sh'
  'seedflip-carbon.sh'
  'seedflip-coral.sh'
  'seedflip-ember.sh'
  'seedflip-glacier.sh'
  'seedflip-inkwell.sh'
  'seedflip-ivory.sh'
  'seedflip-nightfall.sh'
  'seedflip-phosphor.sh'
  'seedflip-pulse.sh'
  'seedflip-ultraviolet.sh'
  'seedflip-voltage.sh'
  'seedflip-wavelength.sh'
  'selenized-black.sh'
  'selenized-dark.sh'
  'selenized-light.sh'
  'selenized-white.sh'
  'seoul256-light.sh'
  'seoul256.sh'
  'seoulbones-dark.sh'
  'seoulbones-light.sh'
  'seoulism.sh'
  'sequoia-monochrome-dark.sh'
  'sequoia-monochrome-light.sh'
  'sequoia-moonlight-dark.sh'
  'sequoia-moonlight-light.sh'
  'sequoia-retro-dark.sh'
  'sequoia-retro-light.sh'
  'serendipity-midnight.sh'
  'serendipity-morning.sh'
  'serendipity-sunset.sh'
  'seti.sh'
  'shades-of-purple.sh'
  'shaman.sh'
  'shel.sh'
  'shokunin.sh'
  'slate.sh'
  'sleepy-hollow.sh'
  'smyck-lost.sh'
  'smyck.sh'
  'snazzy-lost.sh'
  'snazzy-soft.sh'
  'snazzy.sh'
  'soft-server.sh'
  'solarized-darcula.sh'
  'solarized-dark-higher-contrast.sh'
  'solarized-dark-patched.sh'
  'solarized-dark.sh'
  'solarized-light.sh'
  'solarized-osaka-night.sh'
  'sonokai.sh'
  'spacedust.sh'
  'spacegray-bright.sh'
  'spacegray-eighties-dull.sh'
  'spacegray-eighties.sh'
  'spacegray.sh'
  'sparky.sh'
  'spiderman.sh'
  'spring.sh'
  'square.sh'
  'squintless.sh'
  'squirrelsong-dark.sh'
  'srcery.sh'
  'starlight.sh'
  'sublette.sh'
  'subliminal.sh'
  'sugarplum.sh'
  'sumi-linen.sh'
  'sumi-phosphor.sh'
  'summer-pop.sh'
  'sundried.sh'
  'sunset-drive.sh'
  'sweet-eliverlara.sh'
  'sweet-terminal.sh'
  'symfonic.sh'
  'synthwave-alpha.sh'
  'synthwave-everything.sh'
  'synthwave-lost.sh'
  'synthwave.sh'
  'tango-adapted.sh'
  'tango-half-adapted.sh'
  'tearout.sh'
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
  'terafox.sh'
  'terminal-basic-dark.sh'
  'terminal-basic.sh'
  'terminal-green-1999.sh'
  'terminix-dark.sh'
  'thayer-bright.sh'
  'the-hulk.sh'
  'tin.sh'
  'tinacious-design-dark.sh'
  'tinacious-design-light.sh'
  'tiwahu-dark.sh'
  'tiwahu-light.sh'
  'token-dark.sh'
  'token-light.sh'
  'tokyo-night-light.sh'
  'tokyonight-day.sh'
  'tokyonight-moon.sh'
  'tokyonight-night.sh'
  'tokyonight-storm.sh'
  'tokyonight.sh'
  'tomorrow-night-blue.sh'
  'tomorrow-night-bright.sh'
  'tomorrow-night-burns.sh'
  'tomorrow-night-eighties.sh'
  'tomorrow-night.sh'
  'tomorrow.sh'
  'toy-chest.sh'
  'traffic.sh'
  'trapped-in-amber.sh'
  'treehouse.sh'
  'twilight.sh'
  'ubuntu.sh'
  'ultra-dark.sh'
  'ultra-violent.sh'
  'under-the-sea.sh'
  'unikitty.sh'
  'ura.sh'
  'urban.sh'
  'urple.sh'
  'vacme.sh'
  'vag.sh'
  'vague.sh'
  'vaombe.sh'
  'vaporwave-control-room.sh'
  'vaporwave-sunset.sh'
  'vaughn.sh'
  'velvet-court.sh'
  'vercel.sh'
  'verdigris.sh'
  'vesper.sh'
  'vibrant-ink.sh'
  'vimbones.sh'
  'violet-dark.sh'
  'violet-light.sh'
  'violite.sh'
  'vs-code-dark.sh'
  'vs-code-light.sh'
  'warm-burnout-dark.sh'
  'warm-burnout-light.sh'
  'warm-neon.sh'
  'website.sh'
  'wez.sh'
  'whimsy.sh'
  'wild-cherry.sh'
  'wilmersdorf.sh'
  'wombat.sh'
  'wryan.sh'
  'wzoreck.sh'
  'xcode-dark-hc.sh'
  'xcode-dark.sh'
  'xcode-light-hc.sh'
  'xcode-light.sh'
  'xcode-wwdc.sh'
  'y2k-chrome.sh'
  'zenbones-dark.sh'
  'zenbones-light.sh'
  'zenbones.sh'
  'zenburn-lost.sh'
  'zenburn.sh'
  'zenburned.sh'
  'zenwritten-dark.sh'
  'zenwritten-light.sh'
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


normalize_theme_selector() {
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -e 's/\.sh$//' -e 's/[^[:alnum:]]\+/-/g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//'
}


get_theme_number_from_selector() {
  local SELECTOR="$1"
  local NORMALIZED_SELECTOR
  local INDEX
  local THEME_FILE

  NORMALIZED_SELECTOR="$(normalize_theme_selector "${SELECTOR}")"

  for INDEX in "${!THEMES[@]}"; do
    THEME_FILE="$(remove_file_extension "${THEMES[$INDEX]}")"
    if [[ "${NORMALIZED_SELECTOR}" = "${THEME_FILE}" ]]; then
      echo $((INDEX+1))
      return 0
    fi
  done

  return 1
}


print_usage() {
  echo "Usage: $0 [OPTION ...]"
  echo
  echo "When no options are provided, Gogh runs in interactive mode."
  echo
  echo "OPTION can be:"
  echo "  - a theme name/slug (e.g. Dracula or dracula)"
  echo "  - ALL (apply all themes)"
  echo
  echo "Examples:"
  echo "  $0 Dracula"
  echo "  $0 dracula nord-light"
  echo "  $0 ALL"
}


### Get length of an array
ARRAYLENGTH=${#THEMES[@]}


declare -a OPTION=()

# Allow direct CLI selection by number/name/ALL
if [[ "$1" = "--" ]]; then
  shift
fi

if [[ $# -gt 0 ]]; then
  for ARG in "$@"; do
    if [[ "${ARG}" = "-h" ]] || [[ "${ARG}" = "--help" ]]; then
      print_usage
      exit 0
    fi
  done

  for ARG in "$@"; do
    ARG_UPPER=$(echo "${ARG}" | tr '[:lower:]' '[:upper:]')

    if [[ "${ARG_UPPER}" = "ALL" ]]; then
      OPTION=($(seq 1 "${ARRAYLENGTH}"))
      break
    elif [[ "${ARG}" =~ ^[0-9]+$ ]]; then
      echo -e "${C1} ~ INVALID OPTION: '${ARG}' ~${CR}"
      echo "CLI mode accepts theme names/slugs only."
      echo "Use interactive mode for numbered selection."
      print_usage
      exit 1
    else
      ARG_THEME_NUMBER=$(get_theme_number_from_selector "${ARG}")
      if [[ -n "${ARG_THEME_NUMBER}" ]]; then
        OPTION+=("${ARG_THEME_NUMBER}")
      else
        echo -e "${C1} ~ INVALID OPTION: '${ARG}' ~${CR}"
        print_usage
        exit 1
      fi
    fi
  done
fi


# |
# | ::::::: Print logo
# |
if [[ ${#OPTION[@]} -eq 0 ]]; then
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
  [[ "$(echo "${OPTION}" | tr '[:lower:]' '[:upper:]')" == ALL ]] && OPTION=($(seq -s " " $ARRAYLENGTH))
fi

# |
# | ::::::: Get terminal
# |
if [[ -z "${TERMINAL:-}" ]]; then
  # |
  # | Check for the terminal name (depening on os)
  # | ===========================================
  OS="$(uname)"
  if [[ "$TERM" = "xterm-ghostty" ]] || [[ "$TERM_PROGRAM" = "ghostty" ]]; then
    TERMINAL="ghostty"
  elif [[ "$OS" = "Darwin" ]]; then
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
