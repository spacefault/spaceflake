# xz was backdoored, please see the following:
#
# https://nvd.nist.gov/vuln/detail/CVE-2024-3094
# https://access.redhat.com/security/cve/CVE-2024-3094
# https://github.com/advisories/GHSA-rxwq-x6h5-x525
# https://github.com/NixOS/nixpkgs/issues/300055
# https://www.openwall.com/lists/oss-security/2024/03/29/4
#
# this is a temporary patch until the rollbacked version of xz is available in nixos-unstable
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
system.replaceRuntimeDependencies = [
        {
            original = pkgs.xz;
            replacement = inputs.nixpkgs-staging-next.legacyPackages.${pkgs.system}.xz;
        }
    ]; 
}
