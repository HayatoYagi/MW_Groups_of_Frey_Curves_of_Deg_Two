#!/bin/bash

if [ ! -z "$GITHUB_ACTIONS" ]; then
    cp /.latexmkrc $HOME/
fi

latexmk -pdf -e '$pdf_mode=4' beamer