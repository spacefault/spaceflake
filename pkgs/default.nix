# pkgs/default.nix

{ pkgs }:

{
  find-ld = pkgs.callPackage ./find-ld { }; 
  helvetica-neue = pkgs.callPackage ./helvetica-neue { }; 
}
