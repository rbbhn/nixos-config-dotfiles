{
  description = "rbbhn's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # NixOS official package source, using the nixos-24.11 branch here
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    ghostty.url = "github:ghostty-org/ghostty";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    stateVersion = "";
    system = "x86_64-linux";
    username = "rbbhn";
    laptop = "wing";
    desktop = "nest";
  in {
    nixosConfigurations = {

      # Laptop -----------------------------------------------------
      ${laptop} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = let
          hostname = ${laptop}
        in {
          inherit
            inputs
            self
            stateVersion
            username
            hostname
            system
          ;
        };
        modules = [
          ./hosts/wing/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              hostname = "wing";
            };
            home-manager.users.rbbhn = import ./modules/home/rbbhn;
          }
        ];
      };

      # Desktop ----------------------------------------------------
      ${desktop} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nest/configuration.nix
        ];
      };

    };
  };
}
