{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home
  ];
  banana-hm = {
    displays = [
      {
        name = "DP-3";
        hyprland = "3440x1440@165,0x0,1.25";
        workspaces = [1 2 3 4 5 6 7 8 9 10];
      }
      {
        name = "DP-1";
        hyprland = "2560x1440@144,2752x0,1.25";
        workspaces = [11 12 13 14 15 16 17 18 19 20];
      }
    ];
  };
}