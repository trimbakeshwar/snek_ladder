
#!/bin/bash -x
echo "welcome to snakeladder" 
startPosition=0 
winningPosition=100 
currentPosition=$startPosition
playerOne=$startPosition
playerTwo=$startPosition

function rollDie(){
	die=$((RANDOM%6 +1)) 
	checkOption
}
function checkOption(){
	noPlay=0
	snake=1
	ladder=2
	option=$((RANDOM%3))
	case $option in
		$noplay)
			currentPosition=$currentPosition
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

function updatePosition(){
	while [ $currentPosition -lt $winningPosition ]
	do
   	rollDie
	done
}
function playerOne(){
	numberOfTimeDieThrowForWin=0
	updatePosition
	playerOneCount=$numberOfTimeDieThrowForWin
	echo $playerOneCount
}
function playerTwo(){
	startPosition=0 
	winningPosition=100 
	currentPosition=$startPosition
	numberOfTimeDieThrowForWin=0
	updatePosition
	playerTwoCount=$numberOfTimeDieThrowForWin
echo $playerTwoCount
}

result1="$( playerOne $(()) )"
result2="$( playerTwo $(()) )"
echo "player one : $result1"
echo "player two : $result2"
if [ $result1 -lt $result2 ]
then
   echo "player one win"
else
   echo "player two win"
fi

