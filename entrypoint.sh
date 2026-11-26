#!/bin/sh
set -e

for uid in $(find /srv/git -maxdepth 5 -exec stat -c %u {} + 2>/dev/null | sort -u); do
  if ! getent passwd "$uid" >/dev/null; then
    echo "uid$uid:x:$uid:$uid:${REPO_OWNER:-uid$uid}:/nonexistent:/sbin/nologin" >> /etc/passwd
  fi
done

exec "$@"
