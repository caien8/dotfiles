{ config, lib, pkgs, ... }:

let
  buildTheme = { name, version, src, themeIni ? [] }:
    pkgs.stdenv.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;

      buildCommand = ''
        dir=$out/share/sddm/themes/${name}
        doc=$out/share/doc/${pname}

        mkdir -p $dir $doc
        if [ -d $src/${name} ]; then
          srcDir=$src/${name}
        else
          srcDir=$src
        fi
        cp -r $srcDir/* $dir/
        for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
          test -f $f && mv $f $doc/
        done
        chmod 444 $dir/theme.conf

        ${lib.concatMapStringsSep "\n" (e: ''
          ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf \
            "${e.section}" "${e.key}" "${e.value}"
        '') themeIni}
      '';
    };

  customTheme = builtins.isAttrs theme;

  theme = themes.sugar-candy;

  themeName = if customTheme
  then theme.pkg.name
  else theme;

  packages = if customTheme
  then [ (buildTheme theme.pkg) ] ++ theme.deps
  else [];

  themes = {

    sugar-candy = {
      pkg = rec {
        name = "sugar-candy";
        #version = "c0186b629bf77cfebdc5bee2ec50b23c9107ec56";
	version = "5c8914e43e8aa983295968442945f55747d5d7bc";
        src = pkgs.fetchFromGitHub {
          owner = "caien8";
          repo = "sddm-${name}";
          rev = "${version}";
          #sha256 = "1z4ya5y9gkrgf0ckyfqfrbd0l3a8vkqss69r2m26g1b4rzfbxv74";
	  sha256 = "1vsf9kamjj9d5lysk86xrxnwig7c4x2yrjfjmvx371mvvgzk8yl0";
        };
      };
      deps = with pkgs; [ libsForQt5.qt5.qtgraphicaleffects ];
    };

    where-is-my-sddm = {
      pkg = rec {
         name = "where-is-my-sddm";
	 version = "1457631fa87dd4139d45bd9ef38359c13bf0b269";
	 src = pkgs.fetchFromGitHub { 
	    owner = "stepanzubkov";
	    repo = "where-is-my-sddm-theme";
	    rev = "${version}";
	    sha256 = "0wm4zgmivh5jnq90df2ikl1zvmvd19bvmldh2s5syg1yk0d7xl9q";
	 };
       };
       deps = with pkgs; [];
    };

    chili = {
      pkg = rec {
        name = "chili";
        version = "0.1.5";
        src = pkgs.fetchFromGitHub {
          owner = "MarianArlt";
          repo = "sddm-${name}";
          rev = version;
          sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
        };
	#themeIni = [
        #  { section = "General"; key = "background"; value = ./assets/background.jpg; }
        #];
      };
      deps = with pkgs; [];
    };
  };

in
{
  environment.systemPackages = packages;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = themeName;
}
