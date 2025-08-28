{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  name = "helvetica-neue";
  version = "1.0.0";

  src = fetchzip {
    url = "https://font.download/dl/font/helvetica-neue-5.zip";
    stripRoot = false;
    hash = "sha256-1igmVcygKvk/rEBz2vkEvEi3VAUYDZ19NsB8oVlakeM=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 HelveticaNeue*.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "";
    description = "Helvetica Neue";

    platforms = platforms.all;
    maintainers = with maintainers; [ ];
  };
}
