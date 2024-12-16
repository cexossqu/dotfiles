{
  filterUserNix = paths: builtins.filter (path: builtins.match ".*-user\\.nix$" path != null) paths;
  filterNonUserNix = paths: builtins.filter (path: builtins.match ".*-user\\.nix$" path == null) paths;
}

