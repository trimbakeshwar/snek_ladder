#!/bin/bash -x
echo "welcome to snakeladder" 
startPosition=0 
winningPosition=100 
currentPosition=$startPosition 
function rollDie()
{ die=$((RANDOM%6 +1)) 
checkOption
}
function checkOption(){
noPlay=0
snake=1
ladder=2
option=$((RANDOM%3))
case $option in
	$noplay)
#			currentPosition=$currentPosition
			;;
	$snake)	
			((currentPosition-=$die))
			;;
	$ladder)
			((currentPosition+=$die))
      	;;
esac
}

echo "$currentPosition"
