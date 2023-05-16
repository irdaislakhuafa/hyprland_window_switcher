NOTHING_DO_MESSAGE="Nothing do."

windows=`hyprctl clients -j | jq -r '.[] | "\(.address) | \(.class) \(.title)"'`
window=`echo "$windows" | rofi -dmenu -matching normal -i`
if [ "$window" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
fi

address=`echo $window | cut -d "|" -f 1`
echo $address
if [ "$address" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
else
	hyprctl dispatch focuswindow address:$address
fi

