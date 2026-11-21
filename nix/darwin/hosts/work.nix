# nix-darwin overrides for work (work Mac), layered onto nix/darwin/.
{ ... }:
{
  homebrew.brews = [
    "aqua"
    "crossplane"
    "jira-cli"
    "kargo"
    "upbound/tap/up"
  ];
}
