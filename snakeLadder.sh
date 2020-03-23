#!/bin/bash -x
echo "welcome to snakeladder" 
startPosition=0 
winningPosition=100 
currentPosition=$startPosition
numberOfTimeDieThrowForWin=0 
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
			if [ $currentPosition -lt $startPosition ]
         then
            currentPosition=$startPosition
         fi
			;;
	$ladder)
			((currentPosition+=$die))
			((numberOfTimeDieThrowForWin++))
			if [ $currentPosition -gt $winningPosition ]
         then
            ((currentPosition-=$die))
         fi
      	;;
esac
}

count=0
while [ $currentPosition -lt $winningPosition ]
do
   rollDie
	echo "current position $currentPosition"

	((count++))
done
echo "number of time die thrown $count"
echo " number of time die throw for only increase position :$numberOfTimeDieThrowForWin"
echo "$currentPosition"
