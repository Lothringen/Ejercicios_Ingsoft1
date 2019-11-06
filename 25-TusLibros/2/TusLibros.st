!classDefinition: #CartTest category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:11:14'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!CartTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:12:27'!
defaultPrice

	^20! !

!CartTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:12:12'!
defaultPriceList
	
	^ Dictionary with: self itemSellByTheStore -> self defaultPrice! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'mpriResponse mpriWasCalled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'CL 11/4/2019 19:53:31'!
test01AnEmptyCartCanNotCheckout

	| aCart aCashier aCreditCard aDate aSalesBook |
	aCart := self createCart.
	aCreditCard := self createCreditCardValidForToday.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	aDate := self today.
	
	self 
		should:[aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:error| self assert: error messageText equals: Cashier anEmptyCartCanNotCheckoutErrorDescription.
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/6/2019 16:47:36'!
test02CashierCheckoutsValidCartCorrectly

	| aCart aCashier aCreditCard aDate aSalesBook totalPrice |
	aCart := self createCart.
	aDate := self today.
	aCreditCard := self createCreditCardValidForToday.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	
	aCart add: self itemSellByTheStore.
	totalPrice := aCashier checkoutOf: aCart withCC: aCreditCard andDate: aDate.
	
	self assert: (aSalesBook last) equals: totalPrice.
	self assert: aCart isEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/4/2019 20:49:21'!
test03AnExpiredCreditCardCanNotCheckout

	| aCart aCashier aCreditCard aDate aSalesBook |
	aCart := self createCart.
	aCart add: self itemSellByTheStore.
	aCreditCard := self createCreditCardInvalidForToday.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	aDate := self today.
	
	self 
		should:[aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:error| self assert: error messageText equals: Cashier anInvalidCreditCardCanNotCheckoutErrorDescription.
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/4/2019 21:02:56'!
test04ACreditCardWithExceedingAmountOfLetersInOwnersNameCanNotCheckout

	| aCart aCashier aCreditCard aDate aSalesBook |
	aCart := self createCart.
	aCart add: self itemSellByTheStore.
	aCreditCard := self createCreditCardWithInvalidUserName.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	aDate := self today.
	
	self 
		should:[aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:error| self assert: error messageText equals: Cashier anInvalidCreditCardCanNotCheckoutErrorDescription.
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/4/2019 21:03:29'!
test05ACreditCardWithExceedingAmountOfDigitsInIDCanNotCheckout

	| aCart aCashier aCreditCard aDate aSalesBook |
	aCart := self createCart.
	aCart add: self itemSellByTheStore.
	aCreditCard := self createCreditCardWithInvalidID.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	aDate := self today.
	
	self 
		should:[aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:error| self assert: error messageText equals: Cashier anInvalidCreditCardCanNotCheckoutErrorDescription.
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/6/2019 16:43:13'!
test06CheckoutDoesNotCompleteWhenInterfaceReturnsError

	| aCart aCashier aCreditCard aDate aSalesBook |
	aCart := self createCart.
	aCart add: self itemSellByTheStore .
	aDate := self today.
	aCreditCard := self createCreditCardValidForToday.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	mpriResponse := [self error: 'La tarjeta no tiene fondos suficientes'].
	
	self
		should:[aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:error| self assert: error messageText equals: 'La tarjeta no tiene fondos suficientes'.
			self assert: aSalesBook isEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'CL 11/6/2019 16:49:33'!
test07MPRIIsCalledEvenIfThereIsNoError

	| aCart aCashier aCreditCard aDate aSalesBook totalPrice |
	aCart := self createCart.
	aCart add: self itemSellByTheStore .
	aDate := self today.
	aCreditCard := self createCreditCardValidForToday.
	aSalesBook := self createSalesBook.
	aCashier := self createCashierWith: aSalesBook.
	mpriResponse := [].
	mpriWasCalled := false.
	
	totalPrice := aCashier checkoutOf: aCart withCC:aCreditCard andDate:aDate.
	
	self assert: (aSalesBook last) equals: totalPrice.
	self assert: aCart isEmpty.
	self assert: mpriWasCalled.
	! !


!CashierTest methodsFor: 'mpriSimulator' stamp: 'CL 11/6/2019 16:50:34'!
charge: aTotalPrice on: aCreditCard 
	mpriWasCalled := true.
	mpriResponse value.! !


!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:13:34'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/6/2019 16:31:21'!
createCashierWith: aSalesBook
	^Cashier withSalesBook: aSalesBook andMPRI: self.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/6/2019 16:31:59'!
createCreditCardInvalidForToday
	^CreditCard withID: '1' withOwner: 'defaultOwnerName' withExpDate: self invalidExpirationDateFromToday.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/6/2019 16:32:04'!
createCreditCardValidForToday
	^CreditCard withID: '1' withOwner: 'defaultOwnerName' withExpDate: self validExpirationDateFromToday.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 20:57:49'!
createCreditCardWithInvalidID
	^CreditCard withID: '1000000000000000' withOwner: 'defaultOwnerName' withExpDate: self validExpirationDateFromToday.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/6/2019 16:32:12'!
createCreditCardWithInvalidUserName
	^CreditCard withID: '1' withOwner: 'OwnerNameWithExceedingAmountOfL' withExpDate: self validExpirationDateFromToday.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:31:13'!
createSalesBook
	^OrderedCollection new.! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:13:46'!
defaultPrice

	^20! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:13:57'!
defaultPriceList
	
	^ Dictionary with: self itemSellByTheStore -> self defaultPrice! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 20:23:20'!
invalidExpirationDateFromToday
	^FixedGregorianDate today monthOfYear previous! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:14:13'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:44:30'!
today
	^FixedGregorianDate today! !

!CashierTest methodsFor: 'support' stamp: 'CL 11/4/2019 19:45:49'!
validExpirationDateFromToday
	^FixedGregorianDate today monthOfYear next! !


!classDefinition: #Cart category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
Object subclass: #Cart
	instanceVariableNames: 'priceList items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'CL 11/4/2019 20:07:02'!
assertIsValidItem: anItem

	(priceList includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'CL 11/4/2019 20:04:23'!
initializeAcceptingItemsOf: aPriceList

	priceList := aPriceList.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'CL 10/31/2019 21:05:27'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items add: anItem withOccurrences: aQuantity! !


!Cart methodsFor: 'as yet unclassified' stamp: 'CL 11/4/2019 20:14:45'!
emptyCart
	items := OrderedCollection new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'CL 11/4/2019 20:10:25'!
totalPrice
	^items inject: 0 into:[:totalPrice :item| totalPrice + (priceList at: item)] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'CL 11/4/2019 20:04:31'!
acceptingItemsOf: aPriceList

	^self new initializeAcceptingItemsOf: aPriceList ! !


!classDefinition: #Cashier category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook mpri'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'CL 11/4/2019 21:24:03'!
initializeWithSalesBook: aSalesBook andMPRI: aMPRI
	salesBook := aSalesBook.
	mpri := aMPRI.! !


!Cashier methodsFor: 'private' stamp: 'CL 11/4/2019 21:05:27'!
isInvalidID: anID 
	^anID size > 15! !

!Cashier methodsFor: 'private' stamp: 'CL 11/4/2019 21:02:08'!
isInvalidName: aName

	^aName size > 30! !


!Cashier methodsFor: 'assertions' stamp: 'CL 11/6/2019 16:58:52'!
assertCartIsNotEmpty: aCart
	
	
	aCart isEmpty ifTrue: [^self error: self class anEmptyCartCanNotCheckoutErrorDescription].
! !

!Cashier methodsFor: 'assertions' stamp: 'CL 11/6/2019 17:02:39'!
assertCheckoutRestrictionsAreMetForCreditCard: aCreditCard forDate: aDate
	
	self assertCreditCardHasNotExpired: aCreditCard forDate: aDate.
	self assertCreditCardHasValidOwnerName: aCreditCard.
	self assertCreditCardHasValidID: aCreditCard.
	! !

!Cashier methodsFor: 'assertions' stamp: 'CL 11/6/2019 17:00:40'!
assertCreditCardHasNotExpired: aCreditCard forDate: aDate
	
	(aCreditCard hasExpiredBy: aDate) ifTrue: [^self error: self class anInvalidCreditCardCanNotCheckoutErrorDescription].! !

!Cashier methodsFor: 'assertions' stamp: 'CL 11/6/2019 17:02:24'!
assertCreditCardHasValidID: aCreditCard
	
	(self isInvalidID: aCreditCard cardID) ifTrue: [^self error: self class anInvalidCreditCardCanNotCheckoutErrorDescription].
	! !

!Cashier methodsFor: 'assertions' stamp: 'CL 11/6/2019 17:01:43'!
assertCreditCardHasValidOwnerName: aCreditCard
	
	(self isInvalidName: aCreditCard OwnerName) ifTrue: [^self error: self class anInvalidCreditCardCanNotCheckoutErrorDescription].! !


!Cashier methodsFor: 'checkout' stamp: 'CL 11/6/2019 16:59:37'!
checkoutOf: aCart withCC: aCreditCard andDate: aDate 
	
	| totalPrice |
	
	self assertCartIsNotEmpty: aCart.
	self assertCheckoutRestrictionsAreMetForCreditCard: aCreditCard forDate: aDate.
	 
	totalPrice := aCart totalPrice.
	mpri charge: totalPrice on: aCreditCard.
	aCart emptyCart.
	salesBook addLast: totalPrice.
	
	^totalPrice! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'CL 11/4/2019 21:21:52'!
withSalesBook: aSalesBook andMPRI: aMPRI
	
	^self new initializeWithSalesBook: aSalesBook andMPRI: aMPRI! !


!Cashier class methodsFor: 'errors' stamp: 'CL 11/4/2019 19:37:31'!
anEmptyCartCanNotCheckoutErrorDescription
	^'No se puede cobrar a un carrito vacio'! !


!Cashier class methodsFor: 'as yet unclassified' stamp: 'CL 11/4/2019 20:24:44'!
anInvalidCreditCardCanNotCheckoutErrorDescription
	^'No se puede cobrar a una tarjeta vencida'! !


!classDefinition: #CreditCard category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
Object subclass: #CreditCard
	instanceVariableNames: 'iD ownerName expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'CL 11/4/2019 19:30:33'!
initializeWithID: anID withOwner: anOwnerName withExpDate: anExpirationDate
	iD := anID.
	ownerName := anOwnerName.
	expirationDate := anExpirationDate.! !


!CreditCard methodsFor: 'accessing' stamp: 'CL 11/4/2019 21:00:20'!
OwnerName
	^ownerName ! !

!CreditCard methodsFor: 'accessing' stamp: 'CL 11/4/2019 21:04:56'!
cardID
	^iD! !

!CreditCard methodsFor: 'accessing' stamp: 'CL 11/4/2019 20:29:10'!
hasExpiredBy: aDate 
	^expirationDate < aDate monthOfYear.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros stamp: 'CL 11/6/2019 17:06:18'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'CL 11/4/2019 19:53:15'!
withID: anID withOwner: anOwnerName withExpDate: anExpirationDate 

	^self new initializeWithID: anID withOwner: anOwnerName withExpDate: anExpirationDate ! !
