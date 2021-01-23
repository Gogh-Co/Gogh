#!/usr/bin/env bash

YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color


printf "${YELLOW}| :::::::::: ${NC}\n"
bash tools/generate.sh
echo ""

git config --global user.email "github-actions[bot]@github.com"
git config --global user.name  "github-actions[bot]"
echo ""


printf "${YELLOW}| :::::::::: ${NC}\n"
git add .
git commit -m "------- Generate themes.json -------"
git push
echo ""


printf "${YELLOW}| :::::::::: ${NC}\n"
git status
echo ""
