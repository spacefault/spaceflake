<h1 align="center">spaceflake - personal NixOS (& home manager)  flake</h1>

# What's this?
This is my personal NixOS flake, it's intended for personal use so please be careful as there might be some issues.

# File Structure

```
.
├── flake.lock
├── flake.nix
├── home
│   ├── gaming.nix # home-manager for gaming pc
│   ├── school.nix # home-manager for school laptop
│   ├── pop2.nix # home-manager darwin for macbook
│   ├── programs # programs not needed for wayland session but nice to have
│   ├── terminal # terminal related dotfiles & code editors (neovim, tmux, emacs, etc)
│   └── wayland # files needed for wayland session (linux only)
├── modules
│   ├── desktop.nix # desktop module, always needed on nixos hosts
│   ├── gaming.nix # gaming specific settings
│   └── nvidia.nix # nvidia driver module
├── profiles
│   ├── gaming.nix # file for gaming pc
│   ├── hardware-gaming.nix # hardware conf for gaming pc
│   ├── school.nix # file for school laptop
│   └── hardware-school.nix # hardware-conf for laptop
└── README.md
```

# Issue Tracking
Please use the issues tab to make relevant issues. Thanks!

