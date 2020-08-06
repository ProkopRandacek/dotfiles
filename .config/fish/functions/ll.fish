function ll
	#ls $argv -oAGhX --group-directories-first
	ls $argv -la --group-directories-first --sort="Extension"
end
