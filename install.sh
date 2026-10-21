#!/usr/bin/env sh
# Installs craft-kit into ~/.claude/skills/craft-kit (or $1) and pulls the
# bundled skills from their official repositories.
set -eu

TARGET="${1:-$HOME/.claude/skills/craft-kit}"
HERE="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

fetch() {
  mkdir -p "$TMP/$2"
  curl -fsSL "https://codeload.github.com/$1/tar.gz/HEAD" | tar xz -C "$TMP/$2" --strip-components=1
}

echo "Installing craft-kit into $TARGET"
mkdir -p "$TARGET"
rm -rf "$TARGET/impeccable" "$TARGET/transitions" "$TARGET/playwright-cli" "$TARGET/taste" "$TARGET/react-bits"
mkdir -p "$TARGET/transitions" "$TARGET/taste" "$TARGET/react-bits"
# Cloning the repo straight into the skills folder is also supported.
[ "$(cd "$TARGET" && pwd)" = "$HERE" ] || cp "$HERE/SKILL.md" "$TARGET/SKILL.md"

echo "  impeccable"
fetch pbakaus/impeccable impeccable
cp -r "$TMP/impeccable/.claude/skills/impeccable" "$TARGET/impeccable"
cp "$TMP/impeccable/LICENSE" "$TARGET/impeccable/"

echo "  transitions.dev"
fetch Jakubantalik/transitions.dev transitions
for s in transitions-dev transitions-polish transitions-ui-generation; do
  cp -r "$TMP/transitions/skills/$s" "$TARGET/transitions/$s"
done
cp "$TMP/transitions/LICENSE" "$TARGET/transitions/"

echo "  playwright-cli"
fetch microsoft/playwright-cli playwright-cli
cp -r "$TMP/playwright-cli/skills/playwright-cli" "$TARGET/playwright-cli"
cp "$TMP/playwright-cli/LICENSE" "$TARGET/playwright-cli/"

echo "  taste"
fetch Leonxlnx/taste-skill taste
cp "$TMP/taste/skills/taste-skill/SKILL.md" "$TARGET/taste/SKILL.md"
cp "$TMP/taste/LICENSE" "$TARGET/taste/"

# The React Bits repo is ~400 MB; only its agent catalog is needed. Pro sections are dropped.
echo "  react-bits"
RB="https://raw.githubusercontent.com/DavidHDev/react-bits/HEAD"
curl -fsSL "$RB/public/llms.txt" \
  | awk '/^## React Bits Pro/{skip=1} /^## Development/{skip=0} !skip' \
  > "$TARGET/react-bits/catalog.md"
curl -fsSL "$RB/LICENSE.md" -o "$TARGET/react-bits/LICENSE.md"

echo "Done. Playwright CLI itself is separate: npm install -g @playwright/cli@latest"
