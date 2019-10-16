!classDefinition: #Test category: #'Terni Lapilli'!
TestCase subclass: #Test
	instanceVariableNames: 'center upperRightCorner upperLeftCorner upperCenter lowerLeftCorner lowerRightCorner leftCenter lowerCenter rightCenter outOfBoard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:23:46'!
setUp

	center := 2@2.
	upperRightCorner := 3@3. 
	upperLeftCorner := 1@3.
	upperCenter := 2@3.
	lowerLeftCorner := 1@1.
	lowerRightCorner := 3@1.
	leftCenter := 1@2.
	lowerCenter := 2@1.
	rightCenter := 3@2.
	outOfBoard:= 0@0.! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:35:36'!
test01XPlayerBeginsAndBoardIsEmpty
	|aGame|

	aGame := TerniLapilli new.
	
	self assert: aGame isPlayingX.
	self assert: aGame boardIsEmpty.
	self deny: aGame isPlayingO.! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:48:00'!
test02OPlayerCannotPlayFirst

	|aGame|
	
	aGame := TerniLapilli new.
	self should: [aGame putOAt: center]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli oPlayerCannotBeginGame.
			self assert: aGame isPlayingX.
			self deny: (aGame isOccupiedByO: center)]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:43:48'!
test03FirstPlayedStoneIsInTheRightPositionAndOPlayerGoesNext

	|aGame|
	
	aGame := TerniLapilli new.
	
	aGame putXAt: center.
	
	self assert: (aGame isOccupiedByX: center).
	self deny: aGame isPlayingX.
	self assert: aGame isPlayingO.
	self deny: aGame boardIsEmpty.! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:12:20'!
test04FirstPlayedStoneIsNotInAWrongPosition

	|aGame|
	
	aGame := TerniLapilli new.
	
	aGame putXAt: upperRightCorner.
	
	self deny: (aGame isOccupiedByX: center).
	self assert: (aGame isOccupiedByX: upperRightCorner).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:01:55'!
test05XPlayerCanNotPlayTwoConsecutiveTurns

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	self should: [aGame putXAt: upperRightCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayTwoConsecutiveTurns.
			self assert: aGame isPlayingO.
			self deny: (aGame isOccupiedByX: upperRightCorner).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:50:47'!
test06OPlayerCanNotPlaceStoneInAPositionOccupiedByXPlayer

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	self should: [aGame putOAt: center]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneInAnOccupiedPosition.
			self assert: aGame isPlayingO.
			self assert: (aGame isOccupiedByX: center).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:38:46'!
test07OPlayerCanPlaceAStoneInAFreePosition

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner. 
	
	self assert: aGame isPlayingX.
	self assert: (aGame isOccupiedByO: upperRightCorner).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:39:07'!
test08OPlayerCanNotPlayTwoConsecutiveTurns

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperLeftCorner.
	self should: [aGame putOAt: upperRightCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayTwoConsecutiveTurns.
			self assert: aGame isPlayingX.
			self deny: (aGame isOccupiedByO: upperRightCorner).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:53:12'!
test09XPlayerCanNotPlaceStoneInAPositionOccupiedByItself

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner .
	self should: [aGame putXAt: center]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneInAnOccupiedPosition.
			self assert: aGame isPlayingX.
			self assert: (aGame isOccupiedByX: center).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:57:01'!
test10XPlayerCanNotPlaceStoneInAPositionOccupiedByOPlayer

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner.
	self should: [aGame putXAt: upperRightCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneInAnOccupiedPosition.
			self assert: aGame isPlayingX.
			self assert: (aGame isOccupiedByO: upperRightCorner).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:12:10'!
test11XPlayerCanPlaceASecondStoneInAFreePositionAndGameKeepsTrackOfPreviouslyPlacedStone

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperLeftCorner. 
	
	self assert: aGame isPlayingO.
	self assert: (aGame isOccupiedByX: upperLeftCorner).
	self assert: (aGame isOccupiedByX: center).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:15:20'!
test12OPlayerCanNotPlaceStoneInAPositionOccupiedByItself

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperLeftCorner. 
	self should: [aGame putOAt: upperRightCorner.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneInAnOccupiedPosition.
			self assert: aGame isPlayingO.
			self assert: (aGame isOccupiedByO: upperRightCorner).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:22:35'!
test13OPlayerCanPlaceASecondStoneInAFreePositionAndGameKeepsTrackOfItsPreviouslyPlacedStone

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: upperCenter.
	
	self assert: aGame isPlayingX.
	self assert: (aGame isOccupiedByO: upperRightCorner).
	self assert: (aGame isOccupiedByO: upperCenter).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test14XPlayerWinsIfFormsLowerLeftToUpperRightDiagonalAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperRightCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerLeftCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test15XPlayerDoesNotWinIfItDoesNotFormThreeInLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame putXAt: upperCenter.
	
	self deny: aGame hasPlayerXWon.
	self deny: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test16XPlayerWinsIfFormsUpperLeftToLowerRightDiagonalAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerRightCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test17XPlayerWinsIfCompletesLeftVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: leftCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerLeftCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test18XPlayerWinsIfCompletesCentralVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: center.
	aGame putOAt: lowerLeftCorner.
	aGame putXAt: upperCenter.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test19XPlayerWinsIfCompletesRightVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: rightCenter.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperRightCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerRightCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test20XPlayerWinsIfCompletesUpperHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: lowerLeftCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: lowerRightCorner.
	aGame putXAt: upperRightCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test21XPlayerWinsIfCompletesCentralHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: leftCenter.
	aGame putOAt: lowerLeftCorner.
	aGame putXAt: center.
	aGame putOAt: lowerRightCorner.
	aGame putXAt: rightCenter.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:55:53'!
test22XPlayerWinsIfCompletesLowerHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt:  lowerLeftCorner.
	aGame putOAt: center.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	
	self assert: aGame hasPlayerXWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:41:28'!
test23OPlayerCanNotPlayIfGameIsOver

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	
	self should: [aGame putOAt: upperLeftCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayIfTheGameIsOver.
			self assert: aGame hasPlayerXWon.
			self deny: aGame hasPlayerOWon.
			self assert: aGame gameIsOver.].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:48:38'!
test24OPlayerWinsIfFormsLowerLeftToUpperRightDiagonalAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerRightCorner. 
	aGame putOAt: center.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: lowerLeftCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:50:51'!
test25OPlayerDoesNotWinIfItDoesNotFormThreeInLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: rightCenter. 
	
	self deny: aGame hasPlayerOWon.
	self deny: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:55:09'!
test26OPlayerWinsIfFormsUpperLeftToLowerRightDiagonalAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner. 
	aGame putOAt: center.
	aGame putXAt: upperRightCorner.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: lowerRightCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:58:02'!
test27OPlayerWinsIfCompletesLeftVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerRightCorner. 
	aGame putOAt: leftCenter.
	aGame putXAt: upperRightCorner.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: lowerLeftCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:57:45'!
test28OPlayerWinsIfCompletesCentralVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerRightCorner. 
	aGame putOAt: lowerCenter.
	aGame putXAt: upperRightCorner.
	aGame putOAt: center.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:58:57'!
test29OPlayerWinsIfCompletesRightVerticalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner. 
	aGame putOAt: rightCenter.
	aGame putXAt: upperLeftCorner.
	aGame putOAt: upperRightCorner.
	aGame putXAt: upperCenter.
	aGame putOAt: lowerRightCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 21:00:16'!
test30OPlayerWinsIfCompletesUpperHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: upperLeftCorner.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: upperRightCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 21:01:58'!
test31OPlayerWinsIfCompletesCentralHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperCenter.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: center.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: rightCenter.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 21:02:53'!
test32OPlayerWinsIfCompletesLowerHorizontalLineAfterPlacingItsStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperLeftCorner.
	aGame putOAt:  lowerLeftCorner.
	aGame putXAt: center.
	aGame putOAt: lowerCenter.
	aGame putXAt: upperRightCorner.
	aGame putOAt: lowerRightCorner.
	
	self assert: aGame hasPlayerOWon.
	self assert: aGame gameIsOver.
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 21:15:36'!
test33XPlayerCanNotPutAFourthStone

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	self should: [aGame putXAt: upperCenter]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceMoreThanThreeStones.
			self deny: aGame hasPlayerXWon.
			self deny: (aGame isOccupiedByX: upperCenter)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:27:17'!
test34XPlayerCanNotPlaceStoneOutOfBoard

	|aGame|
	
	aGame := TerniLapilli new.
	
	self should: [aGame putXAt: outOfBoard]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneOutOfBoard.
			self assert: aGame isPlayingX.
			self assert: aGame boardIsEmpty].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:48:31'!
test35XPlayerMovesCorrectly

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	aGame moveXFrom: center to: rightCenter.
	
	self assert: (aGame isOccupiedByX: rightCenter).
	self deny: (aGame isOccupiedByX: center).
	self assert: (aGame isPlayingO).
	self deny: (aGame gameIsOver).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:06:35'!
test36XPlayerShouldOnlyMoveItsOwnStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	self should: [aGame moveXFrom: leftCenter to: rightCenter.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerShouldOnlyMoveItsOwnStones.
			self assert: aGame isPlayingX.
			self deny: (aGame isOccupiedByX: rightCenter)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:12:26'!
test37XPlayerCanNotMoveStoneOutOfBoard

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperRightCorner.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: center.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	self should: [aGame moveXFrom: lowerRightCorner to: outOfBoard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveStoneOutOfBoard.
			self assert: aGame isPlayingX.
			self assert: (aGame isOccupiedByX: lowerRightCorner)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:25:21'!
test38XPlayerCanOnlyMoveStoneToANeighborPosition

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperRightCorner.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: center.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	self should: [aGame moveXFrom: lowerRightCorner to: upperLeftCorner.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanOnlyMoveStoneToANeighborPosition.
			self assert: aGame isPlayingX.
			self assert: (aGame isOccupiedByX: lowerRightCorner).
			self deny: (aGame isOccupiedByX: upperLeftCorner)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:00:07'!
test39XPlayerCanNotMoveToAnOccupiedPosition

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperRightCorner.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: center.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	self should: [aGame moveXFrom: lowerRightCorner to: lowerCenter.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveToAnOccupiedPosition.
			self assert: aGame isPlayingX.
			self assert: (aGame isOccupiedByX: lowerRightCorner).
			self assert: (aGame isOccupiedByX: lowerCenter)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:00:23'!
test40XPlayerCanNotPlayIfGameIsOver

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: rightCenter.
	aGame putOAt: upperLeftCorner.
	
	self should: [aGame moveXFrom: rightCenter to: lowerRightCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayIfTheGameIsOver.
			self deny: aGame hasPlayerXWon.
			self assert: aGame hasPlayerOWon.
			self assert: aGame gameIsOver.].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:06:16'!
test41OPlayerCanNotPutAFourthStone

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	
	aGame moveXFrom:center  to:upperLeftCorner. 
		
	self should: [aGame putOAt: center]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceMoreThanThreeStones.
			self deny: aGame hasPlayerOWon.
			self deny: (aGame isOccupiedByO: center)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:08:41'!
test42OPlayerCanNotPlaceStoneOutOfBoard

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	
	self should: [aGame putOAt: outOfBoard]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlaceStoneOutOfBoard.
			self assert: aGame isPlayingO.].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:51:23'!
test43OPlayerMovesCorrectly

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame moveXFrom: center to: rightCenter.
	
	aGame moveOFrom: leftCenter to:upperLeftCorner. 
	
	self assert: (aGame isOccupiedByO: upperLeftCorner).
	self deny: (aGame isOccupiedByO: leftCenter).
	self assert: (aGame isPlayingX).
	self deny: (aGame gameIsOver).! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:56:15'!
test44OPlayerShouldOnlyMoveItsOwnStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame moveXFrom: center to: rightCenter. 
	
	self should: [aGame moveOFrom: rightCenter to: center.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerShouldOnlyMoveItsOwnStones.
			self assert: aGame isPlayingO.
			self deny: (aGame isOccupiedByO: center)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:27:39'!
test45OPlayerCanNotMoveStoneOutOfBoard

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame moveXFrom: center to: rightCenter. 
	
	self should: [aGame moveOFrom: lowerLeftCorner to: outOfBoard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveStoneOutOfBoard.
			self assert: aGame isPlayingO.
			self assert: (aGame isOccupiedByO: lowerLeftCorner)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:06:49'!
test46OPlayerCanOnlyMoveStoneToANeighborPosition

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame moveXFrom: center to: rightCenter. 
	
	self should: [aGame moveOFrom: leftCenter to: upperCenter.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanOnlyMoveStoneToANeighborPosition.
			self assert: aGame isPlayingO.
			self assert: (aGame isOccupiedByO: leftCenter).
			self deny: (aGame isOccupiedByO: upperCenter)].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:31:50'!
test47OPlayerCanNotMoveToAnOccupiedPosition

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: upperRightCorner.
	aGame putOAt: leftCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: center.
	aGame putXAt: lowerRightCorner.
	aGame putOAt: lowerLeftCorner.
	aGame moveXFrom: upperRightCorner to: upperCenter. 
	
	self should: [aGame moveOFrom: lowerLeftCorner to: lowerCenter.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveToAnOccupiedPosition.
			self assert: aGame isPlayingO.
			self assert: (aGame isOccupiedByO: lowerLeftCorner).
			self assert: (aGame isOccupiedByX: lowerCenter)].
	
	
	
	! !


!classDefinition: #TerniLapilli category: #'Terni Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xPlays isBoardEmpty xOccupied oOccupied state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:46:40'!
aPlayerCannotPlaceMoreThanThreeStonesError

	self error: self class aPlayerCannotPlaceMoreThanThreeStones! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:47:07'!
aPlayerCannotPlaceStoneInAnOccupiedPositionError

	self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:47:46'!
aPlayerCannotPlaceStoneOutOfBoardError

	self error: self class aPlayerCannotPlaceStoneOutOfBoard! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:44:55'!
aPlayerCannotPlayIfTheGameIsOverError

	self error: self class aPlayerCannotPlayIfTheGameIsOver! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:46:10'!
aPlayerCannotPlayTwoConsecutiveTurnsError
	
	self error: self class aPlayerCannotPlayTwoConsecutiveTurns! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:45:42'!
boardIsEmpty
	^isBoardEmpty! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:49:25'!
gameIsOver
	^self hasPlayerXWon or: self hasPlayerOWon. ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:46:32'!
hasPlayerOWon
	^(oOccupied size = 3)
	and: ((oOccupied allSatisfy: [:a | a x = a y]) 
		or: (oOccupied allSatisfy: [:a | a x + a y = 4]) 
		or: ((oOccupied allSatisfy: [:a | a x = 1]) or: (oOccupied allSatisfy: [:a | a x = 2]) or: (oOccupied allSatisfy: [:a | a x = 3]))
		or: ((oOccupied allSatisfy: [:a | a y = 1]) or: (oOccupied allSatisfy: [:a | a y = 2]) or: (oOccupied allSatisfy: [:a | a y = 3])))! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 20:37:47'!
hasPlayerXWon
	^(xOccupied size = 3)
	and: ((xOccupied allSatisfy: [:a | a x = a y]) 
		or: (xOccupied allSatisfy: [:a | a x + a y = 4]) 
		or: ((xOccupied allSatisfy: [:a | a x = 1]) or: (xOccupied allSatisfy: [:a | a x = 2]) or: (xOccupied allSatisfy: [:a | a x = 3]))
		or: ((xOccupied allSatisfy: [:a | a y = 1]) or: (xOccupied allSatisfy: [:a | a y = 2]) or: (xOccupied allSatisfy: [:a | a y = 3])))! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:17:45'!
isOccupied: aPosition
	^(self isOccupiedByO: aPosition) or: (self isOccupiedByX: aPosition).! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:28:36'!
isOccupiedByO: aPosition

	^oOccupied includes: aPosition. ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 18:09:39'!
isOccupiedByX: aPosition

	^xOccupied includes: aPosition.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:41:28'!
isPlayingO

	^xPlays not ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 17:49:08'!
isPlayingX

	^xPlays! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:18:07'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo

	|xOccupiedMoveFromIndex|
	
	self gameIsOver ifTrue:[self error: self class aPlayerCannotPlayIfTheGameIsOver].
	
	xOccupiedMoveFromIndex := oOccupied indexOf: aPositionToMoveFrom
									ifAbsent:[self error: self class aPlayerShouldOnlyMoveItsOwnStones].
	(self class isInsideBoard: aPositionToMoveTo) ifFalse:[self error: self class aPlayerCanNotMoveStoneOutOfBoard].
	
	 (self class isGameMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo) 
									ifFalse:[ self error: self class aPlayerCanOnlyMoveStoneToANeighborPosition ].
	
	(self isOccupied: aPositionToMoveTo)
									ifTrue:[ self error: self class aPlayerCanNotMoveToAnOccupiedPosition ].
									
	oOccupied at: xOccupiedMoveFromIndex put: aPositionToMoveTo.
	xPlays := true.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:59:22'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo

	|xOccupiedMoveFromIndex|
	
	self gameIsOver ifTrue:[self error: self class aPlayerCannotPlayIfTheGameIsOver].
	
	xOccupiedMoveFromIndex := xOccupied indexOf: aPositionToMoveFrom
									ifAbsent:[self error: self class aPlayerShouldOnlyMoveItsOwnStones].
	(self class isInsideBoard: aPositionToMoveTo) ifFalse:[self error: self class aPlayerCanNotMoveStoneOutOfBoard].
	
	 (aPositionToMoveFrom eightNeighbors includes: aPositionToMoveTo) 
									ifFalse:[ self error: self class aPlayerCanOnlyMoveStoneToANeighborPosition ].
	
	(self isOccupied: aPositionToMoveTo)
									ifTrue:[ self error: self class aPlayerCanNotMoveToAnOccupiedPosition ].
									
	xOccupied at: xOccupiedMoveFromIndex put: aPositionToMoveTo.
	xPlays := false.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:44:04'!
oPlayerCannotBeginGameError

	self error: self class oPlayerCannotBeginGame.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:58:10'!
putOAt: aPosition
	
	state putOAt: aPosition in: self.
	"self boardIsEmpty ifTrue:[self error: self class oPlayerCannotBeginGame].
	self gameIsOver ifTrue:[self error: self class aPlayerCannotPlayIfTheGameIsOver].
	self isPlayingX ifTrue:[self error: self class aPlayerCannotPlayTwoConsecutiveTurns]. 
	(oOccupied size = 3) ifTrue:[self error: self class aPlayerCannotPlaceMoreThanThreeStones].
	(self isOccupied: aPosition) ifTrue:[self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition].
	(self class isInsideBoard: aPosition) ifFalse:[self error: self class aPlayerCannotPlaceStoneOutOfBoard].
	
	oOccupied addLast: aPosition; yourself.
	xPlays := true.
	isBoardEmpty:=false"! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:12:55'!
putXAt: aPosition
	
	state putXAt: aPosition in: self.
	"self isPlayingX ifFalse:[self error: self class aPlayerCannotPlayTwoConsecutiveTurns].
	(self isOccupied: aPosition) ifTrue:[self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition].
	(xOccupied size = 3) ifTrue:[self error: self class aPlayerCannotPlaceMoreThanThreeStones].
	(self class isInsideBoard: aPosition) ifFalse:[self error: self class aPlayerCannotPlaceStoneOutOfBoard].
	
	xOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false"! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:13:27'!
safePutOAt: aPosition
	
	oOccupied addLast: aPosition; yourself.
	xPlays := true.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:17:33'!
safePutXAt: aPosition
	
	xOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false.
	state updateState: self.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 17:03:18'!
updateStateTo: aStateToUpdateTo

	state := (self class states) at: aStateToUpdateTo! !


!TerniLapilli methodsFor: 'initialization' stamp: 'cl 10/16/2019 16:04:23'!
initialize
	xOccupied := OrderedCollection new.
	oOccupied := OrderedCollection new.
	xPlays := true.
	isBoardEmpty := true.
	state := (self class states) at: #XPlayerPutsFirst.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Terni Lapilli'!
TerniLapilli class
	instanceVariableNames: 'states'!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:13:06'!
aPlayerCanNotMoveStoneOutOfBoard
 	^'Movimiento invalido, fuera de tablero'
		! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:39:35'!
aPlayerCanNotMoveToAnOccupiedPosition
	^'un jugador no puede mover hacia una posicion ya ocupada por una piedra del xPlayer'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:26:03'!
aPlayerCanOnlyMoveStoneToANeighborPosition

	^'El jugador solo puede mover a posiciones vecinas'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 21:09:48'!
aPlayerCannotPlaceMoreThanThreeStones
	^'No se pueden agregar mas de tres piedras'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:34:43'!
aPlayerCannotPlaceStoneInAnOccupiedPosition

	^'No se puede colocar una piedra en una posicion ocupada'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:28:05'!
aPlayerCannotPlaceStoneOutOfBoard

	^'No se puede poner una piedra fuera del tablero'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 19:53:47'!
aPlayerCannotPlayIfTheGameIsOver

	^'No se puede continuar jugando, el juego ha terminado'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 19:02:39'!
aPlayerCannotPlayTwoConsecutiveTurns
	^'Un jugador no puede jugar dos veces seguidas'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 12:02:58'!
aPlayerShouldOnlyMoveItsOwnStones
 	^'El jugador solo puede mover desde una posicion en la que tenga una piedra'
		! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:38:34'!
centerOfBoard

	^2@2! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:01:13'!
initialize
	
	self initializeStates! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:54:50'!
initializeStates

	states := Dictionary new.
		
	states at: #XPlayerPutsFirst put: (XPlayerPutsFirst new).
	states at: #OPlayerPutsFirst put: (OPlayerPutsFirst new).
	states at: #XPlayerPutsSecond put: (XPlayerPutsSecond new).
	states at: #OPlayerPutsSecond put: (OPlayerPutsSecond new).
	states at: #XPlayerPutsThird put: (XPlayerPutsThird new).
	states at: #OPlayerPutsThird put: (OPlayerPutsThird new).
	states at: #XPlayerMoves put: (XPlayerMoves new).
	states at: #OPlayerMoves put: (OPlayerMoves new).
	states at: #XPlayerWon put: (XPlayerWon new).
	states at: #OPlayerWon put: (OPlayerWon new).! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:19:44'!
isCornerOfBoard: aPositionToMoveFrom

	^(aPositionToMoveFrom x = self centerOfBoard x) not and: (aPositionToMoveFrom y = self centerOfBoard y) not! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:27:03'!
isGameMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo

	^(aPositionToMoveFrom eightNeighbors includes: aPositionToMoveTo)
	and: (
			(aPositionToMoveFrom = self centerOfBoard)
			or:(aPositionToMoveTo = self centerOfBoard)
			or:(self isCornerOfBoard: aPositionToMoveFrom)
			or:(self isOneDirectionMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo )
			)! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:40:22'!
isInsideBoard:aPosition

	^(aPosition = self centerOfBoard) or: ((self centerOfBoard eightNeighbors ) includes: aPosition)! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 14:22:15'!
isOneDirectionMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo
	|aMovementVector|

	aMovementVector := aPositionToMoveFrom  - aPositionToMoveTo.
	
	^(aMovementVector x = 0) or: (aMovementVector y = 0) ! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:48:00'!
oPlayerCannotBeginGame
	^'El jugador O no puede jugar en el turno de X'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:02:24'!
states

	^states! !


!classDefinition: #TerniLapilliStates category: #'Terni Lapilli'!
Object subclass: #TerniLapilliStates
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilliStates methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:50:21'!
putOAt: aPosition in: aGame

	self subclassResponsibility ! !

!TerniLapilliStates methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:18:46'!
putXAt: aPosition in: aGame

	self subclassResponsibility ! !

!TerniLapilliStates methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:18:17'!
updateState: aGame

	self subclassResponsibility ! !


!classDefinition: #OPlayerMoves category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerMoves
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerMoves methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:50:08'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlaceMoreThanThreeStonesError ! !

!OPlayerMoves methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:09:55'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!OPlayerMoves methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 17:05:28'!
updateState: aGame

	
	aGame updateStateTo: #XPlayerMoves! !


!classDefinition: #OPlayerPutsFirst category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsFirst
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:51:55'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition! !

!OPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:10:23'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!OPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:57:57'!
updateState: aGame

	aGame updateStateTo: #XPlayerPutsSecond! !


!classDefinition: #OPlayerPutsSecond category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsSecond
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:52:43'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition ! !

!OPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:10:35'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!OPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:58:21'!
updateState: aGame

	aGame updateStateTo: #XPlayerPutsThird! !


!classDefinition: #OPlayerPutsThird category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsThird
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsThird methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:53:23'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition ! !

!OPlayerPutsThird methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:10:48'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !


!classDefinition: #OPlayerWon category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:54:43'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!OPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:09:14'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!OPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 17:00:29'!
updateState: aGame

	self shouldNotImplement! !


!classDefinition: #XPlayerMoves category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerMoves
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerMoves methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:56:17'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerMoves methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:11:53'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlaceMoreThanThreeStonesError ! !


!classDefinition: #XPlayerPutsFirst category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsFirst
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:57:48'!
putOAt: aPosition in: aGame

	aGame oPlayerCannotBeginGameError! !

!XPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:11:15'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !

!XPlayerPutsFirst methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:59:03'!
updateState: aGame

	aGame updateStateTo: #OPlayerPutsFirst! !


!classDefinition: #XPlayerPutsSecond category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsSecond
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:56:47'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:11:23'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !

!XPlayerPutsSecond methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:59:21'!
updateState: aGame

	aGame updateStateTo: #OPlayerPutsSecond! !


!classDefinition: #XPlayerPutsThird category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsThird
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsThird methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:56:52'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsThird methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:11:30'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !


!classDefinition: #XPlayerWon category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 15:56:34'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!XPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 16:09:23'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!XPlayerWon methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 17:00:14'!
updateState: aGame

	self shouldNotImplement ! !

TerniLapilli initialize!