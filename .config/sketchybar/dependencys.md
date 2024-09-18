# Packages

```bash
brew install lua
brew install switchaudio-osx
brew install nowplaying-cli
```

```bash
brew tap FelixKratz/formulae
brew install sketchybar
```

# Fonts

```bash
brew install --cask sf-symbols
brew install --cask homebrew/cask-fonts/font-sf-mono
brew install --cask homebrew/cask-fonts/font-sf-pro
```

```bash
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```

# SketchyBar Lua Plugin

```bash
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
```

# ICONS

Install all nerd fonts:

```bash
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
```
