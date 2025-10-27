if status is-interactive
    # Commands to run in interactive sessions can go here
end

jump shell fish | source

alias cr="cursor"
alias ga="git add ."
alias gs="git status"
alias nd="npm run dev"
alias ni="npm install"
alias bd="bun --bun run dev"
alias bi="bun install"
alias sws="static-web-server"
alias pbs="./pocketbase serve"
# alias cursor="~/Applications/Cursor_0ec6c12a061af79a840403cc4b4ab235.AppImage"
alias c="clear"
alias telegram="flatpak run org.telegram.desktop"
alias simplenote="flatpak run com.simplenote.Simplenote"
alias cointop="flatpak run com.github.miguelmota.Cointop"

set -Ux XDG_DATA_DIRS $XDG_DATA_DIRS /var/lib/flatpak/exports/share ~/.local/share/flatpak/exports/share

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# fly
set --export FLYCTL_INSTALL "$HOME/.fly"
set --export PATH $FLYCTL_INSTALL/bin $PATH

# rust
set --export RUST_CARGO "$HOME/.cargo"
set --export PATH $RUST_CARGO/bin $PATH

# encore
set --export ENCORE_INSTALL "$HOME/.encore"
set --export PATH $ENCORE_INSTALL/bin $PATH

# go
set --export GOLANG "$HOME/go"
set --export PATH $GOLANG/bin $PATH

# android
set -x JAVA_HOME /opt/android-studio/jbr
set -x ANDROID_HOME $HOME/Android/Sdk
set -x NDK_HOME $ANDROID_HOME/ndk/(ls -1 $ANDROID_HOME/ndk)

set -x CAPACITOR_ANDROID_STUDIO_PATH /opt/android-studio/bin/studio.sh

zoxide init fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
fish_add_path $HOME/.local/bin
# set -gx VOLTA_HOME "$HOME/.volta"
# set -gx PATH "$VOLTA_HOME/bin" $PATH

# Dotfiles management with bare Git repository
function config
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end

starship init fish | source

set -gx EDITOR /usr/bin/cursor
# pnpm
set -gx PNPM_HOME "/home/gevera/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
