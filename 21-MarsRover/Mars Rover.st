!classDefinition: #Tests category: #'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: 'north south east west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:02:17'!
setUp

	north := MarsRoverDirectionNorth new.
	south := MarsRoverDirectionSouth new.
	east := MarsRoverDirectionEast new.
	west := MarsRoverDirectionWest new.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:53:03'!
test01InitialPosition

	|aRover |
	aRover := MarsRover inPosition: 1@1 andDirection: south. 
	self assert: aRover position equals: 1@1.
	self assert: aRover direction equals: south.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:56:37'!
test02AnotherInitialPosition

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:56:47'!
test03MoveForwardPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	aRover movement: 'f'.
	self assert: aRover position equals: 3@3.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:56:58'!
test04MoveForwardPointingNorthFromAnotherStartingPosition

	|aRover |
	aRover := MarsRover inPosition: 5@3 andDirection: north. 
	aRover movement: 'f'.
	self assert: aRover position equals: 5@4.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:53:23'!
test05MoveForwardPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: south. 
	aRover movement: 'f'.
	self assert: aRover position equals: 3@1.
	self assert: aRover direction equals: south.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:58:47'!
test06MoveForwardPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: east. 
	aRover movement: 'f'.
	self assert: aRover position equals: 4@2.
	self assert: aRover direction equals: east.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:00'!
test07MoveForwardPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: west. 
	aRover movement: 'f'.
	self assert: aRover position equals: 2@2.
	self assert: aRover direction equals: west.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:57:11'!
test08MoveBackwardsPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	aRover movement: 'b'.
	self assert: aRover position equals: 3@1.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:53:43'!
test09MoveBackwardsPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: south. 
	aRover movement: 'b'.
	self assert: aRover position equals: 3@3.
	self assert: aRover direction equals: south.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:59:02'!
test10MoveBackwardsPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: east. 
	aRover movement: 'b'.
	self assert: aRover position equals: 2@2.
	self assert: aRover direction equals: east.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:16'!
test11MoveBackwardsPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: west. 
	aRover movement: 'b'.
	self assert: aRover position equals: 4@2.
	self assert: aRover direction equals: west.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:26'!
test12RotateLeftPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: west.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:59:09'!
test13RotateLeftPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: south. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: east.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:59:16'!
test14RotateLeftPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: east. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:35'!
test15RotateLeftPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: west. 
	aRover movement: 'l'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: south.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:59:22'!
test16RotateRightPointingNorth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: east.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:45'!
test17RotateRightPointingSouth

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: south. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: west.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:59:31'!
test18RotateRightPointingEast

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: east. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: south.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:51'!
test19RotateRightPointingWest

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: west. 
	aRover movement: 'r'.
	self assert: aRover position equals: 3@2.
	self assert: aRover direction equals: north.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:00:57'!
test20SeveralMovements

	|aRover |
	aRover := MarsRover inPosition: 3@2 andDirection: north. 
	aRover movement: 'frffllb'.
	self assert: aRover position equals: 6@3.
	self assert: aRover direction equals: west.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 13:10:20'!
test21InvalidInitializationReturnsErrorMessage 
	
	self 
		should: [MarsRover inPosition: 3@2 andDirection: ''] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotBeInvalidDirectionErrorMessage ]! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:58:22'!
test22EmptyMovementReturnsErrorMessage 
	|aRover|
	aRover _ MarsRover inPosition: 3@2 andDirection: north.
	self 
		should: [aRover movement: ''] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotPerformEmptyMovementErrorMessage ]! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:58:27'!
test23InvalidMovementReturnsErrorMessage 
	|aRover|
	aRover _ MarsRover inPosition: 3@2 andDirection: north.
	self 
		should: [aRover movement: 'fruta'] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MarsRover cannotPerformInvalidMovementErrorMessage ]! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction movementForward movementBackward movementLeft movementRight charToMovementTranslator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/8/2019 11:06:50'!
direction
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:07:09'!
initializeInPosition: aPosition andDirection: aDirection
	
	position := aPosition.
	direction := aDirection. 
	movementForward := MarsRoverMovementForward new.
	movementBackward := MarsRoverMovementBackward new.
	movementLeft := MarsRoverMovementLeft new.
	movementRight := MarsRoverMovementRight new.
	charToMovementTranslator := (Dictionary new) add: $f->[movementForward performOn: self]; 
															add: $b->[movementBackward performOn: self]; 
															add: $l->[movementLeft performOn: self]; 
															add: $r->[movementRight performOn: self]; yourself.! !

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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:09:13'!
singleMovement: aMovement
	self validMovementCheck: aMovement.
	aMovement = $f ifTrue:[
		position _ direction moveForward: position.
	].
	aMovement = $b ifTrue:[
		position _ direction moveBackwards: position.
	].
	aMovement = $l ifTrue:[
		direction _ direction turnLeft.
		].
	aMovement = $r ifTrue:[
		direction _ direction turnRight.
		]! !

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

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:30:13'!
initialize

	possibleMovements := #($f $b $l $r).! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/9/2019 15:54:55'!
possibleMovements

	^possibleMovements! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:36:20'!
validDirectionCheck: aDirection 
	
	MarsRoverDirections allSubclasses detect: [:aValidDirectionClass | aValidDirectionClass = aDirection class]
					ifNone: [ self error: self cannotBeInvalidDirectionErrorMessage].! !


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

!MarsRoverDirectionEast methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:04:12'!
moveBackwards: aPosition
	
	^aPosition x-1@aPosition y! !

!MarsRoverDirectionEast methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:04:27'!
moveForward: aPosition
	
	^aPosition x +1@aPosition y! !

!MarsRoverDirectionEast methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:48:31'!
turnLeft

	^MarsRoverDirectionNorth new! !

!MarsRoverDirectionEast methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:49:13'!
turnRight

	^MarsRoverDirectionSouth new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionEast class' category: #'Mars Rover'!
MarsRoverDirectionEast class
	instanceVariableNames: 'uniqueinstance'!

!MarsRoverDirectionEast class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:43:58'!
initialize 

	uniqueinstance := self basicNew.! !

!MarsRoverDirectionEast class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:44:27'!
new

	^uniqueinstance! !


!classDefinition: #MarsRoverDirectionNorth category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionNorth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:03:39'!
moveBackwards: aPosition

	^aPosition x @ (aPosition y-1)! !

!MarsRoverDirectionNorth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:03:52'!
moveForward: aPosition

	^aPosition x @ (aPosition y+1)! !

!MarsRoverDirectionNorth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:58:20'!
turnLeft

	^MarsRoverDirectionWest new! !

!MarsRoverDirectionNorth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:58:40'!
turnRight

	^MarsRoverDirectionEast new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionNorth class' category: #'Mars Rover'!
MarsRoverDirectionNorth class
	instanceVariableNames: 'uniqueinstance'!

!MarsRoverDirectionNorth class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:44:46'!
initialize 

	uniqueinstance := self basicNew.! !

!MarsRoverDirectionNorth class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:45:02'!
new

	^uniqueinstance! !


!classDefinition: #MarsRoverDirectionSouth category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionSouth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:03:24'!
moveBackwards: aPosition

	^aPosition x @ (aPosition y+1)! !

!MarsRoverDirectionSouth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:02:59'!
moveForward: aPosition

	^aPosition x @ (aPosition y -1) ! !

!MarsRoverDirectionSouth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:00:14'!
turnLeft

	^MarsRoverDirectionEast new! !

!MarsRoverDirectionSouth methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:00:25'!
turnRight

	^MarsRoverDirectionWest new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionSouth class' category: #'Mars Rover'!
MarsRoverDirectionSouth class
	instanceVariableNames: 'uniqueinstance'!

!MarsRoverDirectionSouth class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:45:14'!
initialize 

	uniqueinstance := self basicNew.! !

!MarsRoverDirectionSouth class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:45:28'!
new 

	^uniqueinstance ! !


!classDefinition: #MarsRoverDirectionWest category: #'Mars Rover'!
MarsRoverDirections subclass: #MarsRoverDirectionWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverDirectionWest methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:01:19'!
moveBackwards: aPosition

	^aPosition x+1 @ aPosition y ! !

!MarsRoverDirectionWest methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:01:31'!
moveForward: aPosition

	^aPosition x-1 @ aPosition y ! !

!MarsRoverDirectionWest methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:02:06'!
turnLeft

	^MarsRoverDirectionSouth new! !

!MarsRoverDirectionWest methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 13:02:24'!
turnRight

	^MarsRoverDirectionNorth new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionWest class' category: #'Mars Rover'!
MarsRoverDirectionWest class
	instanceVariableNames: 'uniqueinstance'!

!MarsRoverDirectionWest class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:45:57'!
initialize 

	uniqueinstance := self basicNew.! !

!MarsRoverDirectionWest class methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 12:45:51'!
new 

	^uniqueinstance ! !


!classDefinition: #MarsRoverMovements category: #'Mars Rover'!
Object subclass: #MarsRoverMovements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverMovements methodsFor: 'as yet unclassified' stamp: 'cl 10/10/2019 11:52:06'!
performOn: aRover

	self subclassResponsibility ! !


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
MarsRoverDirectionEast initialize!
MarsRoverDirectionNorth initialize!
MarsRoverDirectionSouth initialize!
MarsRoverDirectionWest initialize!