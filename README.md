WIP documentation for my Vim setup.

These are mostly for my personal use, but might be helpful to others?

## General

### first steps

Clone the repo:
`git clone git@github.com:christi3k/vimrc.git ~/.vim`

Symlink vimrc:
`ln -s ./.vim/dotvimrc ./.vimrc`

### temp directory

`mkdir ~/.tmp`

### install powerline fonts

https://github.com/powerline/fonts

```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

### initializing plugins

More details on using Git submodules and Tim Pope's Pathogen here:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

`git submodule update --init --recursive`

(Use `--recursive` to get nested submodules.)

### updating plugins

Periodically update all plugins (submodules) with:
`git submodule foreach git pull origin master`

NB: If you don't want to use _master_ branch for all plugins, you'll need to go into each submodule directory and pull from the branch you want.

### helpdocs

generate help docs (with Pathogen):
`:Helptags`

## Plugins

### Ack

https://github.com/mileszs/ack.vim

`brew install ack`

### ansible-vim

[pearofducks/ansible-vim: A vim plugin for syntax highlighting Ansible's common filetypes](https://github.com/pearofducks/ansible-vim)

### base16-vim

https://github.com/chriskempson/base16-vim/

Provides base-16 colors for Vim.

No additional setup required.

### bufexplorer

https://github.com/jlanzarotta/bufexplorer

no other special setup required

### command-t

https://github.com/wincent/command-t

make sure you have ruby support compiled into vim

check to make sure version of ruby compiled with Vim is available on the system. the output of these two commands should match:

```
$ ruby puts "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"

$ ruby --version
```

Next compile the ruby extension

```
cd bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
```

warning encountered 5/22/2018 but doesn't seem to be an issue:

```
linking shared-object ext.bundle
ld: warning: directory not found for option '-L/BuildRoot/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.Internal.sdk/usr/local/libressl/lib'
ld: warning: directory not found for option '-L/BuildRoot/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.Internal.sdk/usr/local/lib'
ld: warning: directory not found for option '-L/BuildRoot/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.Internal.sdk/usr/local/libressl/lib'
ld: warning: directory not found for option '-L/BuildRoot/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.Internal.sdk/usr/local/lib'
```

### dash

https://github.com/rizzatti/dash.vim

Interface for [Dash.app](http://kapeli.com/).

No additional setup required. (Other than needing to have Dash installed.)

### delimitMate

https://github.com/vim-scripts/delimitMate.vim.git

(Note sure if I still need this.)

### fugitive

https://github.com/tpope/vim-fugitive.git

Git wrapper.

### NERDtree

https://github.com/scrooloose/nerdtree

No additional setup required.

### python syntax

https://github.com/vim-python/python-syntax

### ragtag

https://github.com/tpope/vim-ragtag

> A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml)

### rigel (colorscheme)

https://github.com/Rigellute/rigel

### SimpylFold

Folding for python files.

https://github.com/tmhedberg/SimpylFold

No additional setup required.

### supertab

`Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).`

https://github.com/ervandew/supertab

No additional setup required.

### surround

https://github.com/tpope/vim-surround

### syntastic

https://github.com/vim-syntastic/syntastic

DEPRECATED

Consider switching to: https://github.com/dense-analysis/ale

### taboo

https://github.com/gcmt/taboo.vim

> Taboo aims to ease the way you set the vim tabline. In addition, Taboo provides fews useful utilities for renaming tabs.

### tagbar

https://github.com/majutsushi/tagbar

`brew install ctags`

### ultisnips

https://github.com/SirVer/ultisnips

No additional setup required.

### vim-airline

https://github.com/vim-airline/vim-airline

No additional setup required.

### vim-airline-themes

https://github.com/vim-airline/vim-airline-themes

### vim-bbye

https://github.com/moll/vim-bbye

> Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.

### vim-buffer

https://github.com/bagrat/vim-buffet

> Brings you the IDE-like tabs into Vim, for easy navigation, and a nice, customizable look

### vim-colorscheme-switcher

https://github.com/xolox/vim-colorscheme-switcher

### vim-devicons

https://github.com/ryanoasis/vim-devicons

Adds icons to plugins.

### vim-gitgutter

https://github.com/airblade/vim-gitgutter

No addtiional setup required.

### vim-go

https://github.com/fatih/vim-go

Go language support for Vim.

### vim-hashicorp-tools

https://github.com/hashivim/vim-hashicorp-tools


### vim-markdown

[plasticboy/vim-markdown: Markdown Vim Mode](https://github.com/plasticboy/vim-markdown)

No addtiional setup required.

### vim-misc

https://github.com/xolox/vim-misc

Not sure if this is still needed.

### vim-open-url

[dhruvasagar/vim-open-url: A simple plugin for opening urls in browser](https://github.com/dhruvasagar/vim-open-url)

(mostly using because of netrw bug where gx uses curl to download and edit url rather than opening)

### vim-rhubarb

https://github.com/tpope/vim-rhubarb

"If fugitive.vim is the Git, rhubarb.vim is the Hub."

No additional setup required.

### vim-snippets

https://github.com/honza/vim-snippets

Snippets files for various programming languages.

### vim-startify

https://github.com/mhinz/vim-startify

The fancy start screen for Vim.

### vim-table-mode

https://github.com/dhruvasagar/vim-table-mode

VIM Table Mode for instant table creation.

### vim-unimpaired

https://github.com/tpope/vim-unimpaired

Pairs of handy bracket mappings.

### vim-which-key

https://github.com/liuchengxu/vim-which-key

Vim plugin that shows keybindings in popup.

### YouCompleteMe

https://github.com/valloric/youcompleteme

Code completion.

[Installation](https://github.com/valloric/youcompleteme#installation).

### zeavim.vim

https://github.com/KabbAmine/zeavim.vim

Zeavim allows to use the offline documentation browser Zeal from Vim.

No additional setup required.

