{ pkgs ? import <nixpkgs> {}, ... } :
let
in pkgs.mkShell {
  buildInputs = with pkgs; [ nodePackages.coffee-script ];
  shellHook = ''
    coffee -b -c *.coffee
  '';
}
