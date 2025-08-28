{
  description = "spaceflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    lanzaboote.url = "github:nix-community/lanzaboote";
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    nixvim.url = "github:nix-community/nixvim";
    anyrun.url = "github:anyrun-org/anyrun";
    #hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprlock.url = "github:hyprwm/hyprlock";
    stylix = {
      url = "github:nix-community/stylix";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    myPkgs = import ./pkgs {inherit pkgs; };
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      "cherry" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs myPkgs;};
        modules = [./profiles/cherry.nix stylix.nixosModules.stylix ];
      };
      "hifn" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs myPkgs;};
        modules = [./profiles/hifn.nix stylix.nixosModules.stylix ];
      };
    };
    homeConfigurations = {
      "devin@cherry" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs myPkgs;};
        modules = [./home/cherry.nix  stylix.homeModules.stylix ];
      };
      "devin@hifn" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs myPkgs;};
        modules = [./home/hifn.nix stylix.homeModules.stylix ];
      };
      "devin@pop2" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/pop2.nix];
      };
    };
  };
}
