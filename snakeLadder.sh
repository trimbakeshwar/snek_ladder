
#!/bin/bash -x
echo "welcome to snakeladder" 
STARTPOSITION=0 
WINNINGPOSITION=100 
currentPosition=$STARTPOSITION
playerOne=$STARTPOSITION
playerTwo=$STARTPOSITION
#roll the die for change position
function rollDie(){
	die=$((RANDOM%6 +1)) 
	checkOption
}
#chack option for snake ladder or no position
function checkOption(){
	NOPLAY=0
	SNAKE=1
	LADDER=2
	option=$((RANDOM%3))
	case $option in
		$NOPLAY)
			currentPosition=$currentPosition
			;;
		$SNAKE)	
			((currentPosition-=$die))
			if [ $currentPosition -lt $STARTPOSITION ]
			then
				currentPosition=$STARTPOSITION
			fi
			;;
		$LADDER)
			((currentPosition+=$die))
			((numberOfTimeDieThrowForWin++))
			if [ $currentPosition -gt $WINNINGPOSITION ]
			then
				((currentPosition-=$die))
			fi
			;;
	esac
}
#update position
function updatePosition(){
	while [ $currentPosition -lt $WINNINGPOSITION ]
	do
   	rollDie
	done
}
#player one play the game
function playerOne(){
	numberOfTimeDieThrowForWin=0
	updatePosition
	playerOneCount=$numberOfTimeDieThrowForWin
	echo $playerOneCount
}
#player two play the game
function playerTwo(){
	STARTPOSITION=0 
	WINNINGPOSITION=100 
	currentPosition=$STARTPOSITION
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

