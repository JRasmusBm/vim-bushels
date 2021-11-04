## Vim Bushels

> Snippets. Vim style.

### Motivation

Most snippet engines today are based around completion. The interaction is akin
to searching for the snippet you want. This approach is great if the snippet
library you are using was written / configured by somebody else. For people that
like to set up their own snippets and use them at the speed of thought, there is
a better way.

This plugin is very minimal, providing helper functions that push you to set up
insert mode mappings instead. This allows you to avail yourself of the entire
power of vim (including leaving insert mode) as part of your snippets. In
addition to the extreme power, this practice will help you develop your ability
to edit and reason about macros and `:normal` with much greater ease, since
that's how you think about your snippets as well.

### Installation

I personally use the built-in `neovim` package manager, but you can use your
favorite plugin manager to install it.

```vim
Plug 'JRasmusBm/vim-bushels'
```

### Function Reference

In the context of vim-bushels, we use the symbol sequence `<++>` to represent
a "marker". These are jump points that you can use in your snippets to make sure
that you can quickly move around a snippet once you've inserted it.

```vim
function bushels#forward_marker(n)
```

Jumps forwards to the nth (1-based) marker, deletes the marker, and enters
insert mode on that position. Can be mapped using `<Plug>BushelsForwardMarker`.

```vim
function bushels#forward_marker(n)
```

Jumps backwards to the nth (1-based) marker, deletes the marker, and enters
insert mode on that position. Can be mapped using `<Plug>BushelsBackwardMarker`.

```vim
function bushels#delete_marker(n)
```

Jumps forward to the nth (1-based) marker and deletes the marker, but stays in
normal mode. Can be mapped using `<Plug>BushelsDeleteMarker`.

```vim
function bushels#delete_marker_row(n)
```

Jumps forward to the nth (1-based) marker and deletes the row that marker is on,
leaving the user in normal mode. Can be mapped using
`<Plug>BushelsDeleteMarkerRow`.

```vim
function bushels#delete_all_markers(n)
```

Deletes all markers in the file, leaving the cursor where it was, preserving
mode and cursor position. Can be mapped using `<Plug>BushelsDeleteAllMarkers`.

### My configuration

I use the following mappings for bushels. They ensure that I can quickly place
and jump between markers as desired.

```vim
inoremap <leader><leader> <++>

imap <leader>dd <Plug>BushelsDeleteMarkerRow
nmap <leader>dd <Plug>BushelsDeleteMarkerRow

imap <leader>dm <Plug>BushelsDeleteMarker
nmap <leader>dm <Plug>BushelsDeleteMarker

imap <leader>da <Plug>BushelsDeleteAllMarkers
nmap <leader>da <Plug>BushelsDeleteAllMarkers

imap <leader>G <Plug>BushelsBackwardMarker
nmap <leader>G <Plug>BushelsBackwardMarker

imap <leader>g <Plug>BushelsForwardMarker
nmap <leader>g <Plug>BushelsForwardMarker
```

In my vim configuration folder I define a folder of
[snippets](https://github.com/JRasmusBm/dotfiles/tree/main/vim/snippets). Each
of these snippets start with `;`, since it is highly unusual to have text
characters follow a `;` in code and/or prose.
I source these by filetype from each
[ftplugin](https://github.com/JRasmusBm/dotfiles/tree/main/vim/ftplugin). This
ensures that I have a decoupling between filetypes and snippets, such that
I (for example) can source the HTML snippets into JavaScript files.

One example from my [vim snippets]() shows that I have a mapping for creating
snippets, so that actually creating a snippet during the work-day if I find
a new use-case is pain-free, prompting me to do so sooner rather than later.

### Credits

- The original inspiration for this plugin came from [this video by Luke
  Smith](https://youtu.be/Mphdtdv2_xs?t=304) that I saw around 5 years ago.
