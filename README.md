# Belwerks Site 2023

Jekyll-based rebuild of belwerks.com for 2023 and beyond!

## Getting started

[Working with Jekyll](https://jekyllrb.com/docs/) requires [Ruby, RubyGems](https://jekyllrb.com/docs/installation/), and the [Bundler](https://bundler.io/) utility.

## Running locally

From the project root, run the `serve.sh` script using `zsh` (or `source` if you don't use [Oh My ZSH](https://ohmyz.sh/)):

```bash
zsh scripts/serve.sh
```

Once built, it should be available at: `http://127.0.0.1:4000/`

## Deploying to GitHub Pages

There is no pipeline setup to build and serve Jekyll from the GitHub repo level. Use this simple script to locally build, clone files, and push a deploy commit to the repo's `main` branch.

```bash
zsh scripts/deploy.sh
```

From there, GitHub Pages will serve the static contents of the `docs/` folder, which now contains the built site updates you have locally (and have hopefully checked-in).
