#!/bin/bash

if [ ! -z "$GITHUB_ACTIONS" ]; then
    cp /.latexmkrc $HOME/
fi

# 1回だと reference が消えてしまうので2回実行
latexmk -pdf -e '$pdf_mode=4' beamer
latexmk -pdf -e '$pdf_mode=4' beamer
