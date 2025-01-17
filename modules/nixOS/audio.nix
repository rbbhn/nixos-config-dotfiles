{  pkgs, ... }: {
  hardware.pulseaudio.enable = false; # Disable pulseaudio
  services.pipewire = { # Enable audio with pipewire
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; # If you want to use JACK applications, uncomment this line
  };
  security.rtkit.enable = true; # Needed for PulseAudio to work properly
}
