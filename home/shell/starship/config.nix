{
  config,
  default,
  pkgs,
  ...
}:{
  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_mocha";
      add_newline = true;
      format = ''
        $hostname$directory$git_branch
        $character

      '';

      username = {
        show_always = true;
        style_user = "green bold";
        style_root = "red bold";
        format = "[$user]($style) in";
        disabled = true;
      };

      hostname = {
        ssh_only = true;
        format = "[$ssh_symbol$hostname](bold yellow) in ";
        trim_at = ".";
        disabled = false;
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
        style = "bold italic lavender";
      };

      git_branch = {
        symbol = " ";
        style = "bold yellow";
      };

      character = {
        success_symbol = "[﬌](bold green)";
        error_symbol = "[✗](bold red)";
      };

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
