#!/usr/bin/env bash

Clock(){
	TIME=$(date "+%H:%M:%S")
	echo -e -n " \uf017 ${TIME}" 
}

Cal() {
    DATE=$(date "+%a, %m %B %Y")
    echo -e -n "\uf073 ${DATE}"
}

ActiveWindow(){
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=70
	if [ "$len" -gt "$max_len" ];then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

Battery() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	if [[ $BATTACPI == *"100%"* ]]
	then
		echo -e -n "\uf00c $BATPERC"
	elif [[ $BATTACPI == *"Discharging"* ]]
	then
		BATPERC=${BATPERC::-1}
		if [ $BATPERC -le "10" ]
		then
			echo -e -n "\uf244"
		elif [ $BATPERC -le "25" ]
		then
			echo -e -n "\uf243"
		elif [ $BATPERC -le "50" ]
		then
			echo -e -n "\uf242"
		elif [ $BATPERC -le "75" ]
		then
			echo -e -n "\uf241"
		elif [ $BATPERC -le "100" ]
		then
			echo -e -n "\uf240"
		fi
		echo -e " $BATPERC%"
	elif [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]
	then
		echo -e "\uf0e7 $BATPERC"
	elif [[ $BATTACPI == *"Unknown"* ]]
	then
		echo -e "$BATPERC"
	fi
}


Wifi(){
  WIFI_INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)

  if [ -z "$WIFI_INTERFACE" ]; then
    return
  fi

  RAW_QUALITY=$(iwconfig "$WIFI_INTERFACE" 2>/dev/null | grep "Link Quality")
  WIFISTR=$(echo "$RAW_QUALITY" | sed 's/.*Link Quality=//' | cut -d '/' -f1)

  if [[ -n "$WIFISTR" ]]; then
    WIFIPERC=$(( WIFISTR * 100 / 70 ))
    ESSID=$(iwconfig "$WIFI_INTERFACE" 2>/dev/null | grep ESSID | sed 's/.*ESSID:"//' | sed 's/"//')

    if [[ "$WIFIPERC" -ge 1 ]]; then
      echo -e "\uf1eb ${ESSID} ${WIFIPERC}%"
    fi
  fi
}



Sound(){
  NOTMUTED=$(amixer sget Master | grep "\[on\]")

  if [[ -n "$NOTMUTED" ]]; then
    VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')

    if [[ -n "$VOL" && "$VOL" -ge 85 ]]; then
      echo -e "\uf028 ${VOL}%"
    elif [[ -n "$VOL" && "$VOL" -ge 50 ]]; then
      echo -e "\uf027 ${VOL}%"
    elif [[ -n "$VOL" && "$VOL" -ge 0 ]]; then
      echo -e "\uf026 ${VOL}%"
    else
      echo -e "\uf026"
    fi
  else
    echo -e "\uf026 M"
  fi
}


Language(){
	CURRENTLANG="English"
	if [[ $CURRENTLANG == *"English"* ]] ; then
		echo -e " \uf0ac ENG"
	elif [[ $CURRENTLANG == *"Katakana"* ]] ; then
		echo -e " \uf0ac カタカナ"
	elif [[ $CURRENTLANG == *"Hiragana"* ]] ; then
		echo -e " \uf0ac ひらがな"
	else
		echo -e " \uf0ac \uf128"
	fi
}

while true; do
	echo -e "%{l}$(Language)" "%{c}$(ActiveWindow)" "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock) $(Cal)"
	sleep 0.1s
done
