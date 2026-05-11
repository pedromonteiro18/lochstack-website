# lochstack-website

Static marketing site for **Lochstack Ltd** — `https://lochstack.com`.

Single-page HTML with inline CSS. No build step.

## Deploy

Hosted by AWS Amplify (app `d1983f7nfg001s`, us-east-1, manual-deploy mode).

```sh
./deploy.sh        # zips → uploads → triggers Amplify deployment
```

## Files

- `index.html` — the site
- `robots.txt` — allow all, points at sitemap
- `sitemap.xml` — single URL
- `deploy.sh` — publish script

## Local preview

```sh
python3 -m http.server 8000
```
