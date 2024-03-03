{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    anyrun.url = "github:Kirottu/anyrun";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    lanzaboote.url = "github:nix-community/lanzaboote";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    watershot = {
      url = "github:kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    blender-bin,
    home-manager,
    ...
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#nixos-test
      "blueberry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ({
            config,
            pkgs,
            ...
          }: {
            nixpkgs.overlays = [blender-bin.overlays.default];
            environment.systemPackages = with pkgs; [blender_4_0];
          })
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
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      "cherry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ({
            config,
            pkgs,
            ...
          }: {
            nixpkgs.overlays = [blender-bin.overlays.default];
            environment.systemPackages = with pkgs; [blender_4_0];
          })
          ./modules/core
          ./modules/gaming
          ./systems/laptop/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lily = import ./home/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      ## servers:
      "daisy" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
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
