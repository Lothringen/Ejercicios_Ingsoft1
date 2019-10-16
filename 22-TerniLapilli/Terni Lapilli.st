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

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:14:07'!
test23OPlayerCanNotPutStoneIfGameIsOver

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

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:16:57'!
test40XPlayerCanNotMoveIfGameIsOver

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

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:30:03'!
test48XPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones

	|aGame|
	
	aGame := TerniLapilli new.
	self should: [aGame moveXFrom: center to: rightCenter]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones.
			self assert: aGame isPlayingX.
			self deny: (aGame isOccupiedByX: rightCenter).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:30:12'!
test49OPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: center.
	self should: [aGame moveOFrom: upperRightCorner to: upperCenter]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones.
			self assert: aGame isPlayingO.
			self deny: (aGame isOccupiedByO: upperCenter).]! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:18:03'!
test50XPlayerCanNotPutAStoneIfGameIsOver

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: rightCenter.
	aGame putOAt: upperLeftCorner.
	
	self should: [aGame putXAt: lowerRightCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayIfTheGameIsOver.
			self deny: aGame hasPlayerXWon.
			self assert: aGame hasPlayerOWon.
			self assert: aGame gameIsOver.].
	
	
	
	! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/16/2019 18:19:35'!
test51OPlayerCanNotMoveIfGameIsOver

	|aGame|
	
	aGame := TerniLapilli new.
	aGame putXAt: lowerLeftCorner.
	aGame putOAt: upperCenter.
	aGame putXAt: lowerCenter.
	aGame putOAt: upperRightCorner.
	aGame putXAt: lowerRightCorner.
	
	self should: [aGame moveXFrom: upperCenter to: upperLeftCorner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli aPlayerCannotPlayIfTheGameIsOver.
			self assert: aGame hasPlayerXWon.
			self assert: aGame gameIsOver.].
	
	
	
	! !


!classDefinition: #TerniLapilli category: #'Terni Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xPlays isBoardEmpty xOccupied oOccupied state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 18:35:41'!
checkMoveErrorsFrom:aPositionToMoveFrom to:aPositionToMoveTo

	
	(self class isInsideBoard: aPositionToMoveTo) ifFalse:[self aPlayerCanNotMoveStoneOutOfBoardError ].
	
	 (self class isGameMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo) 
									ifFalse:[ self aPlayerCanOnlyMoveStoneToANeighborPositionError ].
	
	(self isOccupied: aPositionToMoveTo)
									ifTrue:[ self aPlayerCanNotMoveToAnOccupiedPositionError ].
									
	! !

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 18:36:47'!
safeMoveOFrom: aPositionToMoveFrom to: aPositionToMoveTo

	|xOccupiedMoveFromIndex|
	
	xOccupiedMoveFromIndex := oOccupied indexOf: aPositionToMoveFrom
									ifAbsent:[self aPlayerShouldOnlyMoveItsOwnStonesError ].
	self checkMoveErrorsFrom:aPositionToMoveFrom  to: aPositionToMoveTo.
									
	oOccupied at: xOccupiedMoveFromIndex put: aPositionToMoveTo.
	xPlays := true.
	state updateState: self.! !

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 18:37:00'!
safeMoveXFrom: aPositionToMoveFrom to: aPositionToMoveTo

	|xOccupiedMoveFromIndex|
	
	xOccupiedMoveFromIndex := xOccupied indexOf: aPositionToMoveFrom
									ifAbsent:[self aPlayerShouldOnlyMoveItsOwnStonesError ].
	self checkMoveErrorsFrom:aPositionToMoveFrom  to: aPositionToMoveTo.
									
	xOccupied at: xOccupiedMoveFromIndex put: aPositionToMoveTo.
	xPlays := false.
	state updateState: self.! !

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 17:25:39'!
safePutOAt: aPosition
	
	oOccupied addLast: aPosition; yourself.
	xPlays := true.
	state updateState: self.! !

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 16:17:33'!
safePutXAt: aPosition
	
	xOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false.
	state updateState: self.! !

!TerniLapilli methodsFor: 'private' stamp: 'cl 10/16/2019 17:03:18'!
updateStateTo: aStateToUpdateTo

	state := (self class states) at: aStateToUpdateTo! !


!TerniLapilli methodsFor: 'initialization' stamp: 'cl 10/16/2019 16:04:23'!
initialize
	xOccupied := OrderedCollection new.
	oOccupied := OrderedCollection new.
	xPlays := true.
	isBoardEmpty := true.
	state := (self class states) at: #XPlayerPutsFirst.! !


!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 17:56:46'!
aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError

	self error: self class aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 18:10:08'!
aPlayerCanNotMoveStoneOutOfBoardError

	self error: self class aPlayerCanNotMoveStoneOutOfBoard! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 18:11:52'!
aPlayerCanNotMoveToAnOccupiedPositionError

	self error: self class aPlayerCanNotMoveToAnOccupiedPosition! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 18:11:06'!
aPlayerCanOnlyMoveStoneToANeighborPositionError

	self error: self class aPlayerCanOnlyMoveStoneToANeighborPosition! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:46:40'!
aPlayerCannotPlaceMoreThanThreeStonesError

	self error: self class aPlayerCannotPlaceMoreThanThreeStones! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:47:07'!
aPlayerCannotPlaceStoneInAnOccupiedPositionError

	self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:47:46'!
aPlayerCannotPlaceStoneOutOfBoardError

	self error: self class aPlayerCannotPlaceStoneOutOfBoard! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:44:55'!
aPlayerCannotPlayIfTheGameIsOverError

	self error: self class aPlayerCannotPlayIfTheGameIsOver! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:46:10'!
aPlayerCannotPlayTwoConsecutiveTurnsError
	
	self error: self class aPlayerCannotPlayTwoConsecutiveTurns! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 18:09:27'!
aPlayerShouldOnlyMoveItsOwnStonesError

	self error: self class aPlayerShouldOnlyMoveItsOwnStones! !

!TerniLapilli methodsFor: 'error messages' stamp: 'cl 10/16/2019 15:44:04'!
oPlayerCannotBeginGameError

	self error: self class oPlayerCannotBeginGame.
	! !


!TerniLapilli methodsFor: 'access' stamp: 'cl 10/10/2019 18:45:42'!
boardIsEmpty
	^isBoardEmpty! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/16/2019 18:41:41'!
gameIsOver
	^state gameIsOver! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/16/2019 17:25:18'!
hasPlayerOWon
	^(oOccupied size = 3)
	and: ((oOccupied allSatisfy: [:a | a x = a y]) 
		or: (oOccupied allSatisfy: [:a | a x + a y = 4]) 
		or: ((oOccupied allSatisfy: [:a | a x = 1]) or: (oOccupied allSatisfy: [:a | a x = 2]) or: (oOccupied allSatisfy: [:a | a x = 3]))
		or: ((oOccupied allSatisfy: [:a | a y = 1]) or: (oOccupied allSatisfy: [:a | a y = 2]) or: (oOccupied allSatisfy: [:a | a y = 3])))! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/11/2019 20:37:47'!
hasPlayerXWon
	^(xOccupied size = 3)
	and: ((xOccupied allSatisfy: [:a | a x = a y]) 
		or: (xOccupied allSatisfy: [:a | a x + a y = 4]) 
		or: ((xOccupied allSatisfy: [:a | a x = 1]) or: (xOccupied allSatisfy: [:a | a x = 2]) or: (xOccupied allSatisfy: [:a | a x = 3]))
		or: ((xOccupied allSatisfy: [:a | a y = 1]) or: (xOccupied allSatisfy: [:a | a y = 2]) or: (xOccupied allSatisfy: [:a | a y = 3])))! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/11/2019 18:17:45'!
isOccupied: aPosition
	^(self isOccupiedByO: aPosition) or: (self isOccupiedByX: aPosition).! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/11/2019 18:28:36'!
isOccupiedByO: aPosition

	^oOccupied includes: aPosition. ! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/11/2019 18:09:39'!
isOccupiedByX: aPosition

	^xOccupied includes: aPosition.! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/10/2019 18:41:28'!
isPlayingO

	^xPlays not ! !

!TerniLapilli methodsFor: 'access' stamp: 'cl 10/10/2019 17:49:08'!
isPlayingX

	^xPlays! !


!TerniLapilli methodsFor: 'play' stamp: 'cl 10/16/2019 18:06:51'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo

	state moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: self! !

!TerniLapilli methodsFor: 'play' stamp: 'cl 10/16/2019 18:21:21'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo

	state moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: self! !

!TerniLapilli methodsFor: 'play' stamp: 'cl 10/16/2019 17:41:48'!
putOAt: aPosition
	
	(self isOccupied: aPosition) ifTrue:[self aPlayerCannotPlaceStoneInAnOccupiedPositionError ].
	(self class isInsideBoard: aPosition) ifFalse:[self aPlayerCannotPlaceStoneOutOfBoardError ].
	
	state putOAt: aPosition in: self.! !

!TerniLapilli methodsFor: 'play' stamp: 'cl 10/16/2019 17:41:32'!
putXAt: aPosition
	
	(self class isInsideBoard: aPosition) ifFalse:[self aPlayerCannotPlaceStoneOutOfBoardError].
	(self isOccupied: aPosition) ifTrue:[self aPlayerCannotPlaceStoneInAnOccupiedPositionError].
	
	state putXAt: aPosition in: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Terni Lapilli'!
TerniLapilli class
	instanceVariableNames: 'states'!

!TerniLapilli class methodsFor: 'initialization' stamp: 'cl 10/16/2019 16:01:13'!
initialize
	
	self initializeStates! !

!TerniLapilli class methodsFor: 'initialization' stamp: 'cl 10/16/2019 16:54:50'!
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


!TerniLapilli class methodsFor: 'private' stamp: 'cl 10/16/2019 11:38:34'!
centerOfBoard

	^2@2! !

!TerniLapilli class methodsFor: 'private' stamp: 'cl 10/16/2019 14:19:44'!
isCornerOfBoard: aPositionToMoveFrom

	^(aPositionToMoveFrom x = self centerOfBoard x) not and: (aPositionToMoveFrom y = self centerOfBoard y) not! !

!TerniLapilli class methodsFor: 'private' stamp: 'cl 10/16/2019 14:27:03'!
isGameMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo

	^(aPositionToMoveFrom eightNeighbors includes: aPositionToMoveTo)
	and: (
			(aPositionToMoveFrom = self centerOfBoard)
			or:(aPositionToMoveTo = self centerOfBoard)
			or:(self isCornerOfBoard: aPositionToMoveFrom)
			or:(self isOneDirectionMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo )
			)! !

!TerniLapilli class methodsFor: 'private' stamp: 'cl 10/16/2019 11:40:22'!
isInsideBoard:aPosition

	^(aPosition = self centerOfBoard) or: ((self centerOfBoard eightNeighbors ) includes: aPosition)! !

!TerniLapilli class methodsFor: 'private' stamp: 'cl 10/16/2019 14:22:15'!
isOneDirectionMovementFrom: aPositionToMoveFrom to: aPositionToMoveTo
	|aMovementVector|

	aMovementVector := aPositionToMoveFrom  - aPositionToMoveTo.
	
	^(aMovementVector x = 0) or: (aMovementVector y = 0) ! !


!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 17:56:14'!
aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStones
 	^'No se pueden realizar movimientos sin haber colocado las tres piedras en el tablero'
		! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 12:13:06'!
aPlayerCanNotMoveStoneOutOfBoard
 	^'Movimiento invalido, fuera de tablero'
		! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 12:39:35'!
aPlayerCanNotMoveToAnOccupiedPosition
	^'un jugador no puede mover hacia una posicion ya ocupada por una piedra del xPlayer'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 12:26:03'!
aPlayerCanOnlyMoveStoneToANeighborPosition

	^'El jugador solo puede mover a posiciones vecinas'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/11/2019 21:09:48'!
aPlayerCannotPlaceMoreThanThreeStones
	^'No se pueden agregar mas de tres piedras'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/10/2019 20:34:43'!
aPlayerCannotPlaceStoneInAnOccupiedPosition

	^'No se puede colocar una piedra en una posicion ocupada'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 11:28:05'!
aPlayerCannotPlaceStoneOutOfBoard

	^'No se puede poner una piedra fuera del tablero'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/11/2019 19:53:47'!
aPlayerCannotPlayIfTheGameIsOver

	^'No se puede continuar jugando, el juego ha terminado'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/10/2019 19:02:39'!
aPlayerCannotPlayTwoConsecutiveTurns
	^'Un jugador no puede jugar dos veces seguidas'! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/16/2019 12:02:58'!
aPlayerShouldOnlyMoveItsOwnStones
 	^'El jugador solo puede mover desde una posicion en la que tenga una piedra'
		! !

!TerniLapilli class methodsFor: 'error messagges' stamp: 'cl 10/11/2019 17:48:00'!
oPlayerCannotBeginGame
	^'El jugador O no puede jugar en el turno de X'! !


!TerniLapilli class methodsFor: 'accessing' stamp: 'cl 10/16/2019 16:02:24'!
states

	^states! !


!classDefinition: #TerniLapilliStates category: #'Terni Lapilli'!
Object subclass: #TerniLapilliStates
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilliStates methodsFor: 'play' stamp: 'cl 10/16/2019 17:42:55'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	self subclassResponsibility ! !

!TerniLapilliStates methodsFor: 'play' stamp: 'cl 10/16/2019 18:23:00'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	self subclassResponsibility ! !

!TerniLapilliStates methodsFor: 'play' stamp: 'cl 10/16/2019 15:50:21'!
putOAt: aPosition in: aGame

	self subclassResponsibility ! !

!TerniLapilliStates methodsFor: 'play' stamp: 'cl 10/16/2019 16:18:46'!
putXAt: aPosition in: aGame

	self subclassResponsibility ! !


!TerniLapilliStates methodsFor: 'access' stamp: 'cl 10/16/2019 18:41:56'!
gameIsOver

	self subclassResponsibility ! !


!TerniLapilliStates methodsFor: 'private' stamp: 'cl 10/16/2019 16:18:17'!
updateState: aGame

	self subclassResponsibility ! !


!classDefinition: #OPlayerMoves category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerMoves
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerMoves methodsFor: 'private' stamp: 'cl 10/16/2019 17:21:36'!
updateState: aGame

	aGame hasPlayerOWon ifTrue:[aGame updateStateTo: #OPlayerWon]
								ifFalse:[aGame updateStateTo: #XPlayerMoves].! !


!OPlayerMoves methodsFor: 'access' stamp: 'cl 10/16/2019 18:42:20'!
gameIsOver

	^false! !


!OPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 17:43:48'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame safeMoveOFrom: aPositionToMoveFrom to: aPositionToMoveTo! !

!OPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 18:24:12'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError ! !

!OPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 17:36:24'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlaceMoreThanThreeStonesError ! !

!OPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 16:09:55'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !


!classDefinition: #OPlayerPutsFirst category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsFirst
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsFirst methodsFor: 'private' stamp: 'cl 10/16/2019 16:57:57'!
updateState: aGame

	aGame updateStateTo: #XPlayerPutsSecond! !


!OPlayerPutsFirst methodsFor: 'access' stamp: 'cl 10/16/2019 18:42:27'!
gameIsOver

	^false! !


!OPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 17:58:03'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError.! !

!OPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 18:25:39'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError ! !

!OPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 15:51:55'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition! !

!OPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 16:10:23'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !


!classDefinition: #OPlayerPutsSecond category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsSecond
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 17:58:28'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError.! !

!OPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 18:25:43'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError ! !

!OPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 15:52:43'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition ! !

!OPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 16:10:35'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !


!OPlayerPutsSecond methodsFor: 'access' stamp: 'cl 10/16/2019 18:42:32'!
gameIsOver

	^false! !


!OPlayerPutsSecond methodsFor: 'private' stamp: 'cl 10/16/2019 16:58:21'!
updateState: aGame

	aGame updateStateTo: #XPlayerPutsThird! !


!classDefinition: #OPlayerPutsThird category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerPutsThird
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 17:58:36'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError.! !

!OPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 18:25:48'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError ! !

!OPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 15:53:23'!
putOAt: aPosition in: aGame
	
	aGame safePutOAt: aPosition ! !

!OPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 16:10:48'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !


!OPlayerPutsThird methodsFor: 'private' stamp: 'cl 10/16/2019 17:22:40'!
updateState: aGame

	aGame hasPlayerOWon ifTrue:[aGame updateStateTo: #OPlayerWon]
								ifFalse:[aGame updateStateTo: #XPlayerMoves].! !


!OPlayerPutsThird methodsFor: 'access' stamp: 'cl 10/16/2019 18:42:36'!
gameIsOver

	^false! !


!classDefinition: #OPlayerWon category: #'Terni Lapilli'!
TerniLapilliStates subclass: #OPlayerWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!OPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 17:59:04'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayIfTheGameIsOverError.! !

!OPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 18:26:16'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayIfTheGameIsOverError ! !

!OPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 15:54:43'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!OPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 16:09:14'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !


!OPlayerWon methodsFor: 'access' stamp: 'cl 10/16/2019 18:42:45'!
gameIsOver

	^true! !


!OPlayerWon methodsFor: 'private' stamp: 'cl 10/16/2019 17:00:29'!
updateState: aGame

	self shouldNotImplement! !


!classDefinition: #XPlayerMoves category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerMoves
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 18:26:58'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame safeMoveXFrom: aPositionToMoveFrom to: aPositionToMoveTo ! !

!XPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 15:56:17'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerMoves methodsFor: 'play' stamp: 'cl 10/16/2019 16:11:53'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlaceMoreThanThreeStonesError ! !


!XPlayerMoves methodsFor: 'private' stamp: 'cl 10/16/2019 17:22:11'!
updateState: aGame

	aGame hasPlayerXWon ifTrue:[aGame updateStateTo: #XPlayerWon]
								ifFalse:[aGame updateStateTo: #OPlayerMoves].! !


!XPlayerMoves methodsFor: 'access' stamp: 'cl 10/16/2019 18:43:03'!
gameIsOver

	^false! !


!classDefinition: #XPlayerPutsFirst category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsFirst
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 18:01:32'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame oPlayerCannotBeginGameError! !

!XPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 18:27:49'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError ! !

!XPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 15:57:48'!
putOAt: aPosition in: aGame

	aGame oPlayerCannotBeginGameError! !

!XPlayerPutsFirst methodsFor: 'play' stamp: 'cl 10/16/2019 16:11:15'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !


!XPlayerPutsFirst methodsFor: 'access' stamp: 'cl 10/16/2019 18:43:09'!
gameIsOver

	^false! !


!XPlayerPutsFirst methodsFor: 'private' stamp: 'cl 10/16/2019 16:59:03'!
updateState: aGame

	aGame updateStateTo: #OPlayerPutsFirst! !


!classDefinition: #XPlayerPutsSecond category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsSecond
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 18:01:14'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 18:28:21'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError ! !

!XPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 15:56:47'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsSecond methodsFor: 'play' stamp: 'cl 10/16/2019 16:11:23'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !


!XPlayerPutsSecond methodsFor: 'access' stamp: 'cl 10/16/2019 18:43:14'!
gameIsOver

	^false! !


!XPlayerPutsSecond methodsFor: 'private' stamp: 'cl 10/16/2019 16:59:21'!
updateState: aGame

	aGame updateStateTo: #OPlayerPutsSecond! !


!classDefinition: #XPlayerPutsThird category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerPutsThird
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 18:01:45'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 18:28:25'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCanNotMoveAStoneIfItHasNotPlacedAllThreeStonesError ! !

!XPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 15:56:52'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayTwoConsecutiveTurnsError! !

!XPlayerPutsThird methodsFor: 'play' stamp: 'cl 10/16/2019 16:11:30'!
putXAt: aPosition in: aGame
	
	aGame safePutXAt: aPosition ! !


!XPlayerPutsThird methodsFor: 'private' stamp: 'cl 10/16/2019 17:34:49'!
updateState: aGame

	aGame hasPlayerXWon ifTrue:[aGame updateStateTo: #XPlayerWon]
								ifFalse:[aGame updateStateTo: #OPlayerPutsThird].! !


!XPlayerPutsThird methodsFor: 'access' stamp: 'cl 10/16/2019 18:43:19'!
gameIsOver

	^false! !


!classDefinition: #XPlayerWon category: #'Terni Lapilli'!
TerniLapilliStates subclass: #XPlayerWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!XPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 18:01:57'!
moveOFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayIfTheGameIsOverError.! !

!XPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 18:26:31'!
moveXFrom: aPositionToMoveFrom to: aPositionToMoveTo in: aGame

	aGame aPlayerCannotPlayIfTheGameIsOverError ! !

!XPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 15:56:34'!
putOAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !

!XPlayerWon methodsFor: 'play' stamp: 'cl 10/16/2019 16:09:23'!
putXAt: aPosition in: aGame
	
	aGame aPlayerCannotPlayIfTheGameIsOverError! !


!XPlayerWon methodsFor: 'access' stamp: 'cl 10/16/2019 18:43:27'!
gameIsOver

	^true! !


!XPlayerWon methodsFor: 'private' stamp: 'cl 10/16/2019 17:00:14'!
updateState: aGame

	self shouldNotImplement ! !

TerniLapilli initialize!