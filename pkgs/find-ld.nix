{ pkgs }:

# simple tool to find the needed libraries of a binary
# example: find-ld /path/to/binary.out

pkgs.writeShellScriptBin "find-ld" ''

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

echo "Required Shared Libraries for binary $filename"
echo

${pkgs.binutils}/bin/readelf -d "$filename" | ${pkgs.gawk}/bin/awk '
/Type[[:space:]]+Name\/Value/ {
    sub(/^[[:space:]]+/, "")
    sub(/^[^[:space:]]+[[:space:]]+/, "")
    print
    start=1
    next
}

start == 1 {
    sub(/^[[:space:]]+/, "")

    sub(/^[^[:space:]]+[[:space:]]+/, "")

    if ($0 ~ /RUNPATH/ || $0 ~ /RPATH/ || $0 ~ /NEEDED/) {
        print
    }
}
  '

''
