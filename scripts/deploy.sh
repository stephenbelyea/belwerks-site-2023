#!/bin/bash

zsh scripts/build.sh
git add -f docs/*
git commit -m "Update static build files"
git push