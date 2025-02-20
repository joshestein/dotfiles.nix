# Home-manager stuff that should only be applied on Linux
{ config, lib, pkgs, ... }:

{
  home.file = {
    ".local/bin" = {
      source = ../scripts;
      recursive = true;
    };
  };

  systemd.user.services = {
    playerctld = {
      Unit = {
        Description = "Keep track of media player activity";
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.playerctl}/bin/playerctld daemon";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };

    pulseaudio = {
      Unit = {
        Description = "PulseAudio Sound System";
        Documentation = "man:pulseaudio(1)";
        After = [ "sound.target" ];
      };

      Service = {
        Type = "notify";
        ExecStart = "${pkgs.pulseaudioFull}/bin/pulseaudio";
        Restart = "always";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
