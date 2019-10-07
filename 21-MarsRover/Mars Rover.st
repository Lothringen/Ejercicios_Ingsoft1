!classDefinition: #Tests category: #'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:08:20'!
test01InitialPositionAndDirection

	|aRover |
	aRover := MarsRover inPosition: 1@1 andDirection: 'S'. 
	self assert: aRover position equals: 1@1.
	self assert: aRover direction equals: 'S'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:08:25'!
test02DifferentInitialPositionAndDirection

	|aRover |
	aRover := MarsRover inPosition: 1@2 andDirection: 'E'. 
	self assert: aRover position equals: 1@2.
	self assert: aRover direction equals: 'E'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:09:03'!
test03ForwardMoveMarsRover

	|aRover |
	aRover := MarsRover inPosition: 1@1 andDirection: 'O'. 
	
	aRover move: 'f'.
	
	self assert: aRover position equals: 0@1.
	self assert: aRover direction equals: 'O'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:09:15'!
test04AnotherForwardMoveMarsRover

	|aRover |
	aRover := MarsRover inPosition: 2@3 andDirection: 'N'. 
	
	aRover move: 'f'.
	
	self assert: aRover position equals: 2@4.
	self assert: aRover direction equals: 'N'.  ! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:09:36'!
test05BackwardMoveMarsRover

	|aRover |
	aRover := MarsRover inPosition: 4@3 andDirection: 'N'. 
	
	aRover move: 'b'.
	
	self assert: aRover position equals: 4@2.
	self assert: aRover direction equals: 'N'.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:23:32'!
test06RotateMarsRoverLeft

	|aRover |
	aRover := MarsRover inPosition: 4@3 andDirection: 'N'. 
	
	aRover rotate: 'l'.
	
	self assert: aRover position equals: 4@3.
	self assert: aRover direction equals: 'O'.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:22:59'!
test07RotateMarsRoverRight

	|aRover |
	aRover := MarsRover inPosition: 4@3 andDirection: 'N'. 
	
	aRover rotate: 'r'.
	
	self assert: aRover position equals: 4@3.
	self assert: aRover direction equals: 'E'.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:57:14'!
test08RotateSeveralTimes

	|aRover |
	aRover := MarsRover inPosition: 4@3 andDirection: 'N'. 
	
	aRover movement: 'rbrflb'.
	
	self assert: aRover position equals: 2@2.
	self assert: aRover direction equals: 'E'.! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 15:44:48'!
direction
	^direction ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 15:43:39'!
initializeInPosition: aStartingPosition andDirection: aDirectionToPointTo

	position := aStartingPosition.
	direction := aDirectionToPointTo. ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:53:18'!
move: aString 
	aString = 'f' ifTrue:[ 
	direction='N' ifTrue:[position:=(position x)@(position y + 1)].
	direction='S' ifTrue:[position:=(position x)@(position y - 1)].
	direction='E' ifTrue:[position:=(position x + 1)@(position y)].
	direction='O' ifTrue:[position:=(position x - 1)@(position y)].
	].
	aString = 'b' ifTrue:[
	direction='N' ifTrue:[position:=(position x)@(position y - 1)].
	direction='S' ifTrue:[position:=(position x)@(position y + 1)].
	direction='E' ifTrue:[position:=(position x - 1)@(position y)].
	direction='O' ifTrue:[position:=(position x + 1)@(position y)].	
	]

! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:54:32'!
movement: aString 
	|aStringSubstring|
	aStringSubstring := aString.
	[aStringSubstring size = 0] whileFalse:[
		self singleMovement: (aStringSubstring at: 1).
		aStringSubstring := aStringSubstring copyFrom: 2 to: aStringSubstring size
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 15:44:58'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:52:57'!
rotate: aString 
		aString = 'l' ifTrue:[ 
	direction='N' ifTrue:[direction:='O'].
	direction='S' ifTrue:[direction:='E'].
	direction='E' ifTrue:[direction:='N'].
	direction='O' ifTrue:[direction:='S'].
	].
	aString = 'r' ifTrue:[
	direction='N' ifTrue:[direction := 'E'].
	direction='S' ifTrue:[direction:='O'].
	direction='E' ifTrue:[direction:='S'].
	direction='O' ifTrue:[direction:='N'].
	]
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 17:00:31'!
singleMovement: aOneCharacterString
	aOneCharacterString = $l ifTrue:[ 
	direction='N' ifTrue:[direction:='O'].
	direction='S' ifTrue:[direction:='E'].
	direction='E' ifTrue:[direction:='N'].
	direction='O' ifTrue:[direction:='S'].
	].
	aOneCharacterString = $r ifTrue:[
	direction='N' ifTrue:[direction := 'E'].
	direction='S' ifTrue:[direction:='O'].
	direction='E' ifTrue:[direction:='S'].
	direction='O' ifTrue:[direction:='N'].
	].
	aOneCharacterString = $f ifTrue:[ 
	direction='N' ifTrue:[position:=(position x)@(position y + 1)].
	direction='S' ifTrue:[position:=(position x)@(position y - 1)].
	direction='E' ifTrue:[position:=(position x + 1)@(position y)].
	direction='O' ifTrue:[position:=(position x - 1)@(position y)].
	].
	aOneCharacterString = $b ifTrue:[
	direction='N' ifTrue:[position:=(position x)@(position y - 1)].
	direction='S' ifTrue:[position:=(position x)@(position y + 1)].
	direction='E' ifTrue:[position:=(position x - 1)@(position y)].
	direction='O' ifTrue:[position:=(position x + 1)@(position y)].	
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'cl 10/7/2019 16:07:35'!
inPosition: aStartingPosition andDirection: aDirectionToPointTo

	^self new initializeInPosition: aStartingPosition andDirection: aDirectionToPointTo 
	! !
