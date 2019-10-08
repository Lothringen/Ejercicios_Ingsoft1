!classDefinition: #Tests category: #'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 10:56:26'!
test01InitialPosition

	|aRover |
	aRover := MarsRover inPosition: 1@1 andDirection: 'S'. 
	self assert: aRover position equals: 1@1.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:01:17'!
test02AnotherInitialPosition

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:09:56'!
test03MoveForwardPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	aRover movement: 'f'.
	self assert: aRover position equals: 3@3.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:16:18'!
test04MoveForwardPointingNorthFromAnotherStartingPosition

	|aRover |
	aRover := MarsRover inPosition: 5@3 andDirection: 'N'. 
	aRover movement: 'f'.
	self assert: aRover position equals: 5@4.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:14:47'!
test05MoveForwardPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'S'. 
	aRover movement: 'f'.
	self assert: aRover position equals: 3@1.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:22:48'!
test06MoveForwardPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'E'. 
	aRover movement: 'f'.
	self assert: aRover position equals: 4@2.
	self assert: aRover direction equals: 'E'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:25:24'!
test07MoveForwardPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'O'. 
	aRover movement: 'f'.
	self assert: aRover position equals: 2@2.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:28:02'!
test08MoveBackwardsPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	aRover movement: 'b'.
	self assert: aRover position equals: 3@1.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:33:28'!
test09MoveBackwardsPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'S'. 
	aRover movement: 'b'.
	self assert: aRover position equals: 3@3.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:35:39'!
test10MoveBackwardsPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'E'. 
	aRover movement: 'b'.
	self assert: aRover position equals: 2@2.
	self assert: aRover direction equals: 'E'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:37:16'!
test11MoveBackwardsPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'O'. 
	aRover movement: 'b'.
	self assert: aRover position equals: 4@2.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:39:21'!
test12RotateLeftPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:43:03'!
test13RotateLeftPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'S'. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'E'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:45:06'!
test14RotateLeftPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'E'. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:20:04'!
test15RotateLeftPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'O'. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:23:08'!
test16RotateRightPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'E'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:25:26'!
test17RotateRightPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'S'. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:28:22'!
test18RotateRightPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'E'. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:30:28'!
test19RotateRightPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'O'. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:37:29'!
test20SeveralMovements

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: 'N'. 
	aRover movement: 'frffllb'.
	self assert: aRover position equals: 6@3.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:10:20'!
test21InvalidInitializationReturnsErrorMessage 
	
	self 
		should: [MarsRover inPosition: 3@2 andDirection: ''] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotBeInvalidDirectionErrorMessage ]! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:06:50'!
direction
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:27:50'!
initializeInPosition: aPosition andDirection: aDirection
	
	position := aPosition.
	direction := aDirection. 
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:47:19'!
movement: aSeriesOfMovements
	|movementsLeftToPerform|
	movementsLeftToPerform := aSeriesOfMovements.
	[movementsLeftToPerform size = 0] whileFalse:[
		self singleMovement: (movementsLeftToPerform at: 1).
		movementsLeftToPerform := movementsLeftToPerform copyFrom: 2 to: movementsLeftToPerform size
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:06:31'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 12:48:13'!
singleMovement: aMovement
	aMovement = $f ifTrue:[
		direction = 'N' ifTrue:[position _ position x @ (position y + 1)].
		direction = 'S' ifTrue:[position _ position x @ (position y - 1)].
		direction = 'E' ifTrue:[position _ position x +1 @ position y].
		direction = 'O' ifTrue:[position _ position x -1 @ position y]
	].
	aMovement = $b ifTrue:[
		direction = 'N' ifTrue:[position _ position x @ (position y - 1)].
		direction = 'S' ifTrue:[position _ position x @ (position y + 1)].
		direction = 'E' ifTrue:[position _ position x -1 @ position y].
		direction = 'O' ifTrue:[position _ position x +1 @ position y].
	].
	aMovement = $l ifTrue:[
		direction = 'N' 
		ifTrue:[direction _ 'O'] 
		ifFalse:[direction = 'S' 
				ifTrue:[direction _ 'E'] 
				ifFalse:[direction = 'E' 
						ifTrue:[direction _ 'N']
						ifFalse:[direction = 'O' 
								ifTrue:[direction _ 'S']]]].
	].
	aMovement = $r ifTrue:[direction = 'N' 
							ifTrue: [direction _ 'E'] 
							ifFalse:[direction = 'S' 
									ifTrue:[direction _ 'O']
									ifFalse: [direction = 'E' 
											ifTrue:[direction _ 'S'] 
											ifFalse:[direction = 'O' 
													ifTrue: [direction _ 'N']]]]]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:14:58'!
cannotBeInvalidDirectionErrorMessage 

	^'La direccion ingresada es invalida'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:41:42'!
inPosition: aPosition andDirection: aDirection 
	|validDirections|
	validDirections _ #('N' 'S' 'E' 'O').	
	
	(validDirections includes: aDirection) ifFalse: [ self error: self cannotBeInvalidDirectionErrorMessage].
	
	^self new initializeInPosition: aPosition andDirection: aDirection! !
