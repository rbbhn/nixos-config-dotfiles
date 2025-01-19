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

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    stateVersion = "24.11";
    system = "x86_64-linux";
    username = "rbbhn";
    laptop = "wing";
    desktop = "nest";
  in{
    nixosConfigurations = {
      # Laptop=======================================================
      ${laptop} = nixpkgs.lib.nixosSystem {

        system = "${system}";

        modules = let hostname = "${laptop}"; in [
          ./common/nixos # Import common NixOS modules
          ./hosts/${hostname}/nixos # Import machine-specific NixOS modules

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = { ... }: { imports = [
                ./common/home-manager # Import common home-manager modules
                ./hosts/${hostname}/home-manager # Import machine-specific home-manager modules
              ]; };

              extraSpecialArgs = {
                inherit inputs self stateVersion username hostname system;
              };
            };
          }
        ];

        specialArgs = let hostname = "${laptop}"; in {
          inherit inputs self stateVersion username hostname system;
        };
      };


      # Desktop======================================================
      /*${desktop} = nixpkgs.lib.nixosSystem {

      };*/
    };
  };
}
