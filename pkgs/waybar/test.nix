{ lib, config, pkgs, ... }:

let
  # Parameterized color variables
  colors = {
    background = "#2e3440";
    foreground = "#d8dee9";
    accent     = "#81a1c1";
    primary    = "#88c0d0";
    secondary  = "#5e81ac";
    danger     = "#bf616a";
    success    = "#a3be8c";
    warning    = "#ebcb8b";
    info       = "#8fbcbb";
  };

  # The configuration of Waybar
  waybarConfig = {
    bar = {
      position = "top";
      background = colors.background;
      color = colors.foreground;
    };
    modules = {
      left = [
        { module = "cpu"; format = "{cpu}%"; color = colors.primary; }
        { module = "memory"; format = "{mem}"; color = colors.success; }
      ];
      center = [
        { module = "clock"; format = "{time}"; color = colors.accent; }
      ];
      right = [
        { module = "network"; format = "{ip}"; color = colors.warning; }
      ];
    };
  };

in

{
  # The waybar config
  environment.etc."waybar/config" = {
    source = pkgs.writeText "waybar-config" (builtins.toJSON waybarConfig);
    mode = "0644";
  };

}

