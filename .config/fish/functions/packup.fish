function packup
	echo writting package lists
	pacman -Qqen > ~/pkglist.txt &&
	pacman -Qqem > ~/pkglist_aur.txt &&
	cat ~/pkglist.txt ~/pkglist_aur.txt > ~/pkglist_full.txt &&
	echo zipping package lists &&
	zip -r ~/pkglists.zip ~/pkglist.txt ~/pkglist_aur.txt ~/pkglist_full.txt 1> /dev/null &&
	echo uploading package lists &&
	rsync ~/pkglists.zip prokop@randacek.dev:/home/prokop/backups/(cat /etc/hostname)/ &&
	rm ~/pkglist*.{txt, zip}
end
