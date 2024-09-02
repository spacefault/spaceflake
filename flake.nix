{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
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
    nixpkgs-stable,
    blender-bin,
    home-manager,
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
      modules = [ ./home/cherry.nix ];
    };
  };
};
}
