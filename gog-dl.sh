#!/bin/bash

set -e

declare -r DIR=/mnt/games/gog

lgogdownloader \
	--threads 1 \
	--directory $DIR \
	--platform linux+windows \
	--language en \
	--include installers,dlcs \
	--save-changelogs \
	--no-color \
	--download $@ \
	2>&1 | tee $DIR/download.log

lgogdownloader \
	--directory $DIR \
	--check-orphans \
	| xargs -r rm -v 2>&1 | tee $DIR/orphans.log

# remove empty dirs
find $DIR -empty -type d -delete
