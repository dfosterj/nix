{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  fish
];

programs.fish.enable = true;

#programs.bash = {
#  interactiveShellInit = ''
#    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
#    then
#      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
#      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
#    fi
#  '';
#};

 programs.fish = {
    shellAliases = {
      vv = "dedvim -N -u ~/.vim/vimrc";
      nt = "sudo nixos-rebuild test --flake /etc/nixos#default";
      ns = "sudo nixos-rebuild switch --flake /etc/nixos#default";
    };
  };
}
