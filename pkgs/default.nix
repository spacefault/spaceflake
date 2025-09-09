# pkgs/default.nix
{pkgs}: {
  find-ld = pkgs.callPackage ./find-ld {};
  helvetica-neue = pkgs.callPackage ./helvetica-neue {};
  sfpro = pkgs.callPackage ./sfpro {};
  mactahoe-icons = pkgs.callPackage ./mactahoe-icons {};
  mactahoe-theme = pkgs.callPackage ./mactahoe-theme {};
}
