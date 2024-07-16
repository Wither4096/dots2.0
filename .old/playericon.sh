if playerctl -l | grep -q 'Feishin'; then
	echo " "
elif playerctl -l | grep -q 'spotify'; then
  echo " ";
elif playerctl -l | grep -q 'mpd'; then
	echo " ";
else
	echo "No player is running";
fi
