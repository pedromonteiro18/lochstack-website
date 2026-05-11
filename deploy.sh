#!/usr/bin/env bash
# deploy.sh — publish the current repo state to Amplify (manual-deploy app).
#
# Runtime: needs `aws` + `zip` on PATH, and AWS_PROFILE=personal (or equivalent).

set -euo pipefail

APP_ID="d1983f7nfg001s"
BRANCH="main"
REGION="us-east-1"
PROFILE="${AWS_PROFILE:-personal}"

ZIP="$(mktemp -d)/site.zip"
cd "$(dirname "$0")"
zip -qr "$ZIP" index.html robots.txt sitemap.xml

RESP=$(aws amplify create-deployment \
  --profile "$PROFILE" --region "$REGION" \
  --app-id "$APP_ID" --branch-name "$BRANCH" \
  --output json)

URL=$(printf '%s' "$RESP" | python3 -c 'import json,sys; print(json.load(sys.stdin)["zipUploadUrl"])')
JOB=$(printf '%s' "$RESP" | python3 -c 'import json,sys; print(json.load(sys.stdin)["jobId"])')

curl -sS -X PUT -T "$ZIP" "$URL" >/dev/null

aws amplify start-deployment \
  --profile "$PROFILE" --region "$REGION" \
  --app-id "$APP_ID" --branch-name "$BRANCH" --job-id "$JOB" >/dev/null

echo "Deployed job $JOB → https://lochstack.com/"
