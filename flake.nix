{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  };
  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forEachSystem = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forEachSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default =
            with pkgs;
            mkShell {
              nativeBuildInputs = [
                codespell
                envsubst
                ffmpeg
                git
                hk
                lua
                nil
                nixfmt
                weidu
                yamlfmt
              ];
            };
        }
      );
      formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
