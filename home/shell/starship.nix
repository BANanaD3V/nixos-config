{
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      palette = "base16";
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
        format = "[$hostname](bold yellow) in ";
        trim_at = ".";
        disabled = false;
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
        style = "bold italic cyan";
      };

      git_branch = {
        symbol = " ";
        style = "bold blue";
      };

      character = {
        success_symbol = "[﬌](bold green)";
        error_symbol = "[✗](bold red)";
      };

      palettes.base16 = with config.colorScheme.palette; {
        blue = "#${base07}";
        red = "#${base08}";
        orange = "#${base09}";
        green = "#${base0B}";
        yellow = "#${base0A}";
        cyan = "#${base07}";
      };
    };
  };
}
