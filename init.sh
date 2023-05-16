APP_TITLE="Window Switcher";
APP_FONT_SIZE=12;
DIR=`dirname "$(readlink -f "$0")"`

alacritty \
	-T "$APP_TITLE" \
	-o font.size=$APP_FONT_SIZE \
	-e zsh -c "$DIR/window_switcher.sh";
