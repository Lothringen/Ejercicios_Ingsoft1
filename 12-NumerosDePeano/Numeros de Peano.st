!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'cl 8/28/2019 18:18:20'!
* numeroPeano
	^numeroPeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:51:51'!
+ unNumeroDePeano

	^unNumeroDePeano next ! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 01:39:58'!
- unNumeroDePeano

	Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:05:02'!
/ numeroPeano

	numeroPeano = self ifTrue:[^I] ifFalse:[Error signal: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:04:53'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 01:39:01'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros negativos no soportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:29:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:11:50'!
next

	^next! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:13:26'!
previous

	Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:18:52'!
previousTruncado

	^I! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:07:27'!
restaInversa: numeroPeano

	^numeroPeano previous! !

!I class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:19:08'!
restaTruncadaInversa: numeroPeano

	^numeroPeano  previousTruncado! !


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

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:08:20'!
* numeroPeano
	^numeroPeano + (numeroPeano*self previous)
	
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 19:00:32'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 02:00:51'!
- unNumeroDePeano
	
	^unNumeroDePeano restaInversa: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:24:52'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^(numeroPeano restaTruncadaInversa: self)/numeroPeano + I].! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:10:21'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:29:25'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:17:32'!
previousTruncado

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'cl 8/26/2019 18:43:44'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 02:11:41'!
restaInversa: numeroPeano

	^self previous restaInversa: numeroPeano previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:17:55'!
restaTruncadaInversa: numeroPeano

	^self previousTruncado restaTruncadaInversa: numeroPeano previousTruncado! !


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

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:25'!
* numeroPeano
	^numeroPeano + (numeroPeano*self previous)
	
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:25'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:25'!
- unNumeroDePeano
	
	^unNumeroDePeano restaInversa: self! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:25'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^(numeroPeano restaTruncadaInversa: self)/numeroPeano + I].! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previous
	
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previousTruncado

	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
restaInversa: numeroPeano

	^self previous restaInversa: numeroPeano previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
restaTruncadaInversa: numeroPeano

	^self previousTruncado restaTruncadaInversa: numeroPeano previousTruncado! !


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

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
* numeroPeano
	^numeroPeano + (numeroPeano*self previous)
	
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
- unNumeroDePeano
	
	^unNumeroDePeano restaInversa: self! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
/ numeroPeano
	numeroPeano = self ifTrue:[^I] ifFalse:[^(numeroPeano restaTruncadaInversa: self)/numeroPeano + I].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:29:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
next
	
	next ifNil:[next _ self cloneNamed: self name,'I' ].
	next previous: self.
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previous
	
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previous: unNumeroDePeano

	previous _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
previousTruncado

	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next:=nil.
		
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
restaInversa: numeroPeano

	^self previous restaInversa: numeroPeano previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MN 8/30/2019 19:27:26'!
restaTruncadaInversa: numeroPeano

	^self previousTruncado restaTruncadaInversa: numeroPeano previousTruncado! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!