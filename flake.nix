{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    anyrun.url = "github:anyrun-org/anyrun";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    lanzaboote.url = "github:nix-community/lanzaboote";
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    nixvim.url = "github:nix-community/nixvim";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nixpkgs-stable,
    blender-bin,
    home-manager,
    nixvim,
    spicetify-nix,
    anyrun,
    watershot,
    hyprland-contrib,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      "cherry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./systems/laptop/laptop.nix
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
    };

    homeConfigurations = {
      "lily@cherry" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/cherry.nix
          nixvim.homeManagerModules.nixvim
          spicetify-nix.homeManagerModules.default
          anyrun.homeManagerModules.default
        ];
      };
    };
  };
}
