!classDefinition: #TestsCarrito category: #TusLibros stamp: 'CL 10/30/2019 17:00:51'!
TestCase subclass: #TestsCarrito
	instanceVariableNames: 'aBookFromTheEditorial aCartID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:55:12'!
setUp

	aCartID := 1.
	aBookFromTheEditorial := 'La Odisea'! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 15:34:45'!
test01NewCartIsEmptyAndKnowsItsID

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	

	self assert: aCart isEmpty.
	self assert: aCart id equals: aCartID. ! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test02ACartKnowsAddedProduct

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	aCart addToCart: 1 copiesOf: aBookFromTheEditorial. 

	self deny: aCart isEmpty.
	self assert: aCart totalAmountOfProducts equals: 1.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 1. ! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test03ACartCanHaveMultipleCopiesOfTheSameProduct

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	aCart addToCart: 2 copiesOf: aBookFromTheEditorial.

	self assert: aCart totalAmountOfProducts equals: 2.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 2. ! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test04CanNotAddNegativeAmountsOfProductsToCart

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	
	self 
		should: [aCart addToCart: -1 copiesOf: aBookFromTheEditorial]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText equals: Carrito canNotAddNegativeAmountsOfProductToCartErrorDescription.
	self assert: aCart totalAmountOfProducts equals: 0.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 0.].

	! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test05CanRemoveProductsFromCart

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	aCart addToCart: 1 copiesOf: aBookFromTheEditorial.
	aCart removeFromCart: 1 copiesOf: aBookFromTheEditorial.

	self assert: aCart totalAmountOfProducts equals: 0.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 0. ! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test06CanNotRemoveProductsThatAreNotInCart

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	
	self 
		should: [aCart removeFromCart: 1 copiesOf: aBookFromTheEditorial]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText equals: Carrito canNotRemoveProductsThatAreNotInCartErrorDescription.
	self assert: aCart totalAmountOfProducts equals: 0.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 0.].

	! !

!TestsCarrito methodsFor: 'tests' stamp: 'CL 10/30/2019 16:57:27'!
test07CanNotRemoveNegativeAmountsOfAProductFromCart

	|aCart|
	
	aCart := Carrito createCart: aCartID.
	aCart addToCart: 1 copiesOf: aBookFromTheEditorial.
	
	self 
		should: [aCart removeFromCart: -1 copiesOf: aBookFromTheEditorial]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText equals: Carrito canNotRemoveNegativeAmountsOfAProductFromCart.
	self assert: aCart totalAmountOfProducts equals: 1.
	self assert: (aCart amountOfThisProduct: aBookFromTheEditorial) equals: 1.].

	! !


!classDefinition: #Carrito category: #TusLibros stamp: 'CL 10/30/2019 17:00:51'!
Object subclass: #Carrito
	instanceVariableNames: 'cartID cartProducts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'evaluating' stamp: 'CL 10/30/2019 16:10:51'!
isEmpty
	^cartProducts isEmpty. ! !


!Carrito methodsFor: 'initialization' stamp: 'CL 10/30/2019 16:03:29'!
initializeWithID: anID 
	
	cartID := anID.
	cartProducts := Dictionary new.! !


!Carrito methodsFor: 'accessing' stamp: 'CL 10/30/2019 16:32:40'!
amountOfThisProduct: aBook
	^cartProducts at:aBook ifAbsent:[0]. ! !

!Carrito methodsFor: 'accessing' stamp: 'CL 10/30/2019 15:39:14'!
id
	^cartID! !

!Carrito methodsFor: 'accessing' stamp: 'CL 10/30/2019 16:57:27'!
totalAmountOfProducts
	^cartProducts inject: 0 into: [:totalAmountOfBooks :amountOfABook | totalAmountOfBooks + amountOfABook].! !


!Carrito methodsFor: 'cart actions' stamp: 'CL 10/30/2019 16:52:57'!
addToCart: anAmountOfProducts copiesOf: aProduct 
	
	anAmountOfProducts negative ifTrue:[self error: self class canNotAddNegativeAmountsOfProductToCartErrorDescription].
	cartProducts at: aProduct put: ((cartProducts at: aProduct ifAbsent: [0]) + anAmountOfProducts).! !

!Carrito methodsFor: 'cart actions' stamp: 'CL 10/30/2019 16:51:05'!
removeFromCart: anAmountOfProducts copiesOf: aProduct
	|oldAmountOfProduct|
	
	anAmountOfProducts negative ifTrue:[self error: self class canNotRemoveNegativeAmountsOfAProductFromCart].
	
	oldAmountOfProduct := (cartProducts at: aProduct ifAbsent: [0]).

	(oldAmountOfProduct < anAmountOfProducts) ifTrue: [self error: self class canNotRemoveProductsThatAreNotInCartErrorDescription].

	cartProducts at: aProduct put: (oldAmountOfProduct - anAmountOfProducts). 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros stamp: 'CL 10/30/2019 17:00:51'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'instance creation' stamp: 'CL 10/30/2019 15:37:35'!
createCart: anID 
	
	^self new initializeWithID: anID ! !


!Carrito class methodsFor: 'error messages' stamp: 'CL 10/30/2019 16:52:57'!
canNotAddNegativeAmountsOfProductToCartErrorDescription

	^'No se pueden agregar cantidades negativas del libro al carrito'! !

!Carrito class methodsFor: 'error messages' stamp: 'CL 10/30/2019 16:51:58'!
canNotRemoveNegativeAmountsOfAProductFromCart
	^'No se quitar cantidades negativas del producto del carrito'! !

!Carrito class methodsFor: 'error messages' stamp: 'CL 10/30/2019 16:46:48'!
canNotRemoveProductsThatAreNotInCartErrorDescription

	^'No se puede quitar mas productos de un tipo de los que hay en el carrito'! !
