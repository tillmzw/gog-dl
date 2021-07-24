#!/bin/bash

set -e

declare -r DIR=/mnt/games/gog

lgogdownloader \
	--threads 1 \
	--directory $DIR \
	--platform linux+windows \
	--language en \
	--include installers,dlcs \
	--no-color \
	--download $@ \
	2>&1 | tee $DIR/download.log

lgogdownloader \
	--directory $DIR \
	--check-orphans \
	| grep -v 'No orphaned files' \
	| xargs -r rm -v 2>&1 | tee $DIR/orphans.log

# remove empty dirs
find $DIR -empty -type d -delete
