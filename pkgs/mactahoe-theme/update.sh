#!/usr/bin/env bash
set -euo pipefail

file="pkgs/mactahoe-gtk-theme/default.nix"
owner="vinceliuice"
repo="MacTahoe-gtk-theme"

# always define the headers array, even if empty
headers=()
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  headers+=(-H "authorization: bearer $GITHUB_TOKEN")
fi

echo "* fetching latest release info..."
release_json=$(curl -fsSL "${headers[@]}" "https://api.github.com/repos/$owner/$repo/releases/latest")

tag=$(jq -r .tag_name <<< "$release_json")

if [[ -z "$tag" || "$tag" == "null" ]]; then
  echo "* error: could not determine latest release tag"
  exit 1
fi

echo "* latest release tag: $tag"

current_rev=$(grep 'rev =' "$file" | sed -E 's/.*"([^"]+)".*/\1/')

if [[ "$tag" == "$current_rev" ]]; then
  echo "* no update needed, already at tag $tag"
  exit 0
fi

echo "* prefetching git source for tag $tag..."
src_json=$(nix store prefetch-git --url "https://github.com/$owner/$repo.git" --rev "$tag" --json --quiet)
hash=$(jq -r .sha256 <<< "$src_json")

escaped_hash=$(sed 's|/|\\/|g' <<< "$hash")

echo "* updating $file..."
sed -i \
  -e "s|rev = .*;|rev = \"$tag\";|" \
  -e "s|hash = .*;|hash = \"$hash\";|" \
  "$file"

echo "* updated $file to tag $tag with new hash"
exit 0

