# craft-kit

One Claude Code skill for frontend and design work. It routes each request to the right specialist skill and sets the order of authority when they disagree.

| Bundled skill | Source | What it brings |
|---|---|---|
| Impeccable | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Design direction, quality floor, and 23 commands (critique, audit, polish, typeset, layout, animate…) |
| Taste | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | Anti-slop rules and a pre-flight checklist |
| React Bits | [DavidHDev/react-bits](https://github.com/DavidHDev/react-bits) | Catalog of animated components, text effects and backgrounds |
| transitions.dev | [Jakubantalik/transitions.dev](https://github.com/Jakubantalik/transitions.dev) | CSS transition recipes, motion tokens, motion polish |
| Playwright CLI | [microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) | Look at the rendered page in a real browser |

This repo holds only the routing skill and an installer. The bundled skills are downloaded from their official repositories at install time and stay under their own licenses.

## Install

```sh
git clone https://github.com/Mohamad11011/craft-kit.git
sh craft-kit/install.sh
```

That installs to `~/.claude/skills/craft-kit`. Pass a different path as the first argument to install somewhere else. On Windows, run it from Git Bash. Re-run it any time to pull the latest versions of the bundled skills.

For the browser checks, also install the Playwright CLI:

```sh
npm install -g @playwright/cli@latest
```

## Use

Ask Claude Code for any frontend or design task: "redesign the settings page", "audit this dashboard", "add a smooth dropdown transition", "make the hero less generic". The skill loads on its own, or call it with `/craft-kit`.

## License

MIT for the files in this repo. The bundled skills keep their own licenses.
