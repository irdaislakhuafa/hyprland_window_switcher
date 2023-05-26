NOTHING_DO_MESSAGE="Nothing do."

format=$(printf "\"\(.address) | \(.title) >> \(.class)\"")
windows="$(hyprctl clients -j | jq -r ".[] | $format")"
window=$(echo "$windows" | rofi -dmenu -matching normal -i)
if [ "$window" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
fi

address=$(echo $window | cut -d "|" -f 1)
echo $address
if [ "$address" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
else
	hyprctl dispatch focuswindow address:$address
fi
