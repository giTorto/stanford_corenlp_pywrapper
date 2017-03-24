#!/bin/zsh
set -eux
cd $(dirname $0)/stanford_corenlp_pywrapper

jarfile=lib/corenlpwrapper.jar
rm -rf _build $jarfile
mkdir _build

CORENLP_JAR=/home/ec2-user/stanford-corenlp-full-2016-10-31/stanford-corenlp-3.7.0.jar

javac -source 8 -target 8 -d _build -cp "$(echo lib/*.jar | tr ' ' ':')":$CORENLP_JAR javasrc/**/**/*.java javasrc/**/*.java
(cd _build && jar cf ../$jarfile .)
ls -l $jarfile

rm -rf _build
