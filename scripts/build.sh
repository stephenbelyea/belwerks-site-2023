#!/bin/bash

bundle install
bundle exec jekyll build
\cp -r _site/* docs
rm -rf docs/scripts
rm -rf docs/docs