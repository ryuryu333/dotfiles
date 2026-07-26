{
  home.shellAliases = {
    # PR マージ後の定型操作
    gmain = ''
      git switch main &&
      git pull origin main &&
      git branch --merged main --format='%(refname:short)' |
      grep -Fxv main |
      xargs git branch -d
    '';
  };
}
