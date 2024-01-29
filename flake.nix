{
  description = "spaceflake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    watershot = {
      url = "github:Kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    shadower = {
      url = "github:n3oney/shadower";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    anyrun,
    watershot,
    home-manager,
    shadower,
    nix-gaming,
    ...
  } @ inputs: {
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#nixos-test
      "blueberry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./modules/core
          ./modules/gaming
          ./modules/nvidia
          ./systems/desktop/desktop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lily = import ./home/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
      "cherry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./modules/core
          ./systems/laptop/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lily = import ./home/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
      ## servers:
      "daisy" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./systems/daisy
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daisyadmin = import ./home/daisy/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
    };
  };
}
