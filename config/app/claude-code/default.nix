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
      outputStyle = "Explanatory";
      sandbox = {
        enabled = true;
        autoAllowBashIfSandboxed = true;
        allowUnsandboxedCommands = false;
        failIfUnavailable = true;
      };
    };
    skills = {
      user-facing-reply-format = ./skills/user-facing-reply-format.md;
      nix-devshell-in-sandbox = ./skills/nix-devshell-in-sandbox.md;
      role-boundary-perspective = ./skills/role-boundary-perspective.md;
      expression-perspective = ./skills/expression-perspective.md;
      content-placement-perspective = ./skills/content-placement-perspective.md;
      structure-perspective = ./skills/structure-perspective.md;
      cause-investigation = ./skills/cause-investigation.md;
    };
    rules = {
      discussion-granularity = ./rules/discussion-granularity.md;
      proposal-justification = ./rules/proposal-justification.md;
      delegation-roles = ./rules/delegation-roles.md;
      plan-mode-approval = ./rules/plan-mode-approval.md;
      design-integrity = ./rules/design-integrity.md;
      stage-alignment = ./rules/stage-alignment.md;
      fact-information-inference = ./rules/fact-information-inference.md;
    };
  };
}
