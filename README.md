# GOG Downloader

Downloads all games from GOG available with the currently logged in user. Requires `lgogdownloader --login` to be run first.

Check `blacklist.txt` and `ignorelist.txt` for games to be excluded from downloads and ignored from orphan checks.

## Install

- `lgogdownloader`
- Configure `lgogdownloader`: 
	- `lgogdownloader --login`
	- `for f in blacklist.txt ignorelist.txt; do ln -s $f ~/.config/lgogdownloader/; done`
- Check disk UUID in `mnt-games.mount`
- Activate systemd units: `for unit in mnt-games.mount gog-dl.service gog-dl.timer; do systemctl enable $(pwd)/$unit; done`
