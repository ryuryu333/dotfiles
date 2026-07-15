{ user, ... }:

{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
}
