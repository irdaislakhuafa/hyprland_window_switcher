NOTHING_DO_MESSAGE="Nothing do."
SEPARATOR=">"
FORMAT="json"

CLIENT_JSON_FIELDS="{
	address: .address,
	title: .title,
	class: .class
}";

results=`hyprctl clients -j | jq -c ".[]"`
windows=()

while IFS= read -r row; do
	# get some fields
	address=`echo "$row" | jq -r '.address'`
	title=`echo "$row" | jq -r '.title'`
	class=`echo "$row" | jq -r '.class'`
 
	if [ "$pid" = "-1" ]; then
		continue
	fi
 
	windows+=( "$(printf "%s\t| %s \t %s" "$address" "$class" "$title")" )
done <<< "$results"

windows=$(printf "%s\n" "${windows[@]}")
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



