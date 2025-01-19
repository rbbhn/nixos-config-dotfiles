{
  description = "rbbhn's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # NixOS official package source, using the nixos-24.11 branch here
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix/release-24.11";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: let
    stateVersion = "24.11";
    system = "x86_64-linux";
    username = "rbbhn";
    laptop = "wing";
    desktop = "nest";
  in{
    nixosConfigurations = {

      # Laptop -----------------------------------------------------
      ${laptop} = nixpkgs.lib.nixosSystem {
        system = "${system}";
        specialArgs = let hostname = "${laptop}"; in {
          inherit inputs self stateVersion username hostname system;
        };
        modules = [

          ./common/nixos
          ./hosts/${hostname}/nixos

          home-manager.nixosModules.home-manager {
            #home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import [
              ./common/home-manager
              ./hosts/${hostname}/home-manager
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self stateVersion username system;
              hostname = "${laptop}";
            };
          }

          nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };

      # Desktop ----------------------------------------------------
      /*${desktop} = nixpkgs.lib.nixosSystem {

      };*/

    };
  };
}
