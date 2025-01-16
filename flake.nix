{
  description = "rbbhn's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # NixOS official package source, using the nixos-24.11 branch here;
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
  # Laptop -----------------------------------------------------
    nixosConfigurations.wing = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/wing/configuration.nix
      ];
    };
  # Desktop ----------------------------------------------------
    nixosConfigurations.nest = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nest/configuration.nix
      ];
    };
  };
}
