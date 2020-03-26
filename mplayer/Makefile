
#
# Makefile to configure Mplayer tool
#



install:
	@make -C ../third-party/ repos  # Adds Packman repository
	@make -C ../third-party/ videos
	@mkdir -vp /home/$(USER)/.mplayer
	@install --verbose config /home/$(USER)/.mplayer/
