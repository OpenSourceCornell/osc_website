#!/bin/sh

# Halt the script if an error occurs
set -e

# Build the site once to be sure
bundle exec jekyll build

# We use `jekyll serve` to get around the permalink
# problem. html-proofer checks non-relative links. However, our site
# uses absolute links to serve as permalinks. At CI testing time,
# these permalinks will not exist. Instead, we run `jekyll serve`, so
# that the "permalinks" are now links to the testing server.
bundle exec jekyll serve &

# Give Jekyll time to spin up
sleep 5

bundle exec htmlproofer ./_site
