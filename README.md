# lochstack-website

Static marketing site for **Lochstack Ltd** — `https://lochstack.com`.

Single-page HTML with inline CSS. No build step.

## Deploy

Hosted by AWS Amplify; connected to this repo. Every push to `main` auto-deploys.

## Files

- `index.html` — the site
- `robots.txt` — allow all, points at sitemap
- `sitemap.xml` — single URL

## Local preview

```sh
python3 -m http.server 8000
```
