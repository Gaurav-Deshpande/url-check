#!/bin/bash

# File containing the URLs
URL_FILE="urls.txt"

# Check if the file exists
if [[ ! -f "$URL_FILE" ]]; then
  echo -e "\033[31mFile $URL_FILE not found!\033[0m"  # Red color for error
  exit 1
fi

# Function to get color code based on status
get_color_code() {
  local status=$1
  if [[ $status -ge 200 && $status -lt 300 ]]; then
    echo -e "\033[32m"  # Green for success
  elif [[ $status -ge 300 && $status -lt 400 ]]; then
    echo -e "\033[33m"  # Yellow for redirection
  elif [[ $status -ge 400 && $status -lt 500 ]]; then
    echo -e "\033[31m"  # Red for client error
  elif [[ $status -ge 500 && $status -lt 600 ]]; then
    echo -e "\033[35m"  # Magenta for server error
  else
    echo -e "\033[36m"  # Cyan for other statuses
  fi
}

# Read URLs from the file and check their status
while IFS= read -r url; do
  if [[ -n "$url" ]]; then
    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    color_code=$(get_color_code "$status_code")
    echo -e "URL: $url - Status Code: ${color_code}$status_code\033[0m"
  fi
done < "$URL_FILE"
