{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    package = pkgs.unstable.starship;
    enableZshIntegration = true;
    settings = {
  format = lib.concatStrings [
    "[](#5583ca)" 
    "$os"
    "$username"
    "[](bg:#82ace1 fg:#5583ca)"  
    "$directory"
    "[](fg:#82ace1 bg:#5fb3b3)"  
    "$git_branch"
    "$git_status"
    "[](fg:#5fb3b3 bg:#66cc99)"
    "$c"
    "$elixir"
    "$elm"
    "$golang"
    "$gradle"
    "$haskell"
    "$java"
    "$julia"
    "$nodejs"
    "$nim"
    "$rust"
    "$scala"
    "[](fg:#66cc99 bg:#2b709e)" 
    "$docker_context"
    "[](fg:#2b709e bg:#0a3b5c)"
    "$time"
    "[ ](fg:#0a3b5c)"
    "$line_break$character"
  ];
  line_break = {
    disabled = false;
  };
  username = {
    show_always = true;
    style_user = "bg:#5577aa";
    style_root = "bg:#5577aa";
    format = "[$user ]($style)";
    disabled = true;
  };
  os = {
    style = "bg:#5583ca";
    disabled = false;
  };
  directory = {
    style = "bg:#82ace1";
    format = "[ $path ]($style)";
    truncation_length = 3;
    truncation_symbol = "…/";
    substitutions = {
      "Documents" = "󰈙 ";
      "Downloads" = " ";
      "Music" = " ";
      "Pictures" = " ";
    };
  };
  c = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  docker_context = {
    symbol = " ";
    style = "bg:#2b709e";
    format = "[ $symbol $context ]($style)";
  };
  elixir = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  elm = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  git_branch = {
    symbol = "";
    style = "bg:#5fb3b3";
    format = "[ $symbol $branch ]($style)";
  };
  git_status = {
    style = "bg:#5fb3b3";
    format = "[$all_status$ahead_behind ]($style)";
  };
  golang = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  gradle = {
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  haskell = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  java = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  julia = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  nodejs = {
    symbol = "";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  nim = {
    symbol = "󰆥 ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  rust = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  scala = {
    symbol = " ";
    style = "bg:#66cc99";
    format = "[ $symbol ($version) ]($style)";
  };
  time = {
    disabled = false;
    time_format = "%R"; # Hour:Minute Format
    style = "bg:#0a3b5c";
    format = "[ ♥ $time ]($style)";
  };
  character = {
    disabled = false;
    success_symbol = "[‣](bold fg:#99ffcc)"; 
    error_symbol = "[‣](bold fg:#ff9999)";   
    vimcmd_symbol = "[◂](bold fg:#99ffcc)";
    vimcmd_replace_one_symbol = "[◂](bold fg:#5583ca)";
    vimcmd_replace_symbol = "[◂](bold fg:#5583ca)";
    vimcmd_visual_symbol = "[◂](bold fg:#ffdc9e)"; 
  };
};
  };
}
