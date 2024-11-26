{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.anyrun.homeManagerModules.default];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        translate
        symbols
        stdin
        dictionary
      ];
      width = {absolute = 800;};
      x = {fraction = 0.5;};
      y = {fraction = 0.5;};
      height = {fraction = 0.3;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = null;
    };
    extraCss = ''
      window {
          background: transparent; /* rgba(0, 0, 0, 0.8); */
        }

        #match,
        #entry,
        #plugin,
        #main {
          background: transparent;
          font-family: Torus Semibold;
        }

        #match.activatable {
          padding: 6px;
          border-radius: 12px;
          color: white;
          margin-top: 4px;
        }

        #match.activatable:selected {
          background: #e79cbf;
          color: black;
        }

        #match-title,
        #match-desc {
          color: inherit;
        }

        #entry {
          color: white;
          box-shadow: none;
          border-radius: 12px;
          border: 2px solid #e79cbf;
        }

        box#main {
          background: rgba(36, 39, 58, 0.7);
          border-radius: 16px;
          padding: 8px;
          box-shadow: 0px 2px 33px -5px rgba(0, 0, 0, 0.5);
        }

        row:first-child {
          margin-top: 6px;
        }
    '';
  };
}
