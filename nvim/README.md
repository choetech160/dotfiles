## Prerequisites

Inspired by the work of josean :
[Josean's github](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim)

### Install ripgrep for fuzzy finding on string (Telescope)

If you do not install ripgrep, you will be able to find files, but not strings across the files, which is annoying

```bash
# On ubuntu cosmic (18.10) or newer:
sudo apt install ripgrep
```

### Install the latest version of nvim

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository --remove ppa:neovim-ppa/stable
sudo apt install neovim
```

### Install node for Mason

Mason is leveraging node to install tsconfig, html etc, so you need node

`sudo apt i npm`

### Install the configuration

go to `~/.config`

```bash
git clone http://github.com/choetech160/Neovim_configuration nvim
```

this will create `~/.config/nvim` folder where the config will be.

Cousine font is included in the repo, but you can download your preferred font from nerdfont.com

```bash
unzip ~/.config/nvim/Cousine.zip -d ~/.fonts
nvim ~/.config/alacritty/alacritty.yml
```

modify yml file to add:

```yml
font:
    normal:
        family: CousineNerdFont / CaskaydiaCoveNerdFont
       style: Regular
```

```bash
fc-list # list fonts currently installed, if not using Cousine
fc-match fontname -s # find if specific font is installed
```

This is a [good place](https://www.behova.net/fonts-in-alacritty/) to figure how to install new fonts on alacritty

> The first time you open vim to install the fonts, you will get an error message because nothing is installed. Once installed, (you’ll see it running), press `q` to exit and your `yaml` file will be open.

## vim commands

comments

```bash
gc4j # comment 4 lines bellow
```

complete "" or switch " for ' and also add { or [ etc

```bash
ys w " # put " around word (ys movement character/word etc)
ds " # delete " and matching "
cs"' # change " to '

```

    ctrl + b to move a page screen back or “up”
    ctrl + f to move a page screen front or “down”
    ctrl + u to move a ½ page screen up
    ctrl + d to move a ½ page screen down

```
Row up and down

To move up and down a single row instead of a whole page:

    j to move 1 line down
    k to move to move 1 line up

Similar to how you navigated to specific rows, we can leverage this command to move up and down multiple rows.

    2j to move 2 lines down
    2k to move 2 lines up

Caveat

As an engineer, I use the above commands when I’m reading through code and don’t care about cursor placement. The above commands can move the screen so that I can read my entire file, but they also alter my cursor location. When I’m writing code and want to understand related functions, I tend to use other commands to keep my cursor in place. As long as my cursor does not go off-screen, I can remember my current spot while reading through the file.

    ctrl + y to move the screen up one line
    ctrl + e to move the screen down one line
    z + z to move the current line I’m on to the center of the screen
    z + t to move the current line I’m on to the top of the screen
    z + b to move the current line I’m on to the bottom of the screen
```

## Add new plugins
