# Dotfiles for Personal Macbook
The dotfiles in this branch `personal-macbook` are configured for my personal Macbook.

## How this works
This repo uses [dotbot](https://github.com/anishathalye/dotbot) to manage dotfiles.

Everything starts in `install.conf.yaml`. `link` symlinks files in this repo to files on your machine. `shell` runs each command in the list. Running `./install` will execute the links and commands in that config file.

## Installing on Fresh Machine
1. clone this repo (anywhere)
2. Manually install tools listed in this README
3. run `./install`

## Making changes
1. Make changes to the files in this repo
2. run `./install`

To only run `link`
`./install --only link`

To only run `shell`
`.install --only shell`

See https://github.com/anishathalye/dotbot#command-line-arguments

## Installing Tools

### xcode
```
xcode-select --install
```

### zsh
```
brew install zsh
```

### VSCode
See https://code.visualstudio.com/docs/setup/mac#_installation

### VSCode Extensions
cd into this directory and run:
```
cat .vscode/extensions.txt | xargs -L 1 echo code --install-extension | bash
```

### oh my zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### pyenv
See https://github.com/pyenv/pyenv#installation

### fnm
See https://github.com/Schniz/fnm#installation

### z (file jumper)
```
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z.sh
```

### fzf (fuzzy finder)
```
brew install fzf && $(brew --prefix)/opt/fzf/install
```

### ripgrep (fast grep)
```
brew install ripgrep
```

### nvim
```
brew install nvim
```

### nvim plugins
1. Install nvim plugin manager "vim-plug"
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
2. Enter nvim, and run `:PlugInstall`

See https://github.com/junegunn/vim-plug#commands

Note: You may see this error
```
[coc.nvim] Error on execute :pyx command, ultisnips feature of coc-snippets requires pyx support on vim. use :CocOpenLog for details
```
To fix, run:
```
pip install pynvim
```

## Installing Iosekva font
See https://github.com/be5invis/Iosevka#installing-via-package-managers
```
brew tap homebrew/cask-fonts
brew install --cask font-iosevka
```

## Installing iTerm2 Theme
1. Open iTerm2 > Preferences > Profiles Tab > Other Actions > Import JSON Profiles
2. Select "iterm2/profile-justin-personal-macbook.json" from this repo.

## TODOs
[] consider migrating this repo over to a much simpler way of managing dotfiles: https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/. Mig write a script that installs the vscode extensions.
