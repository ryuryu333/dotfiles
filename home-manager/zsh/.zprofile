eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# https://github.com/nix-darwin/nix-darwin/issues/1237
# . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
. "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
