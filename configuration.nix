# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  imports =
    [ 
	./hardware-configuration.nix
        inputs.home-manager.nixosModules.default
	./apps/vim
	./apps/dev/c
    ];

  networking.hostName = "dednix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ded = {
    isNormalUser = true;
    description = "ded";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "ded" = import ./home.nix; };
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "ded";

  #sys pkgs
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    fd
    fzf
    eza
    lsd
    htop
    flatpak
    gh
    gh-dash
    git
    kitty
    lazygit
    nix-prefetch-github
    python3
    python3Packages.pip
    python3Packages.pynvim
    pyenv
    vimPlugins.vim-plug
    vim_configurable
    vscodium
  ];

  fonts = {
  enableDefaultPackages = true;
  packages = with pkgs; [ 
    fira-code-nerdfont
   ];

  fontconfig = {
    defaultFonts = {
      monospace = [ "Firacode Nerd Font" ];
      serif = [ "Firacode Nerd Font" ];
      sansSerif = [ "Firacode Nerd Font" ];
      };
    };
  };

  # Enable Flatpak in the system and add the Flathub repository
  services.flatpak.enable = true;

  # Activation script to add Flathub and install Chrome and Brave
  system.activationScripts.installFlatpakApps = lib.mkAfter ''
    # Path to the Flatpak binary
    FLATPAK=${pkgs.flatpak}/bin/flatpak

    # Add the Flathub repository if it does not already exist
    if ! $FLATPAK remote-list | grep -q flathub; then
      $FLATPAK remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    # Install Chrome and Brave browsers if they are not already installed
    if ! $FLATPAK list | grep -q com.google.Chrome; then
      $FLATPAK install -y flathub com.google.Chrome
    fi

    if ! $FLATPAK list | grep -q com.brave.Browser; then
      $FLATPAK install -y flathub com.brave.Browser
    fi
  '';

    programs.bash = {
    shellAliases = {
      nt = "sudo nixos-rebuild test --flake /etc/nixos#default";
      ns = "sudo nixos-rebuild switch --flake /etc/nixos#default";
    };
  };
}
