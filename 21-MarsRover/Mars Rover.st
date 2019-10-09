!classDefinition: #Tests category: #'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: 'north south east west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:57:17'!
setUp

	north := MarsRoverDirectionNorth new.
	south := MarsRoverDirectionSouth new.
	east := MarsRoverDirectionEast new.
	west := MarsRoverDirectionWest new.! !

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

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:30:10'!
test22EmptyMovementReturnsErrorMessage 
	|aRover|
	aRover _ MarsRover inPosition: 3@2 andDirection: 'N'.
	self 
		should: [aRover movement: ''] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotPerformEmptyMovementErrorMessage ]! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:31:55'!
test23InvalidMovementReturnsErrorMessage 
	|aRover|
	aRover _ MarsRover inPosition: 3@2 andDirection: 'N'.
	self 
		should: [aRover movement: 'fruta'] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotPerformInvalidMovementErrorMessage ]! !


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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:30:48'!
movement: aSeriesOfMovements
	|movementsLeftToPerform|
	aSeriesOfMovements = '' ifTrue:[self error: self class cannotPerformEmptyMovementErrorMessage ].
	movementsLeftToPerform := aSeriesOfMovements.
	[movementsLeftToPerform size = 0] whileFalse:[
		self singleMovement: (movementsLeftToPerform at: 1).
		movementsLeftToPerform := movementsLeftToPerform copyFrom: 2 to: movementsLeftToPerform size
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:06:31'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:56:20'!
singleMovement: aMovement
	self validMovementCheck: aMovement.
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:55:57'!
validMovementCheck: aMovement
	(self class possibleMovements includes: aMovement ) ifFalse:[self error: self class cannotPerformInvalidMovementErrorMessage]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: 'possibleMovements validDirections'!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:14:58'!
cannotBeInvalidDirectionErrorMessage 

	^'La direccion ingresada es invalida'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:30:26'!
cannotPerformEmptyMovementErrorMessage  

	^'No se pueden efectuar movimientos nulos'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:32:20'!
cannotPerformInvalidMovementErrorMessage

	^'No se pueden efectuar movimientos invalidos'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:57:33'!
inPosition: aPosition andDirection: aDirection 
		
	
	self validDirectionCheck: aDirection.
	
	^self new initializeInPosition: aPosition andDirection: aDirection! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:49:59'!
initialize

	possibleMovements := #($f $b $l $r).
	validDirections := #('N' 'S' 'E' 'O')! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:54:55'!
possibleMovements

	^possibleMovements! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:57:08'!
validDirectionCheck: aDirection 
	
	(validDirections includes: aDirection) ifFalse: [ self error: self cannotBeInvalidDirectionErrorMessage].! !


!classDefinition: #MarsRoverDirections category: #'Mars Rover'!
Object subclass: #MarsRoverDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirections methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:13:10'!
singleMovement: aMovement

	^self subclassResponsibility 

	! !


!classDefinition: #MarsRoverDirectionEast category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionEast methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:14:56'!
singleMovement: aMovement
! !


!classDefinition: #MarsRoverDirectionNorth category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionNorth methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:13:31'!
singleMovement: aMovement! !


!classDefinition: #MarsRoverDirectionSouth category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionSouth methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:13:36'!
singleMovement: aMovement! !


!classDefinition: #MarsRoverDirectionWest category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionWest methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 16:13:42'!
singleMovement: aMovement! !


!classDefinition: #MarsRoverMovements category: #'Mars Rover'!
Object subclass: #MarsRoverMovements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #MarsRoverMovementBackward category: #'Mars Rover'!
MarsRoverMovements subclass: #MarsRoverMovementBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #MarsRoverMovementForward category: #'Mars Rover'!
MarsRoverMovements subclass: #MarsRoverMovementForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #MarsRoverMovementLeft category: #'Mars Rover'!
MarsRoverMovements subclass: #MarsRoverMovementLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #MarsRoverMovementRight category: #'Mars Rover'!
MarsRoverMovements subclass: #MarsRoverMovementRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

MarsRover initialize!