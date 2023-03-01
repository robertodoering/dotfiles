export TERMINAL="alacritty"
export TERM="alacritty"
export EDITOR="nvim"

export BROWSER="librewolf"

export CHROME_EXECUTABLE="/bin/google-chrome-stable"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export ANDROID_SDK_ROOT="$HOME/.local/share/android/sdk"
export ANDROID_EMULATOR_HOME="$HOME/.local/share/android/emulator"

# android studio
export _JAVA_AWT_WM_NONREPARENTING=1

# gtk themes in qt apps
export QT_QPA_PLATFORMTHEME=gtk2

# ~
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java -Dawt.useSystemAAFontSettings=on"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export TMUX_CONFIG="$XDG_CONFIG_HOME"/tmux/tmux.conf
