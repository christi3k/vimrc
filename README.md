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

`git submodule update --init`

### updating plugins

Periodically update all plugins (submodules) with:
`git submodule foreach git pull origin master`

### helpdocs

generate help docs (with Pathogen):
`:Helptags`

## Plugins

### Ack

https://github.com/mileszs/ack.vim

`brew install ack`

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


### NERDtree

https://github.com/scrooloose/nerdtree

No additional setup required.

### supertab

`Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).`

https://github.com/ervandew/supertab

No additional setup required.

### tagbar

https://github.com/majutsushi/tagbar

`brew install ctags`

### ultisnips

https://github.com/SirVer/ultisnips

No additional setup required.

### vim-airline

https://github.com/vim-airline/vim-airline

No additional setup required.

### vim-gitgutter

https://github.com/airblade/vim-gitgutter

No addtiional setup required.

### vim-markdown

https://github.com/tpope/vim-markdown

No addtiional setup required.

### vim-rhubarb

https://github.com/tpope/vim-rhubarb

"If fugitive.vim is the Git, rhubarb.vim is the Hub."

No additional setup required.

### YouCompleteMe

https://github.com/valloric/youcompleteme

Code completion.

[Installation](https://github.com/valloric/youcompleteme#installation).

### zeavim.vim

https://github.com/KabbAmine/zeavim.vim

Zeavim allows to use the offline documentation browser Zeal from Vim.

No additional setup required.

