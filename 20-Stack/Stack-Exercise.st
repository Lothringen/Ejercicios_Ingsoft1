!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'cl 9/17/2019 17:51:09'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cl 9/17/2019 17:50:39'!
test01EmptyStackReturnsEmptyCollection

	| stack string sentenceFinder|
	
	stack := OOStack new.
	sentenceFinder:= SentenceFinderByPrefix new.
	
	string:= 'hola'.
	
	self assert: (sentenceFinder find:string inStack: stack) = OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cl 9/17/2019 18:45:41'!
test02StackWithOneElement
	"Todavia no esta implementado"
	| stack string sentenceFinder|
	
	stack := OOStack new.
	sentenceFinder:= SentenceFinderByPrefix new.
	
	string:= 'hola'.
	
	self assert: (sentenceFinder find:string inStack: stack) = OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cl 9/17/2019 18:42:44'!
test03FinderIsCaseSensitive

	| stack prefix sentenceFinder foundCollection firstPushedObject secondPushedObject  thirdPushedObject|
	
	stack := OOStack new.
	
	sentenceFinder:= SentenceFinderByPrefix new.
	
	foundCollection:= OrderedCollection with:'arco' with:'arroz'.
	
	prefix := 'ar'.
	
	firstPushedObject := 'arroz'.
	secondPushedObject := 'Argentina'.
	thirdPushedObject := 'arco'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject.
	
	self assert: (sentenceFinder find:prefix inStack: stack) = foundCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cl 9/17/2019 18:52:05'!
test04CollectionOfFoundSentencesKeepsTheSameOrderThanInStack

	| stack prefix sentenceFinder foundCollection firstPushedObject secondPushedObject  thirdPushedObject |
	
	stack := OOStack new.
	
	sentenceFinder:= SentenceFinderByPrefix new.
	
	foundCollection:= OrderedCollection with:'arco' with:'arroz'.
	
	prefix := 'ar'.
	
	firstPushedObject := 'arroz'.
	secondPushedObject := 'mandarina'.
	thirdPushedObject := 'arco'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject.
	
	self assert: (sentenceFinder find:prefix inStack: stack) = foundCollection.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 13:25:32'!
SentenceFinderByPrefix: aPrefix


	^orderedCollection select: [:aString | (aString copyFrom: 1 to: aPrefix size) = aPrefix].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 09:58:12'!
initialize

	orderedCollection := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 11:02:24'!
isEmpty

	^orderedCollection isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:31:58'!
pop

	^(OOStackState with: self) pop: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'cl 9/16/2019 21:47:49'!
push: aString

	orderedCollection add: aString.
	^self
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:04:42'!
safePop

	^orderedCollection removeLast! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:35:18'!
safeTop

	^orderedCollection last! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'cl 9/16/2019 19:57:41'!
size

	^orderedCollection size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:35:46'!
top

	^(OOStackState with: self) top: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'instance creation' stamp: 'mn 9/17/2019 10:30:07'!
with: aStack 
		
	|oOStackStateClass|
	
	oOStackStateClass := OOStackState subclasses detect: [:anOOStackStateClass | anOOStackStateClass isStackInMyState: aStack].
	^oOStackStateClass new! !


!classDefinition: #EmptyState category: #'Stack-Exercise'!
OOStackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 13:09:52'!
obtainValuesFromStack: aStack andPutThemIn: sentencesWithPrefixesCollection

	^sentencesWithPrefixesCollection! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:31:29'!
pop: aStack

	Error signal: OOStack stackEmptyErrorDescription! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:34:10'!
top: aStack

	Error signal: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: #'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 09:57:12'!
isStackInMyState: aStack

	^aStack size = 0! !


!classDefinition: #OccupiedState category: #'Stack-Exercise'!
OOStackState subclass: #OccupiedState
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OccupiedState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 13:19:15'!
obtainValuesFromStack: aStack andPutThemIn: sentencesWithPrefixesCollection

	|aSentence retournableSentencesWithPrefixesCollection|
	aSentence := aStack pop.
	sentencesWithPrefixesCollection addLast: aSentence.
	retournableSentencesWithPrefixesCollection :=
		(OOStackState with:aStack) obtainValuesFromStack: aStack andPutThemIn: sentencesWithPrefixesCollection.
	aStack push: aSentence.
	^retournableSentencesWithPrefixesCollection! !

!OccupiedState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:34:26'!
pop: aStack

	^aStack safePop! !

!OccupiedState methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 10:34:54'!
top: aStack

	^aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OccupiedState class' category: #'Stack-Exercise'!
OccupiedState class
	instanceVariableNames: ''!

!OccupiedState class methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 09:56:59'!
isStackInMyState: aStack

	^aStack size > 0! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 13:26:05'!
find: aPrefix

	|sentencesWithPrefixesCollection retournableSentencesWithPrefixesCollection|
	
	sentencesWithPrefixesCollection:=OrderedCollection new.
	
	retournableSentencesWithPrefixesCollection :=
		(OOStackState with: stack) obtainValuesFromStack: stack andPutThemIn: sentencesWithPrefixesCollection.
		
	^retournableSentencesWithPrefixesCollection select: [:aString | (aString copyFrom: 1 to: aPrefix size) = aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mn 9/17/2019 13:25:16'!
find: aPrefix inStack: aStack

	|sentencesWithPrefixesCollection retournableSentencesWithPrefixesCollection|
	
	sentencesWithPrefixesCollection:=OrderedCollection new.
	
	retournableSentencesWithPrefixesCollection :=
		(OOStackState with: aStack) obtainValuesFromStack: aStack andPutThemIn: sentencesWithPrefixesCollection.
		
	^retournableSentencesWithPrefixesCollection select: [:aString | (aString copyFrom: 1 to: aPrefix size) = aPrefix].! !
