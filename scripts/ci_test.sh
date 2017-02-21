#!/bin/sh

# Halt the script if an error occurs
set -e

bundle exec jekyll build

bundle exec htmlproofer ./_site
