# dotfiles
vim, zsh and other dotfiles

# Installation

```
git clone https://github.com/nshahm/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && chmod +x install.sh && ./install.sh
```

## vim shortcuts

```
^E - Scroll the window down
^Y - Scroll the window up
^F - Scroll down one page
^B - Scroll up one page
H  - Move cursor to top of the window
M  - Move cursor to middle of the window
L  - Move cursor to bottom of the window
gg - Go to top of the file
```

### Text objects
```
w - word
s - sentence
p - paragraph
t - tags (xml/html)
```

### Motions
```
a - all
i - in
t - 'till
f - find forward
F - find backward
```

### Commands
```
d - delete (also cut)
c - change (delete then place in insert mode)
y - yank (copy)
v - visually (select)
```

> {command} {text object or motion}

```
diw - delete in word
caw - change all word
yi) - yank all text inside parentheses
da( - it deletes including brackets.
va" - visually select all inside double quotes
ciw - then press esc, then it enables the repeat mode, then press . repeat the word.

dd / yy - delete / yank the current line
D  / C  - delete / change until end or line 
^  / $  - Move to the beginning / end of line
I  / A  - Move to the beginning / end of line and insert
o  / O  - Insert new line above / below the current line  and insert
p / P   - Paste below / above the current line
```

### Macros

**record**
```
- q { register }
- do the things
- q
```

**play**
```
@{register}
```

## Plugins:

NERDTree

```
m - shows the options
ma - adds a node with name
md - delete a node

ctrl+r = `leader`+R - opens up the files opened before
```

**benmills/vimux - ability to invoke tmux from vim**
Ex: nmap <leader>z : call VimuxRunCommand("grunt test")<cr>

### tmux

> tmux --new-session -s {session-name}

```
unbind C-a
set -g prefix C-a
bind C-a send-prefix
Change caps lock to control for ease
```

> Press prefix + I (capital I, as in Install) to fetch the plugin

**vim tmux navigator**
```
<ctrl-h> => Left
<ctrl-j> => Down
<ctrl-k> => Up
<ctrl-l> => Right
<ctrl-\> => Previous split
```
**split screen**
```
prefix + shift | -> split horizontal
prefix + shift - -> split vertical
```

**Rename**
```
prefix + shift $ -> rename session
prefix + ,       -> rename window
```

**Resizing panes**
```
prefix + shift + h
resize current pane 5 cells to the left
prefix + shift + j
resize 5 cells in the up direction
prefix + shift + k
resize 5 cells in the down direction
prefix + shift + l
resize 5 cells to the right
```

**resurrect**
```
prefix + Ctrl-s - save
prefix + Ctrl-r - restore
```

### shortcuts

```
:bf            # Go to first file.
:bl            # Go to last file
:bn            # Go to next file.
:bp            # Go to previous file.
:bw            # Close file.
```

#Golang editor shortcuts
```
leader key - '
<leader>b - go build
<leader>c - go coverage
<leader>i - go info

F7 - Toggle NERD Tree
F8 - Toggle Tagbar

]]           - Jump to next function
[[           - Jump to previous function

ctrl-] or gd - Jump to definition
ctrl-t       - Jump back to previous location

```
Ref: github.com/nicknisi/dotfiles


## TMUX plugin 