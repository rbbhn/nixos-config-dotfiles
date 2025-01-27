{
  description = "rbbhn's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # NixOS official package source, using the nixos-24.11 branch here
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... }@inputs: let
    stateVersion = "24.11";
    system = "x86_64-linux";
    username = "rbbhn";
    laptop = "wing";
    desktop = "nest";
  in{
    overlays = {
      # Inject 'unstable' and 'trunk' into the overridden package set, so that
      # the following overlays may access them (along with any system configs
      # that wish to do so).
      pkg-sets = (
        final: prev: {
          unstable = import inputs.unstable { system = final.system; };
          # trunk = import inputs.trunk { system = final.system; };
        }
      );
    # Remaining attributes elided.
    };
    nixosConfigurations = {
      # Laptop====================================================
      ${laptop} = nixpkgs.lib.nixosSystem {

        system = "${system}";

        modules = let hostname = "${laptop}"; in [
          ./nixos # Import NixOS Modules

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./home-manager; # Import home-manager modules

              extraSpecialArgs = {
                inherit self inputs stateVersion username hostname system;
              };
            };
          }
        ];

        specialArgs = let hostname = "${laptop}"; in {
          inherit self inputs stateVersion username hostname system;
        };
      };


      # Desktop===================================================
      /*${desktop} = nixpkgs.lib.nixosSystem {

      };*/
    };
  };
}
