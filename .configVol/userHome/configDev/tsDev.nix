#########################################################################
#									#
# 1. Place this file inside your TypeScript project, name it flake.nix	#
# 2. Create an .envrc with the content below to make a direnv hook	#
# 	File: ./your-typescript-project/.envrc				#
# 	---------------------------------				#
#	| use flake			|				#
#	---------------------------------				#
# 3. Fire `direnv allow .` to setup direnv to run on this directory	#
# 
# You're all set!!
#									#
#########################################################################

{
  description = "A development nixShell for a typescript project";
  inputs = {
    # For convenient, use the unstable channel only
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs } : let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        #pkgs.nodejs_20								# NodeJS 20
	pkgs.nodejs_24								# NodeJS 24
	pkgs.pnpm								# Major Package Manager
	pkgs.biome								# Linter & Formatter
	#pkgs.eslint								# Major Linter
	#pkgs.prettier								# Major Formatter
      ];
    };
  };
}
