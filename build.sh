#!/bin/zsh
set -eux
cd $(dirname $0)/stanford_corenlp_pywrapper

jarfile=lib/corenlpwrapper.jar
rm -rf _build $jarfile
mkdir _build

CORENLP_JAR=lib/stanford-corenlp-3.6.0.jar

javac -source 8 -target 8 -d _build -cp "$(echo lib/*.jar | tr ' ' ':')" javasrc/**/*.java javasrc/**/**/*.java
(cd _build && jar cf ../$jarfile .)
ls -l $jarfile

rm -rf _build
