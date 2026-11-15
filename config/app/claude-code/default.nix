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
      permissions.defaultMode = "auto";
      permissions.blockWritesOutsideWorkingDirectories = true;
      permissions.blockReadsOutsideWorkingDirectories = true;
      promptSuggestionEnabled = false;
      showTurnDuration = false;
      spinnerTipsEnabled = false;
      preferredNotifChannel = "terminal_bell";
      sandbox = {
        enabled = true;
        autoAllowBashIfSandboxed = true;
        allowUnsandboxedCommands = false;
        failIfUnavailable = true;
      };
    };
    skills = ./skills;
    rulesDir = ./rules;
  };
}
