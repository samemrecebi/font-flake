{
  description = "A flake for packaging fonts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nonfree-fonts = {
      url = "git+ssh://git@github.com/samemrecebi/fonts.git";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nonfree-fonts,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        packages = {
          berkeley = pkgs.stdenv.mkDerivation rec {
            pname = "BerkeleyMono";
            version = "2.001";
            src = nonfree-fonts;
            installPhase = ''
              mkdir -p $out/share/fonts/truetype/
              cp -r $src/Berkeley\ Mono/berkeley-mono/*.ttf $out/share/fonts/truetype/
              cp -r $src/Berkeley\ Mono/berkeley-mono-oblique/*.ttf $out/share/fonts/truetype/
            '';
          };
          berkeley-nf = pkgs.stdenv.mkDerivation rec {
            pname = "BerkeleyMonoNF";
            version = "2.001";
            src = nonfree-fonts;
            installPhase = ''
              mkdir -p $out/share/fonts/truetype/
              cp -r $src/Berkeley\ Mono\ Nerd\ Fonts/*.{ttf,otf} $out/share/fonts/truetype/
            '';
          };
          comiccode = pkgs.stdenv.mkDerivation rec {
            pname = "ComicCode";
            version = "1.009";
            src = nonfree-fonts;
            installPhase = ''
              mkdir -p $out/share/fonts/truetype/
              cp -r $src/Comic\ Code/TTF/*.{ttf,otf} $out/share/fonts/truetype/
            '';
          };
            comiccode-nf = pkgs.stdenv.mkDerivation rec {
            pname = "ComicCodeNF";
            version = "1.009";
            src = nonfree-fonts;
            installPhase = ''
              mkdir -p $out/share/fonts/truetype/
              cp -r $src/Comic\ Code\ Nerd\ Fonts/TTF/*.{ttf,otf} $out/share/fonts/truetype/
            '';  
          };
        };

        defaultPackage = self.packages.${system}.berkeley;
      }
    );
}
