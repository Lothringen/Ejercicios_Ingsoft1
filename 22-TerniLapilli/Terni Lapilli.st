!classDefinition: #Test category: #'Terni Lapilli'!
TestCase subclass: #Test
	instanceVariableNames: 'center upperRightCorner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:55:05'!
setUp

	center := 2@2.
	upperRightCorner := 3@3. ! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:35:36'!
test01XPlayerBeginsAndBoardIsEmpty
	|aGame|

	aGame := TerniLapilli new.
	
	self assert: aGame isPlayingX.
	self assert: aGame boardIsEmpty.
	self deny: aGame isPlayingO.! !

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:37:13'!
test02OPlayerCannotPlayFirst

	|aGame|
	
	aGame := TerniLapilli new.
	self should: [aGame putOAt: center]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = TerniLapilli oPlayerCannotMoveWhileXPlayerPlays.
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

!Test methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:28:38'!
test06PlayerCanNotPlaceStoneInAnOccupiedPosition

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


!classDefinition: #TerniLapilli category: #'Terni Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xPlays isBoardEmpty xOccupied oOccupied'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:45:42'!
boardIsEmpty
	^isBoardEmpty! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:38:26'!
isOccupiedByO: aString 
	^false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:24:23'!
isOccupiedByX: aPosition

	^xOccupied includes: aPosition.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:41:28'!
isPlayingO

	^xPlays not ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 17:49:08'!
isPlayingX

	^xPlays! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:41:50'!
putOAt: aPosition

	(self isOccupiedByX: aPosition) ifTrue:[self error: self class aPlayerCannotPlaceStoneInAnOccupiedPosition]. 
	self isPlayingX ifTrue:[self error: self class oPlayerCannotMoveWhileXPlayerPlays]. 
	
	oOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:22:32'!
putXAt: aPosition
	
	xPlays ifFalse:[self error: self class aPlayerCannotPlayTwoConsecutiveTurns].
	xOccupied addLast: aPosition; yourself.
	xPlays := false.
	isBoardEmpty:=false
	! !


!TerniLapilli methodsFor: 'initialization' stamp: 'cl 10/10/2019 20:21:58'!
initialize
	xOccupied := OrderedCollection new.
	xPlays := true.
	isBoardEmpty := true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Terni Lapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 20:34:43'!
aPlayerCannotPlaceStoneInAnOccupiedPosition

	^'No se puede colocar una piedra en una posicion ocupada'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 19:02:39'!
aPlayerCannotPlayTwoConsecutiveTurns
	^'Un jugador no puede jugar dos veces seguidas'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 18:23:34'!
oPlayerCannotMoveWhileXPlayerPlays
	^'El jugador O no puede jugar en el turno de X'! !
