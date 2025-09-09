{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gitUpdater,
  gtk3,
  sass,
  hicolor-icon-theme,
  jdupes,
  schemeVariants ? [],
  colorVariants ? [], # default is blue
}: let
  pname = "mactahoe-icon-theme";
in
  lib.checkListOfEnum "colloid-icon-theme: scheme variants"
  [
    "default"
    "nord"
    "dracula"
    "gruvbox"
    "everforest"
    "catppuccin"
    "all"
  ]
  schemeVariants
  lib.checkListOfEnum
  "colloid-icon-theme: color variants"
  [
    "default"
    "purple"
    "pink"
    "red"
    "orange"
    "yellow"
    "green"
    "teal"
    "grey"
    "all"
  ]
  colorVariants
  stdenvNoCC.mkDerivation
  rec {
    inherit pname;
    version = "2025-08-13";

    src = fetchFromGitHub {
      owner = "vinceliuice";
      repo = "mactahoe-icon-theme";
      rev = version;
      hash = "sha256-Iy4vN8PjtZuWyANP+6TQGok0sB/ST6+mMOkdPUfufFY=";
    };

    nativeBuildInputs = [
      gtk3
      jdupes
      sass
    ];

    propagatedBuildInputs = [
      hicolor-icon-theme
    ];

    dontDropIconThemeCache = true;
    dontPatchELF = true;
    dontRewriteSymlinks = true;

    postPatch = ''
      patchShebangs install.sh
    '';

    installPhase = ''
      runHook preInstall
      ./install.sh -d $out/share/icons
      jdupes --link-soft --recurse $out/share

      runHook postInstall
    '';

    meta = with lib; {
      description = "mactahoe icon theme";
      homepage = "https://github.com/vinceliuice/mactahoe-icon-theme";
      license = licenses.gpl3Only;
      platforms = platforms.unix;
      maintainers = with maintainers; [polandlover123];
    };
  }
