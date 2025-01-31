#!/bin/bash

platex masterabs && biber masterabs && platex masterabs && platex masterabs && dvipdfmx masterabs.dvi
