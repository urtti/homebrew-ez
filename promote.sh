#!/bin/bash
set -euo pipefail

# Points the Homebrew formula at an already-published release of urtti/ez.
# Run release.sh in the ez repo first to build and publish the release.

# Check for required software
deps=(gh git shasum)
for dep in "${deps[@]}"; do
  if ! command -v "$dep" >/dev/null 2>&1; then
    echo "ERROR: Required dependency '$dep' is not installed or not in PATH. Please install it before running this script."
    exit 1
  fi
done

FORMULA_FILE="Formula/ez.rb"
if [ ! -f "$FORMULA_FILE" ]; then
  echo "ERROR: Formula file not found at $FORMULA_FILE. Run this script from the homebrew-ez repo root."
  exit 1
fi

# Safety check: ensure no files are staged
if [[ -n $(git diff --cached --name-only) ]]; then
  echo "\nERROR: You have staged files in git. Please commit or unstage them before running this script to avoid including unintended changes in the release."
  git diff --cached --name-only
  exit 1
fi

if [ $# -ne 1 ]; then
  echo "Usage: $0 <semantic-version> (e.g., 0.7.1)"
  exit 1
fi

VERSION="$1"
TAG="$VERSION"

# If tag has double v prefix, remove one of them
if [[ "$TAG" == "vv"* ]]; then
  echo "Removing double v prefix from tag..."
  TAG="${TAG:1}"
  echo "New tag: $TAG"
fi

CODE_REPO="urtti/ez"
TARBALL="ez-$TAG-macos.tar.gz"
URL="https://github.com/$CODE_REPO/releases/download/$TAG/$TARBALL"
DOWNLOAD_DIR=".promote-tmp"

# 1. Download the published asset and compute its SHA256, so the formula
# provably matches what users will download
echo "Downloading $TARBALL from $CODE_REPO release $TAG..."
rm -rf "$DOWNLOAD_DIR"
gh release download "$TAG" --repo "$CODE_REPO" --pattern "$TARBALL" --dir "$DOWNLOAD_DIR"

SHA256=$(shasum -a 256 "$DOWNLOAD_DIR/$TARBALL" | awk '{print $1}')
echo "SHA256: $SHA256"
rm -rf "$DOWNLOAD_DIR"

# 2. Update Homebrew formula
echo "Updating $FORMULA_FILE..."
sed -i '' "s|url \".*\"|url \"$URL\"|" "$FORMULA_FILE"
sed -i '' "s|sha256 \".*\"|sha256 \"$SHA256\"|" "$FORMULA_FILE"

# 3. Commit and push
echo "Committing and pushing formula update..."
git add "$FORMULA_FILE"
git commit -m "Update ez formula to $TAG"
git push

echo "Formula now points at $URL"

cat <<EOF

Next steps:
1. Test the new formula:
   brew update
   brew reinstall ez
   ez --version

EOF
