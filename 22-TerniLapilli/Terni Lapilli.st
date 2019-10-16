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


!classDefinition: #TerniLapilli category: #'Terni Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xPlays isBoardEmpty xOccupied oOccupied'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 13:10:42'!
putOAt: aPosition
	
	self boardIsEmpty ifTrue:[self error: self class oPlayerCannotBeginGame].
	self gameIsOver ifTrue:[self error: self class aPlayerCannotPlayIfTheGameIsOver].
	self isPlayingX ifTrue:[self error: self class aPlayerCannotPlayTwoConsecutiveTurns]. 
	(oOccupied size = 3) ifTrue:[self error: self class aPlayerCannotPlaceMoreThanThreeStones].
	(self isOccupied: aPosition) ifTrue:[self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition].
	(self class isInsideBoard: aPosition) ifFalse:[self error: self class aPlayerCannotPlaceStoneOutOfBoard].
	
	oOccupied addLast: aPosition; yourself.
	xPlays := true.
	isBoardEmpty:=false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:41:18'!
putXAt: aPosition
	
	self isPlayingX ifFalse:[self error: self class aPlayerCannotPlayTwoConsecutiveTurns].
	(self isOccupied: aPosition) ifTrue:[self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition].
	(xOccupied size = 3) ifTrue:[self error: self class aPlayerCannotPlaceMoreThanThreeStones].
	(self class isInsideBoard: aPosition) ifFalse:[self error: self class aPlayerCannotPlaceStoneOutOfBoard].
	
	xOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false! !


!TerniLapilli methodsFor: 'initialization' stamp: 'cl 10/11/2019 20:39:03'!
initialize
	xOccupied := OrderedCollection new.
	oOccupied := OrderedCollection new.
	xPlays := true.
	isBoardEmpty := true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Terni Lapilli'!
TerniLapilli class
	instanceVariableNames: ''!

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 11:40:22'!
isInsideBoard:aPosition

	^(aPosition = self centerOfBoard) or: ((self centerOfBoard eightNeighbors ) includes: aPosition)! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/11/2019 17:48:00'!
oPlayerCannotBeginGame
	^'El jugador O no puede jugar en el turno de X'! !
