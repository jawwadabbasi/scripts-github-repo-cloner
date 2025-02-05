#!/bin/bash

# ----------------------------------------- #
#      https://github.com/jawwadabbasi      #
#     Once Written, Forever Automated       #
# ----------------------------------------- #

# Please configure your SSH keys before running this script
# Replace with your GitHub username and Personal Access Token (PAT)

GITHUB_USERNAME=""
GITHUB_TOKEN=""
ORGANIZATION="kodelleinc"
CLONE_DIR="./" # Directory where repositories will be cloned
BASE_URL="https://api.github.com/orgs/${ORGANIZATION}/repos"

mkdir -p "$CLONE_DIR"

get_repos() {
    local page=$1
    local per_page=100
    local url="${BASE_URL}?page=${page}&per_page=${per_page}"
    
    curl -s -u "${GITHUB_USERNAME}:${GITHUB_TOKEN}" "$url"
}

clone_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    echo "Cloning $repo_url into ${CLONE_DIR}/${repo_name}..."
    git clone "$repo_url" "${CLONE_DIR}/${repo_name}"
}

main() {
    local page=1
    while :; do

        repos=$(get_repos $page)

        if [[ -z "$repos" || "$repos" == "[]" ]]; then
            break
        fi

        echo "$repos" | jq -r '.[].ssh_url' | while read -r repo_url; do
            clone_repo "$repo_url"
        done

        ((page++))
    done
}

if ! command -v jq &> /dev/null; then
    echo "jq is required but not installed. Please install jq to proceed."
    exit 1
fi

main