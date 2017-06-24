# dotfiles
vim, zsh and other dotfiles

# Installation

```
git clone https://github.com/nshahm/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && chmod +x install.sh && ./install.sh
```
## vim cheatsheets
<a link="http://www.worldtimzone.com/res/vi.html" target="_blank">http://www.worldtimzone.com/res/vi.html</a>

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

### Fold & unfold
```
<leader>zi - switch folding on or off
<leader>za - toggle current fold open/closed
<leader>zc - close current fold
<leader>zR - open all folds
<leader>zM - close all folds
<leader>zv - expand folds to reveal cursor
```

### Comment & Uncomment
```
<leader>ci - toggle comment
<leader>cs - custom comment
<leader>cu - Uncomments the selected line
```

### Find and Replace
```
<leader>vv  - Grep for the word under the cursor, match all occurences, like |gstar|
<leader>vV  - Grep for the word under the cursor, match whole word, like |star|
<leader>va  - Like vv, but add to existing list
<leader>vA  - Like vV, but add to existing list
<leader>vr  - Perform a global search on the word under the cursor and prompt for a pattern with which to replace it.
<leader>vo  - Select the files to search in and set grep options
<leader>vy* - Invoke any option from the options explorer, where * is the shortcut for that option.
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

**Windows**
```
C-a 1 ...      switch to window 1, ..., 9, 0
C-a 9
C-a 0
C-a p          previous window
C-a n          next window
C-a l          ‘last’ (previously used) window
C-a w          choose window from a list
prefix + ,       => rename window
```

**Resizing tmux panes**
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
TAB         -> Go to next buffer
Shift + TAB -> Go to prev buffer
```

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
