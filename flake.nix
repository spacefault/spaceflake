{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland, anyrun, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#nixos-test
      "blueberry" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = inputs;
         modules = [ 
           ./configurations/desktop.nix
           ./common
           home-manager.nixosModules.home-manager {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.users.devin = import ./common/home.nix;
           }
           hyprland.nixosModules.default {
             programs.hyprland.enable = true;
             programs.hyprland.enableNvidiaPatches = true;
             programs.hyprland.xwayland.enable = true;
           }
         ];
      };
      "cherry" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = inputs;
         modules = [ 
          ./configurations/laptop.nix
          ./common
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.devin = import ./common/home.nix;
          }
          hyprland.nixosModules.default {
            programs.hyprland.enable = true;
            programs.hyprland.enableNvidiaPatches=false;
            programs.hyprland.xwayland.enable = true;
          }
         ];
      };
    };
  };
}
