#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Start the cron service
service cron start

# Update the crontab with Whenever
whenever --update-crontab

# Start the sidekiq service
bundle exec sidekiq &
# sidekiq &

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
