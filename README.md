<h1 align="center">spaceflake - personal NixOS flake</h1>

# Synopsis
This is my personal NixOS flake, it is intended for personal use so please be careful as there might be some issues.

# File Structure

```
.
├── flake.lock
├── flake.nix
├── home
│   ├── blueberry.nix # home file for desktop
│   ├── cherry.nix # home file for laptop
│   ├── programs # programs not needed for wayland session but nice to have
│   ├── terminal # terminal related dotfiles (neovim, tmux, etc)
│   └── wayland # files needed for wayland session
├── modules
│   ├── desktop.nix # desktop module
│   ├── gaming.nix # gaming specific settings
│   └── nvidia.nix # nvidia driver module
├── profiles
│   ├── blueberry.nix # file for desktop
│   └── cherry.nix # file for laptop
└── README.md
```

# Issue Tracking
Please use the issues tab to make relevant issues. Thank you!

