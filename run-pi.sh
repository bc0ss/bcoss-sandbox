#!/bin/sh
set -u
echo HERDR_STATE working
cd '/var/lib/bcoss-jobs/workspaces/129-drone-studio-r0'
export HOME='/var/lib/bcoss-jobs/workspaces/129-drone-studio-r0'
export DRONE_API_KEY="${DRONE_API_KEY:-local}"
export PATH='/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
'/usr/local/bin/pi' --mode json -p --no-session --offline --approve \
  --provider drone --model 'mlx-community/Qwen3-4B-Instruct-2507-4bit' \
  --tools 'write' \
  --append-system-prompt 'Call the write tool once. Write only the requested file. The output cap is 512 tokens. In tool arguments, use real newline characters. Never write a backslash followed by the letter n.' \
  "$(cat job-prompt.txt)" > pi.jsonl
echo PI_PANE_DONE
