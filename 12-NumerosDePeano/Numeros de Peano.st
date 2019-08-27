!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:51:51'!
+ unNumeroDePeano

	^unNumeroDePeano next ! !

!I class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 20:44:28'!
- unNumeroDePeano

	^self error! !

!I class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:27:46'!
next

	^II! !


!classDefinition: #II category: #'Numeros de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:10'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 19:00:32'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 17:52:42'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 17:23:00'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 19:15:27'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:59:15'!
previous
	
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 19:15:37'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:43:44'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #III category: #'Numeros de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros de Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
previous
	
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros de Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
previous
	
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:23'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Numeros de Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous
	
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Numeros de Peano'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous
	
	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Numeros de Peano'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous
	
	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIIIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Numeros de Peano'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:27'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
previous
	
	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !


!classDefinition: #IIIIIIIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: #'Numeros de Peano'!
IIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
* unNumeroDePeano
	|multiplicando multiplicador|
	multiplicando:=self.
	multiplicador:=unNumeroDePeano. 
	[(multiplicador =I)not] whileTrue:[multiplicando _ multiplicando + self. multiplicador _ multiplicador previous].
	^multiplicando
	"unNumeroDePeano = I ifTrue:[^self] ifFalse:[^self + self*unNumeroDePeano previous]"
	! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
- unNumeroDePeano
	|minuendo sustraendo|
	minuendo :=self.
	sustraendo :=unNumeroDePeano.
	[(sustraendo = I) not]whileTrue:[minuendo _ minuendo previous. sustraendo _ sustraendo previous].
	^minuendo previous
	"unNumeroDePeano = I ifTrue:[^self previous] ifFalse:[^self previous - unNumeroDePeano previous]"! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^self-numeroPeano/numeroPeano + I].! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:10:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIIII.! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
previous
	
	^previous! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'cl 8/27/2019 18:01:28'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!