{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/4aa36568d413aca0ea84a1684d2d46f55dbabad7";
    nix-gaming.url = "github:fufexan/nix-gaming";
    lanzaboote.url = "github:nix-community/lanzaboote";
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    nixvim.url = "github:nix-community/nixvim";
    anyrun.url = "github:anyrun-org/anyrun";
    hyprland = {
      url = "github:hyprwm/hyprland/f5fa84554ffe55e29a397014964238be89ffa54d";
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
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      "cherry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./profiles/cherry.nix
          # inputs.disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.devin = import ./home/cherry.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
      "blueberry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./profiles/blueberry.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.devin = import ./home/blueberry.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
    };
  };
}
