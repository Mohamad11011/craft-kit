---
name: craft-kit
description: Professional frontend and design toolkit that bundles Impeccable (all 23 design commands — shape, critique, audit, polish, bolder, quieter, distill, harden, onboard, animate, colorize, typeset, layout, delight, overdrive, clarify, adapt, optimize, init, document, extract, live, generate), the Taste anti-slop skill, the React Bits component catalog, transitions.dev motion recipes and tokens, and Playwright CLI for looking at the rendered result in a real browser. Use this whenever the user asks for frontend, UI, UX or design work of any size — building or redesigning a page, dashboard, component, form, landing page or console screen; reviewing or polishing a UI; adding animation, transitions or hover effects; picking fonts, colors or spacing; making something look less generic or more professional; checking a page visually or taking screenshots; or any React/Tailwind/CSS styling task — even when they don't name any of these tools.
---

# Craft Kit

One entry point for design and frontend work. Each bundled tool is a full upstream skill living in a subfolder of this one; this file decides which to load and in what order. Read only the parts the task needs — the bundle is large on purpose so nothing has to be fetched, not so all of it gets read.

`<base>` below means the directory containing this SKILL.md.

## The bundle

| Tool | Path | Use it for |
|---|---|---|
| Impeccable | `<base>/impeccable/SKILL.md` | The design brain: modes, project context (PRODUCT.md / DESIGN.md), and the 23 commands. Default lead for any design decision. |
| Taste | `<base>/taste/SKILL.md` | Anti-slop rules and a pre-flight checklist. Strongest on Persuade/Experience surfaces (landing pages, portfolios, redesigns). |
| React Bits | `<base>/react-bits/catalog.md` | Catalog of ready animated components, text effects, backgrounds and micro-interactions, with install commands. |
| transitions.dev | `<base>/transitions/transitions-dev/SKILL.md` | Copy-ready CSS transitions (modals, dropdowns, tabs, toasts, accordions, skeletons, success checks…) and motion tokens. |
| transitions-polish | `<base>/transitions/transitions-polish/SKILL.md` | Tuning motion that already exists: durations, easing, stagger, open/close asymmetry. |
| transitions-ui-generation | `<base>/transitions/transitions-ui-generation/SKILL.md` | "AI is generating this UI" wireframe-to-reveal effect. Niche; only when asked. |
| Playwright CLI | `<base>/playwright-cli/SKILL.md` | Open the page in a real browser, click through it, screenshot at real sizes, check console errors. |

## Routing

Pick the lightest path that fits the request:

- **New surface or redesign** (page, screen, dashboard, landing): Impeccable setup → `reference/new-work.md` (or `shape` first if the UX is unclear). For Persuade/Experience surfaces also read Taste and apply its pre-flight check. Reach into React Bits only where an effect earns its place.
- **Review / critique / audit**: Impeccable `critique` (UX) or `audit` (a11y, perf, responsive). Capture screenshots with Playwright CLI so the review is of the rendered page, not just the code.
- **Refinement of existing UI** ("make it cleaner", "too busy", "fonts look off", "spacing is weird"): the matching Impeccable command — `polish`, `quieter`, `bolder`, `distill`, `typeset`, `layout`, `colorize`, `clarify`, `adapt`, `harden`, `onboard`, `optimize`. Ask once if two fit.
- **Motion**: new transition on an interaction → transitions.dev (find the numbered recipe, adapt to the stack). Existing motion feels off → transitions-polish. Broader motion strategy or "add delight" → Impeccable `animate`/`delight`, using transitions.dev recipes as the implementation.
- **Showpiece effects** (animated hero text, backgrounds, magnetic buttons, tilt cards): React Bits catalog; Impeccable `overdrive` for the judgment of whether it fits.
- **"Check it / screenshot it / does it work in the browser"**: Playwright CLI directly.
- **Design system capture**: Impeccable `init` (PRODUCT.md), `document` (DESIGN.md), `extract` (tokens/components).

When the user names a sub-tool or command ("impeccable audit", "transitions polish", "use react bits"), go straight to it.

## How the tools fit together

They overlap; when they disagree, this is the order of authority:

1. **The user's brief and the project's existing design system.** An app with established tokens, components (e.g. shadcn/ui) and a DESIGN.md is refined inside that world, not re-skinned. Taste and Impeccable both say this; it matters most in product/admin UIs where consistency is the feature.
2. **Impeccable** sets mode, direction and the quality floor (`reference/craft-floor.md` before any UI edit).
3. **Taste** adds its bans and checklist on top — but its aesthetic defaults (dramatic type, motion-heavy layouts) are for Persuade/Experience. On Operate surfaces (dashboards, consoles, settings, tables) take its anti-slop rules and leave its showmanship.
4. **transitions.dev tokens** govern timing and easing for anything that moves. If the project already has motion tokens, map to them instead of introducing a second scale.
5. **React Bits** is a parts bin, not a direction. Every component has dependencies (gsap, motion, three, ogl…) — check the project's existing deps first, prefer the variant matching the stack (TS + Tailwind for a Vite/React/Tailwind app), and don't add a heavy 3D/WebGL dependency for a minor flourish.

## Running the bundled pieces

**Impeccable** — its SKILL.md says to run `<skill-base-dir>/scripts/impeccable context` once per session. Here the skill base dir is `<base>/impeccable`, so:

```bash
sh "<base>/impeccable/scripts/impeccable" context            # bash / Git Bash
"<base>\impeccable\scripts\impeccable.cmd" context           # Windows shell without sh
```

Keep cwd at the user's project. Every `.claude/skills/impeccable/...` path in Impeccable's references resolves to `<base>/impeccable/...`. On first run the launcher downloads its engine binary from Impeccable's GitHub releases (checksum-verified); if that's blocked, follow Impeccable's "Launcher unavailable" fallback and continue. Don't run `pin` or `hooks on` unless the user asks — they write files into the project.

**Playwright CLI** — check with `playwright-cli --version`. If missing, tell the user it needs `npm install -g @playwright/cli@latest` (global install — ask before running it). For a local dev server, start it in the background first, then `playwright-cli open http://localhost:<port>`. Screenshot at the widths the surface actually ships at (e.g. 1440 and 390) and fix everything one look reveals before taking the next.

**React Bits** — install via `npx shadcn@latest add https://reactbits.dev/r/<Component>-<TS|JS>-<TW|CSS>` when the project uses shadcn, otherwise jsrepo or manual copy. Fetch the component page (URL in the catalog) when you need its props.

**transitions.dev** — recipes are numbered markdown files in `<base>/transitions/transitions-dev/`; `_root.css` holds the motion tokens. Every recipe carries a `prefers-reduced-motion` guard — keep it when adapting.

## Finish

Before calling UI work done, look at it rendered (Playwright CLI) at the sizes it ships, in both themes if the app has them, and confirm the project's own lint/type/test commands still pass.
