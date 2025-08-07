{ inputs
}:
{
  # System configuration builders
  mkSystem = import ./mk-system.nix { inherit inputs; };
  mkHome = import ./mk-home.nix { inherit inputs; };

  # Common utilities used by system builders
  common = import ./common.nix { inherit inputs; };
}
