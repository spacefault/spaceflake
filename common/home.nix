{ config, pkgs, self, user, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "devin";
  home.homeDirectory = "/home/devin";
 
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initExtra = "autoload -Uz vcs_info\nprecmd() { vcs_info }\nzstyle ':vcs_info:git:*' formats '%b '\nsetopt PROMPT_SUBST\nPROMPT='%B%F{green}%n@%m%f%b %B%F{blue}%~%f%b %B%F{red}$vcs_info_msg_0_%f%b> '";
    history = {
      path = "~/.histfile";
    };
    shellAliases = {
      grep = "grep --color";
      ip = "ip --color";
      l = "ls -lah --color";
      ls = "ls -lah --color";
    };
  }; 

  #Gtk 
#     gtk = {
#       enable = true;
#       font.name = "TeX Gyre Adventor 10";
#       theme = {
#         name = "Juno";
#         package = pkgs.juno-theme;
#       };
#       iconTheme = {
#         name = "Papirus-Dark";
#         package = pkgs.papirus-icon-theme;
#       };
# 
#       gtk3.extraConfig = {
#       Settings = ''
#         gtk-application-prefer-dark-theme=1
#       '';
#     };
# 
#       gtk4.extraConfig = {
#       Settings = ''
#         gtk-application-prefer-dark-theme=1
#       '';
#     };
#     
#   };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
