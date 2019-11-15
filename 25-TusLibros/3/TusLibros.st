!classDefinition: #CartTest category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #ClientRestInterfaceTest category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
TestCase subclass: #ClientRestInterfaceTest
	instanceVariableNames: 'testObjectsFactory userCheckerSimulatorClosure cartActionsTimeInterval'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ClientRestInterfaceTest methodsFor: 'timeoutChecker' stamp: 'CL 11/14/2019 15:50:56'!
makeThirtyMinutesTimePassFor: aCartID

	cartActionsTimeInterval at: aCartID put: ((cartActionsTimeInterval at: aCartID) - (Duration minutes: 30)).! !


!ClientRestInterfaceTest methodsFor: 'setUp' stamp: 'CL 11/14/2019 15:48:37'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	cartActionsTimeInterval := Dictionary new.! !


!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:33:54'!
test01CanCreateCartWithValidUser
	|aCartID aSalesInputRestInterface|

	aSalesInputRestInterface := self newClientRestInterface. 
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	
	self assert: ((aSalesInputRestInterface listCart: aCartID) isEmpty).! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:33:58'!
test02CanNotCreateCartWithInvalidUser

	userCheckerSimulatorClosure := [self error: ClientRestInterface canNotCreateCartWithInvalidUserErrorMessage].
	self
	should: [(self newClientRestInterface) createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotCreateCartWithInvalidUserErrorMessage.]! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:34:05'!
test03ValidUserCanCreateMultipleCarts
	|aFirstCartID aSecondCartID aSalesInputRestInterface|

	aSalesInputRestInterface := self newClientRestInterface. 
	aFirstCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	aSecondCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	
	self assert: ((aSalesInputRestInterface listCart: aFirstCartID) isEmpty).
	self assert: ((aSalesInputRestInterface listCart: aSecondCartID) isEmpty).
	self deny: (aFirstCartID = aSecondCartID).! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:34:10'!
test04CanAddItemsToCart
	|aCartID aSalesInputRestInterface anItem|

	aSalesInputRestInterface := self newClientRestInterface. 
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem. 
	
	self assert: ((aSalesInputRestInterface listCart: aCartID) occurrencesOf: anItem) equals: 2.! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:34:21'!
test05CanAddItemsToMultipleCarts
	|aFirstCartID aSecondCartID aSalesInputRestInterface anItem|

	aSalesInputRestInterface := self newClientRestInterface. 
	aFirstCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	aSecondCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aFirstCartID thisAmount: 2 ofThisItem: anItem.
	aSalesInputRestInterface addToCart: aSecondCartID thisAmount: 3 ofThisItem: anItem.
	
	self assert: ((aSalesInputRestInterface listCart: aFirstCartID) occurrencesOf: anItem) equals: 2.
	self assert: ((aSalesInputRestInterface listCart: aSecondCartID) occurrencesOf: anItem) equals: 3.! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/11/2019 21:36:29'!
test06CanCheckoutACart
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	
	self assert: ((aSalesInputRestInterface listCart: aCartID) occurrencesOf: anItem) equals: 2.
	self assert:(aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword ) equals: anItem asString , '|2|' , ((testObjectsFactory defaultCatalog at: anItem)*2) asString.! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 12:11:58'!
test07CanListPurchasesOfMoreThanOneCart
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate aSecondCartID |

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	aSecondCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aSalesInputRestInterface addToCart: aSecondCartID thisAmount: 3 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aSecondCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	
	self assert: ((aSalesInputRestInterface listCart: aCartID) occurrencesOf: anItem) equals: 2.
	self assert: ((aSalesInputRestInterface listCart: aSecondCartID) occurrencesOf: anItem) equals: 3.
	self assert:(aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword ) equals: anItem asString , '|5|' , ((testObjectsFactory defaultCatalog at: anItem)*5) asString.! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 14:47:38'!
test08ListPurchasesOnlyCountsCheckedoutCarts
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate aSecondCartID |

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	aSecondCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aSalesInputRestInterface addToCart: aSecondCartID thisAmount: 3 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	
	self assert: ((aSalesInputRestInterface listCart: aCartID) occurrencesOf: anItem) equals: 2.
	self assert: ((aSalesInputRestInterface listCart: aSecondCartID) occurrencesOf: anItem) equals: 3.
	self assert:(aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword) equals: anItem asString , '|2|' , ((testObjectsFactory defaultCatalog at: anItem)*2) asString.! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 13:56:48'!
test09CanNotAddItemsToInvalidCart
	|aCartID aSalesInputRestInterface anItem anInvalidCartID|

	aSalesInputRestInterface := self newClientRestInterface. 
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	anInvalidCartID := aCartID asString , 'Invalid'.
	
	self
	should: [aSalesInputRestInterface addToCart: anInvalidCartID  thisAmount: 2 ofThisItem: anItem.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotAddToInvalidCartErrorMessage.
			self assert: (aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword) equals: '0'.].
	
	! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 13:56:42'!
test10CanNotListInvalidCart
	|aCartID aSalesInputRestInterface anItem anInvalidCartID|

	aSalesInputRestInterface := self newClientRestInterface. 
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	anInvalidCartID := aCartID asString , 'Invalid'.
	
	self
	should: [(aSalesInputRestInterface listCart: anInvalidCartID) occurrencesOf: anItem.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotListInvalidCartErrorMessage.].! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 14:17:42'!
test11CanNotCheckoutInvalidCart
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate anInvalidCartID|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	anInvalidCartID := aCartID asString , 'Invalid'.
	
	self
	should: [aSalesInputRestInterface checkoutCart: anInvalidCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotCheckoutInvalidCartErrorMessage.
			self assert: (aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword) equals: '0'.].
	
! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 14:29:03'!
test12CanNotCheckoutACheckedoutCart
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	
	self
	should: [aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotCheckoutACheckedoutCartErrorMessage.
			self assert:(aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword ) equals: anItem asString , '|2|' , ((testObjectsFactory defaultCatalog at: anItem)*2) asString.].! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 14:32:27'!
test13CanNotAddItemsToACheckedoutCart
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	
	self
	should: [aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotAddItemsToACheckedoutCartErrorMessage.
			self assert: ((aSalesInputRestInterface listCart: aCartID) occurrencesOf: anItem) equals: 2.].! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 14:54:28'!
test14CanNotListPurchasesOfInvalidUser
	|aCartID aSalesInputRestInterface anItem aCreditCardNumber aCreditCardOwnerName aCreditCardExpirationDate|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: 								aCreditCardExpirationDate withCCO: aCreditCardOwnerName.
	userCheckerSimulatorClosure := [self error: ClientRestInterface canNotListPurchasesOfInvalidUserErrorMessage].	
	self
	should: [aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface canNotListPurchasesOfInvalidUserErrorMessage.].! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 16:02:08'!
test15CanNotAddItemsToAnExpiredCart
	|aCartID aSalesInputRestInterface anItem|

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	self makeThirtyMinutesTimePassFor: aCartID.
	
	self
	should: [aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface cannotPerformActionsOnAnExpiredCartErrorMessage.
			self assert: (aSalesInputRestInterface listCart: aCartID) isEmpty].
	
! !

!ClientRestInterfaceTest methodsFor: 'tests' stamp: 'CL 11/14/2019 16:09:51'!
test16CanNotCheckoutAnExpiredCart
	|aCartID aSalesInputRestInterface anItem aCreditCardExpirationDate aCreditCardNumber aCreditCardOwnerName |

	aSalesInputRestInterface := self newClientRestInterface.
	aCartID := aSalesInputRestInterface createCartWithClientID: testObjectsFactory defaultClientID andPassword: testObjectsFactory defaultClientPassword.
	anItem := testObjectsFactory itemSellByTheStore.
	aSalesInputRestInterface addToCart: aCartID thisAmount: 2 ofThisItem: anItem.
	aCreditCardNumber := testObjectsFactory validCreditCardNumber.
	aCreditCardExpirationDate := testObjectsFactory validCreditCardExpirationDate.
	aCreditCardOwnerName := testObjectsFactory validCreditCardOwnerName.
	self makeThirtyMinutesTimePassFor: aCartID.
	
	self
	should: [ aSalesInputRestInterface checkoutCart: aCartID withCCN: aCreditCardNumber withCCED:aCreditCardExpirationDate withCCO: aCreditCardOwnerName.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = ClientRestInterface cannotPerformActionsOnAnExpiredCartErrorMessage.
			self assert:(aSalesInputRestInterface listPurchasesOf: testObjectsFactory defaultClientID withPassword: testObjectsFactory defaultClientPassword ) equals: '0'].
	
! !


!ClientRestInterfaceTest methodsFor: 'clientRestInterface' stamp: 'CL 11/14/2019 17:33:22'!
newClientRestInterface
	
	^ClientRestInterface acceptingItemsOf: testObjectsFactory defaultCatalog andCheckingUsersWith: self andWithClock: self ! !


!ClientRestInterfaceTest methodsFor: 'userCheckerSimulator' stamp: 'CL 11/11/2019 17:37:30'!
isUserValid: aClientID withPassword: aPassword 
	^userCheckerSimulatorClosure value.! !


!classDefinition: #Clock category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
TestCase subclass: #Clock
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'as yet unclassified' stamp: 'CL 11/14/2019 17:45:32'!
adjustTime: aDuration! !

!Clock methodsFor: 'as yet unclassified' stamp: 'CL 11/14/2019 17:45:09'!
now! !


!classDefinition: #Cart category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'CL 11/11/2019 18:24:26'!
visitItemsFrom: aVisitor with: aClosure

	items do:aClosure! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'CL 11/14/2019 12:50:15'!
total
	(items isEmpty) ifTrue:[^0].
	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #ClientRestInterface category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #ClientRestInterface
	instanceVariableNames: 'catalog clientsCarts inputRestInterfaceTest userChecker newCartID merchantProcessor salesBook clients clock cartActionsTimeInterval'
	classVariableNames: 'ClientsCart'
	poolDictionaries: ''
	category: 'TusLibros'!

!ClientRestInterface methodsFor: 'client actions' stamp: 'CL 11/14/2019 17:39:54'!
addToCart: aCartID thisAmount: anAmountOfItems ofThisItem: anItem

	((clientsCarts at: aCartID ifAbsent:[self error: self class canNotAddToInvalidCartErrorMessage]) at: 2) ifTrue:[self error: self class canNotAddItemsToACheckedoutCartErrorMessage].
	self assertHasCartTimedout: aCartID.
	((clientsCarts at: aCartID) at: 1) add: anAmountOfItems of: anItem.
	self updateCartLastActionTime: aCartID.! !

!ClientRestInterface methodsFor: 'client actions' stamp: 'CL 11/14/2019 17:41:54'!
checkoutCart: aCartID withCCN: aCreditCardNumber withCCED: aCreditCardExpirationDate withCCO: aCreditCardOwner
	| aCreditCard |
	
	((clientsCarts at: aCartID ifAbsent:[self error: self class canNotCheckoutInvalidCartErrorMessage]) at:2) ifTrue:[self error: self class canNotCheckoutACheckedoutCartErrorMessage].
	self assertHasCartTimedout: aCartID.
	aCreditCard := CreditCard withCCN: aCreditCardNumber withCCED: aCreditCardExpirationDate withCCO: aCreditCardOwner.
	Cashier toCheckout: (clientsCarts at: aCartID) charging: aCreditCard throught: merchantProcessor on: DateAndTime now registeringOn: salesBook.
	(clientsCarts at: aCartID) at:2 put: true.! !

!ClientRestInterface methodsFor: 'client actions' stamp: 'CL 11/14/2019 17:42:04'!
createCartWithClientID: aClientID andPassword: aPassword

	| collectionOfCartIDs tupleCartAndCheckoutBool |
	userChecker isUserValid: aClientID withPassword: aPassword.
	newCartID := newCartID+1.
	tupleCartAndCheckoutBool := OrderedCollection with: (Cart acceptingItemsOf: catalog) with: false.
	clientsCarts add: newCartID-> tupleCartAndCheckoutBool.
	collectionOfCartIDs := (clients at: aClientID ifAbsent:[OrderedCollection new]).
	collectionOfCartIDs addLast: newCartID.
	clients add: aClientID->collectionOfCartIDs.
	self updateCartLastActionTime: newCartID.
	^newCartID! !

!ClientRestInterface methodsFor: 'client actions' stamp: 'CL 11/14/2019 14:08:29'!
listCart: aCartID 
	|clientsList|
	clientsList := Bag new.
	((clientsCarts at: aCartID ifAbsent:[self error: self class canNotListInvalidCartErrorMessage]) at: 1) visitItemsFrom: self with: [:item | clientsList add: item].
	^clientsList! !

!ClientRestInterface methodsFor: 'client actions' stamp: 'CL 11/14/2019 14:52:24'!
listPurchasesOf: aClientID withPassword: aClientPassword

	| cartsList clientCarts totalItems totalPrice |
	userChecker isUserValid: aClientID withPassword: aClientPassword.
	clientCarts := clients at: aClientID ifAbsent: [^'0'].
	totalItems := Bag new.
	totalPrice:= 0.
	clientCarts do: 
	[:clientCart | ((clientsCarts at: clientCart) at:2) ifTrue: [totalItems addAll: (self listCart: clientCart). 
		totalPrice := totalPrice + ((clientsCarts at: clientCart) at:1) total.].].
	cartsList := totalItems sortedElements inject:'' into:[:aCartList :anItemAndAmount | aCartList , anItemAndAmount key asString , '|' , anItemAndAmount value asString , '|'].
	^cartsList , totalPrice asString! !


!ClientRestInterface methodsFor: 'initialization' stamp: 'CL 11/14/2019 17:34:41'!
initializeAcceptingItemsOf: aCatalog andCheckingUsersWith: aUserChecker andWithClock: aClock
	
	catalog := aCatalog.
	userChecker := aUserChecker.
	clock := aClock.
	newCartID := 0.
	clientsCarts := Dictionary new.
	clients := Dictionary new.! !


!ClientRestInterface methodsFor: 'private' stamp: 'CL 11/14/2019 17:39:00'!
assertHasCartTimedout: aCartID

	((clock now - (cartActionsTimeInterval at: aCartID)) > 30) ifTrue:[self error: self class cannotPerformActionsOnAnExpiredCartErrorMessage ]! !

!ClientRestInterface methodsFor: 'private' stamp: 'CL 11/14/2019 17:40:33'!
updateCartLastActionTime: aCartID

	cartActionsTimeInterval at: aCartID put: clock now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ClientRestInterface class' category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
ClientRestInterface class
	instanceVariableNames: ''!

!ClientRestInterface class methodsFor: 'instance creation' stamp: 'CL 11/14/2019 17:34:29'!
acceptingItemsOf: aCatalog andCheckingUsersWith: aUserChecker andWithClock: aClock
	
	^self new initializeAcceptingItemsOf: aCatalog andCheckingUsersWith: aUserChecker andWithClock: aClock! !


!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 14:47:13'!
canNotAddItemsToACheckedoutCartErrorMessage
	^'No se pueden agregar items a carrito ya cobrado'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 12:37:22'!
canNotAddToInvalidCartErrorMessage
	^'No se pueden agregar productos en un carrito invalido'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 14:28:11'!
canNotCheckoutACheckedoutCartErrorMessage
	^'No se puede realizar un checkout de un carrito mas de una vez'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 14:18:30'!
canNotCheckoutInvalidCartErrorMessage
	^'No se puede hacer checkout de un carrito invalido'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/7/2019 20:48:50'!
canNotCreateCartWithInvalidUserErrorMessage
	^'No se puede crear un carrito; usuario invalido'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 13:04:57'!
canNotListInvalidCartErrorMessage
	^'No se puede listar un carrito invalido'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 14:45:50'!
canNotListPurchasesOfInvalidUserErrorMessage
	^'No se pueden listar las compras de un usuario invalido'! !

!ClientRestInterface class methodsFor: 'error messages' stamp: 'CL 11/14/2019 16:03:39'!
cannotPerformActionsOnAnExpiredCartErrorMessage
	^'No se pueden realizar operaciones sobre un carrito expirado'! !


!classDefinition: #CreditCard category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardExpirationDate creditcardNumber creditCardOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'CL 11/11/2019 20:37:41'!
isExpiredOn: aDate 
	
	^creditCardExpirationDate start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'private' stamp: 'CL 11/11/2019 20:46:20'!
toGregorianMonthOfYear: aCreditCardExpirationDate
	| aCreditCardExpirationMonth aCreditCardExpirationYear |
	aCreditCardExpirationMonth _ (aCreditCardExpirationDate copyFrom: 1 to: 2) asNumber.
	aCreditCardExpirationYear _ (aCreditCardExpirationDate copyFrom: 3 to: 6) asNumber.
	^Month month: aCreditCardExpirationMonth year: aCreditCardExpirationYear.! !


!CreditCard methodsFor: 'initialization' stamp: 'CL 11/11/2019 20:37:41'!
initializeExpiringOn: aMonth 
	
	creditCardExpirationDate := aMonth ! !

!CreditCard methodsFor: 'initialization' stamp: 'CL 11/11/2019 20:41:03'!
initializeWithCCN: aCreditcardNumber withCCED: aCreditCardExpirationDate withCCO: aCreditCardOwner 
	
	creditcardNumber := aCreditcardNumber.
	creditCardExpirationDate := self toGregorianMonthOfYear: aCreditCardExpirationDate.
	creditCardOwner := aCreditCardOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !

!CreditCard class methodsFor: 'instance creation' stamp: 'CL 11/11/2019 20:40:11'!
withCCN: aCreditcardNumber withCCED: aCreditCardExpirationDate withCCO: aCreditCardOwner 
	
	^self new initializeWithCCN: aCreditcardNumber withCCED: aCreditCardExpirationDate withCCO: aCreditCardOwner! !


!classDefinition: #Sale category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros stamp: 'CL 11/14/2019 21:45:58'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CL 11/11/2019 19:34:02'!
defaultClientID

		^'1'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CL 11/11/2019 19:34:43'!
defaultClientPassword

		^'1234'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CL 11/11/2019 19:48:44'!
validCreditCardExpirationDate
	|aValidExpirationDate|
	aValidExpirationDate := (Month month: today monthIndex year: today yearNumber + 1).
	^aValidExpirationDate monthIndex asString , aValidExpirationDate yearNumber asString! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CL 11/11/2019 19:40:46'!
validCreditCardNumber

	^'1'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CL 11/11/2019 19:42:29'!
validCreditCardOwnerName

	^'validCCOwner'! !
