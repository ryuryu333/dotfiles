{
  pkgs,
  llm-agents,
  ...
}:
{
  programs.claude-code = {
    enable = true;
    package = llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.claude-code;
    settings = {
      language = "japanese";
      axScreenReader = true;
    };
  };
}
