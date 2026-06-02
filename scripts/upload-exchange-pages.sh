#!/bin/bash

set -Eeuo pipefail

usage() {
  cat <<'EOF'
Usage: upload-exchange-pages.sh -a <assetId> -d <docsDir> [-s <skipList>]

Required:
  -a assetId       Exchange asset identifier
  -d docsDir       Directory containing markdown files

Optional:
  -s skipList      Comma-separated list of page titles to skip
                   Example: -s 'Security, Environments and Testing'

Authentication:
  This script assumes credentials are already configured using:
    anypoint-cli-v4 conf username <username>
    anypoint-cli-v4 conf password <password>

Examples:
  upload-exchange-pages.sh \
    -a 'org-id/my-asset/1.0.0' \
    -d './docs'

  upload-exchange-pages.sh \
    -a 'org-id/my-fragment/1.0.0' \
    -d './docs' \
    -s 'Security, Environments and Testing'
EOF
  exit 1
}

log() { printf '[INFO] %s\n' "$*"; }
warn() { printf '[WARN] %s\n' "$*" >&2; }
error() { printf '[ERROR] %s\n' "$*" >&2; }

trim() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}

require_command() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1 || {
    error "Required command not found: $cmd"
    exit 1
  }
}

contains_exact() {
  local needle="$1"
  shift || true
  local item
  for item in "$@"; do
    if [[ "$item" == "$needle" ]]; then
      return 0
    fi
  done
  return 1
}

ASSET_ID=""
DOCS_DIR=""
SKIP_LIST=""

while getopts ":a:d:s:h" opt; do
  case "$opt" in
    a) ASSET_ID="$OPTARG" ;;
    d) DOCS_DIR="$OPTARG" ;;
    s) SKIP_LIST="$OPTARG" ;;
    h) usage ;;
    :)
      error "Option -$OPTARG requires an argument."
      usage
      ;;
    \?)
      error "Unknown option: -$OPTARG"
      usage
      ;;
  esac
done

[[ -n "$ASSET_ID" ]] || { error "Missing required option: -a"; usage; }
[[ -n "$DOCS_DIR" ]] || { error "Missing required option: -d"; usage; }

require_command "anypoint-cli-v4"

if [[ ! -d "$DOCS_DIR" ]]; then
  error "Documentation directory does not exist: $DOCS_DIR"
  exit 1
fi

DOCS_DIR="$(cd "$DOCS_DIR" && pwd)"

PAGES=(
  "home|1-Home.md"
  "How to Consume|2-How-to-Consume.md"
  "Security|3-Security.md"
  "Environments and Testing|4-Environments-and-Testing.md"
  "Getting Help|5-Getting-Help.md"
)

VALID_PAGE_TITLES=()
SKIP_TITLES=()

for PAGE in "${PAGES[@]}"; do
  TITLE="${PAGE%%|*}"
  VALID_PAGE_TITLES+=("$TITLE")
done

if [[ -n "$SKIP_LIST" ]]; then
  IFS=',' read -r -a RAW_SKIP_ARRAY <<< "$SKIP_LIST"
  for RAW_SKIP in "${RAW_SKIP_ARRAY[@]}"; do
    CLEAN_SKIP="$(trim "$RAW_SKIP")"
    [[ -n "$CLEAN_SKIP" ]] || continue

    if contains_exact "$CLEAN_SKIP" "${VALID_PAGE_TITLES[@]:-}"; then
      if ! contains_exact "$CLEAN_SKIP" "${SKIP_TITLES[@]:-}"; then
        SKIP_TITLES+=("$CLEAN_SKIP")
      fi
    else
      warn "Unknown page in skip list: '$CLEAN_SKIP'"
      warn "Valid page titles are: ${VALID_PAGE_TITLES[*]}"
    fi
  done
fi

# Validate only pages that are NOT being skipped.
for PAGE in "${PAGES[@]}"; do
  TITLE="${PAGE%%|*}"
  FILE="${PAGE##*|}"
  FULL_PATH="$DOCS_DIR/$FILE"

  if contains_exact "$TITLE" "${SKIP_TITLES[@]:-}"; then
    continue
  fi

  if [[ ! -f "$FULL_PATH" ]]; then
    error "Missing documentation file for page '$TITLE': $FULL_PATH"
    exit 1
  fi
done

log "Using pre-configured Anypoint CLI credentials"
log "Uploading documentation pages to asset: $ASSET_ID"

UPLOADED_COUNT=0
SKIPPED_COUNT=0

for PAGE in "${PAGES[@]}"; do
  TITLE="${PAGE%%|*}"
  FILE="${PAGE##*|}"
  FULL_PATH="$DOCS_DIR/$FILE"

  if contains_exact "$TITLE" "${SKIP_TITLES[@]:-}"; then
    log "Skipping page: $TITLE"
    SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
    continue
  fi

  log "Uploading page: $TITLE ($FILE)"

  anypoint-cli-v4 exchange:asset:page:upload \
    "$ASSET_ID" \
    "$TITLE" \
    "$FULL_PATH"

  UPLOADED_COUNT=$((UPLOADED_COUNT + 1))
done

log "Completed successfully."
log "Uploaded pages: $UPLOADED_COUNT"
log "Skipped pages: $SKIPPED_COUNT"
