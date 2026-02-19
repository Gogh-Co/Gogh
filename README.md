# Gogh Website (Nuxt)

<div align="center">
<img src="https://raw.githubusercontent.com/Gogh-Co/Gogh/master/.images/gogh/Gogh-logo-dark.png" alt="Gogh" width="100%">
</div>

<div align="center">
:small_blue_diamond: <a href="http://Gogh-Co.github.io/Gogh"> Visit the Website </a> :small_blue_diamond:
</div>


Nuxt-based website for browsing and previewing Gogh terminal color schemes.

## Overview

- Framework: Nuxt 4 + Vue 3
- Styles: SCSS + Bootstrap
- Base URL: `/Gogh/`
- Theme source: GitHub API (server-side proxy at `/api/themes`)

The app fetches theme data from GitHub on the server to avoid browser CORS issues.

## Requirements

- Node.js 20+
- Bun

## Run in development

```bash
bun run dev
```

Default local URL:

- http://localhost:3000/Gogh/

## Build and preview

Build:

```bash
bun run build
```

Preview:

```bash
bun run preview
```

Generate static output:

```bash
bun run generate
```

## Available scripts

- `dev`: starts Nuxt in development mode
- `build`: creates production build
- `preview`: runs local server for production build
- `generate`: generates static site output

## Project structure

- `src/pages/index.vue`: main catalog and terminal previews
- `src/components/Terminal/`: terminal preview component
- `src/components/Header/`: top header/logo component
- `server/api/themes.get.ts`: server endpoint that fetches and decodes theme JSON from GitHub API

## Data source

Themes are pulled from:

- https://api.github.com/repos/Gogh-Co/Gogh/contents/data/themes-min.json?ref=master

The server endpoint decodes the Base64 payload and returns normalized JSON to the frontend.

## Notes

- If dev server selects a different port, open the URL printed by Nuxt.
- Because the app uses `baseURL: /Gogh/`, local and deployed paths must include `/Gogh/`.

