{ config
, lib
, ...
}:
let
  cfg = config.telperion.security.clamav;
in
{
  options.telperion.security.clamav = {
    enable = lib.mkEnableOption "default clamav configuration";
  };

  config = lib.mkIf cfg.enable {
    services.clamav = {
      daemon = {
        enable = true;
      };

      fangfrisch = {
        enable = true;
      };

      scanner = {
        enable = true;
        interval = "weekly";
        scanDirectories = [
          "/home"
          "/tmp"
          "/var/lib"
          "/var/log"
          "/var/tmp"
        ];
      };

      updater = {
        enable = true;
      };
    };
  };
}
