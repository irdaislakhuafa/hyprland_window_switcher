NOTHING_DO_MESSAGE="Nothing do."
SEPARATOR=">"
FORMAT="json"

CLIENT_JSON_FIELDS="{
	pid: .pid,
	title: .title,
	class: .class
}";

results=`hyprctl clients -j | jq -c ".[] | $CLIENT_JSON_FIELDS"`
windows=()

while IFS= read -r row; do
	# get some fields
	pid=`echo "$row" | jq -r '.pid'`
	title=`echo "$row" | jq -r '.title'`
	class=`echo "$row" | jq -r '.class'`

	if [ "$pid" = "-1" ]; then
		continue
	fi

	windows+=( "$class $SEPARATOR $title $SEPARATOR $pid" )
done <<< "$results"

windows=$(printf "%s\n" "${windows[@]}")
window=`echo "$windows" | fzf`
if [ "$window" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
fi

pid=`echo $window | cut -d "$SEPARATOR" -f 3 | cut -d " " -f 2`
echo $pid
if [ "$pid" = "" ]; then
	echo "$NOTHING_DO_MESSAGE"
	exit 0
else
	hyprctl dispatch focuswindow pid:$pid
fi



