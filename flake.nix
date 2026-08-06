{
  description = "Development shell for alexgrover.me";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          name = "alexgrover.me";
          packages = [
            pkgs.bun
            pkgs.nodejs_22
            pkgs.typescript-language-server
          ];
        };
      });
}
