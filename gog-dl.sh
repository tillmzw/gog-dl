#!/bin/bash


lgogdownloader \
	--threads 1 \
	--directory /mnt/games/gog \
	--platform linux,windows \
	--language en \
	--include installers,dlcs \
	--save-changelogs \
	--no-color \
	--download
