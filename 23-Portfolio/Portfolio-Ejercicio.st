!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:53:57'!
test01aPortfolioHasZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance .
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/17/2019 19:19:49'!
test02DepositInSingleAccountIncreasesBalanceOnTransactionValue 

	| account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	portfolio addAccount: account.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/17/2019 20:07:46'!
test03DepositInMultipleAccountsIncreasesBalanceOnTransactionValue

	| firstAccount secondAccount portfolio |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount  new.
	portfolio addAccount: firstAccount.
	Deposit register: 100 on: firstAccount.
	
	secondAccount := ReceptiveAccount  new.
	portfolio addAccount: secondAccount.
	Deposit register: 50 on: secondAccount.
		
	self assert: 150 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:54:07'!
test04aPortfolioKnowsRegisteredTransactions 

	| firstAccount secondAccount deposit withdraw portfolio |
	
	portfolio := Portfolio new.
	
	firstAccount := ReceptiveAccount new.
	portfolio addAccount: firstAccount.
	deposit := Deposit register: 100 on: firstAccount.
	
	secondAccount := ReceptiveAccount new.
	portfolio addAccount: secondAccount.
	withdraw := Withdraw register: 50 on: secondAccount.
		
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:54:16'!
test05aPortfolioDoesNotKnowNonRegisteredTransactions 

	| firstAccount deposit withdraw portfolio |
	
	portfolio := Portfolio new.
	
	firstAccount := ReceptiveAccount new.
	portfolio addAccount: firstAccount.
	deposit := Deposit for: 100.
	withdraw := Withdraw for: 50.
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:54:22'!
test06aPortfolioKnowsItsTransactions 

	| firstAccount deposit portfolio |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	portfolio addAccount: firstAccount.
	deposit := Deposit register: 100 on: firstAccount.
	
	self assert: 1 equals: portfolio transactions size .
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:05:43'!
test07aPortfolioCanHaveAChildPortfolio

	| childPortfolio portfolio |
	
	portfolio := Portfolio new.
	childPortfolio := ReceptiveAccount  new.
	portfolio addAccount: childPortfolio.
	

	self assert: portfolio amountOfDirectProtoAccounts equals:1. ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:08:11'!
test08aPortfolioCanNotHaveASingleProtoAccountMultipleTimes

	| account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	portfolio addAccount: account.
	
	self should: [portfolio addAccount: account.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio aPortfolioCanNotHaveASingleAccountMultipleTimes.
			self assert: portfolio amountOfDirectProtoAccounts equals: 1]! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:08:23'!
test09aPortfolioChildCanNotHaveSameAccountAsParentPortfolio

	| account portfolioParent portfolioChild |
	
	portfolioParent := Portfolio new.
	portfolioChild := Portfolio new.
	account := ReceptiveAccount  new.
	portfolioParent addAccount: account.
	portfolioParent addAccount: portfolioChild.
	
	self should: [portfolioChild addAccount: account.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio aPortfolioChildCanNotHaveSameAccountAsParentPortfolio.
			self assert: portfolioParent amountOfDirectProtoAccounts equals: 2]! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:11:46'!
test10aPortfolioParentCanNotHaveSameAccountAsChildPortfolio

	| account portfolioParent portfolioChild |
	
	portfolioParent := Portfolio new.
	portfolioChild := Portfolio new.
	account := ReceptiveAccount  new.
	portfolioParent addAccount: portfolioChild.
	portfolioChild addAccount: account.
	
	self should: [portfolioParent addAccount: account.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio aPortfolioCanNotHaveASingleAccountMultipleTimes.
			self assert: portfolioParent amountOfDirectProtoAccounts equals: 1]! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:13:59'!
test11aPortfolioCanNotHaveItselfAsAChild

	| portfolio |
	
	portfolio := Portfolio new.
	
	self should: [portfolio addAccount: portfolio.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio aPortfolioCanNotHaveItselfAsAChild.
			self assert: portfolio amountOfDirectProtoAccounts equals: 0]! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:21:41'!
test12aPortfolioChildCanNotAddAPortfolioWithSameAccountAsParentPortfolio

	| account portfolioParent portfolio portfolioChild |
	
	portfolioParent := Portfolio new.
	portfolioChild := Portfolio new.
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	portfolioParent addAccount: account.
	portfolioParent addAccount: portfolio.
	portfolioChild addAccount: account.
	
	self should: [portfolio addAccount: portfolioChild.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio aPortfolioChildCanNotAddAPortfolioWithSameAccountAsParentPortfolio.
			self assert: portfolio amountOfDirectProtoAccounts equals: 0]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'cl 10/17/2019 19:03:47'!
addToBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'cl 10/17/2019 19:03:04'!
addToBalance: aBalance

	^aBalance+value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'cl 10/17/2019 18:46:26'!
initializeFor: aValue

	value := aValue! !


!Withdraw methodsFor: 'value' stamp: 'cl 10/17/2019 19:03:22'!
addToBalance: aBalance

	^aBalance-value! !

!Withdraw methodsFor: 'value' stamp: 'cl 10/17/2019 18:47:21'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ProtoAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ProtoAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ProtoAccount methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:34:53'!
balance
	self subclassResponsibility ! !

!ProtoAccount methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:33:25'!
hasRegistered: anAccountTransaction
	self subclassResponsibility ! !

!ProtoAccount methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:34:32'!
manages: aReceptiveAccount
	self subclassResponsibility ! !

!ProtoAccount methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 11:35:02'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
ProtoAccount subclass: #Portfolio
	instanceVariableNames: 'parentPortfolios ManagedProtoAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'cl 10/21/2019 12:43:45'!
balance
	^ManagedProtoAccounts sum:[:anAccount | anAccount balance] ifEmpty:[0]! !


!Portfolio methodsFor: 'manage accounts' stamp: 'cl 10/21/2019 13:17:06'!
addAccount: aProtoAccount

	(self manages: aProtoAccount)  
						ifTrue:[self error: self class aPortfolioCanNotHaveASingleAccountMultipleTimes].
	(self = aProtoAccount)
						ifTrue:[self error: self class aPortfolioCanNotHaveItselfAsAChild].
	
	(parentPortfolios anySatisfy: [:protoAccount | protoAccount manages: aProtoAccount] )
						ifTrue:[self error: self class aPortfolioChildCanNotHaveSameAccountAsParentPortfolio].

	ManagedProtoAccounts addLast: aProtoAccount.
	aProtoAccount newParent: self.! !

!Portfolio methodsFor: 'manage accounts' stamp: 'cl 10/21/2019 13:32:00'!
manages: aProtoAccount

	^ManagedProtoAccounts anySatisfy:[:account | account manages: aProtoAccount]! !

!Portfolio methodsFor: 'manage accounts' stamp: 'cl 10/21/2019 12:55:28'!
newParent: aPortfolio

	parentPortfolios addLast: aPortfolio! !


!Portfolio methodsFor: 'initialization' stamp: 'cl 10/21/2019 12:43:45'!
initialize

	ManagedProtoAccounts := OrderedCollection new.
	parentPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:05:43'!
amountOfDirectProtoAccounts

	^ManagedProtoAccounts size! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 12:44:36'!
hasRegistered: aTransaction

	^ManagedProtoAccounts anySatisfy: [:account | account hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 12:43:45'!
transactions
	|portfolioTransactions|
	
	portfolioTransactions := OrderedCollection new.
	ManagedProtoAccounts do:[:account | portfolioTransactions  addAll: account transactions ].
	^portfolioTransactions ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:08:11'!
aPortfolioCanNotHaveASingleAccountMultipleTimes

	^'No se puede agregar una cuenta ya registrada en el portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:14:44'!
aPortfolioCanNotHaveItselfAsAChild

	^'Un portfolio no puede manejarse a si mismo'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:22:48'!
aPortfolioChildCanNotAddAPortfolioWithSameAccountAsParentPortfolio

	^'No se puede agregar un portfolio con una cuenta manejada por un portfolio padre'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:08:23'!
aPortfolioChildCanNotHaveSameAccountAsParentPortfolio

	^'No se puede agregar una cuenta registrada en el portfolio padre a un portfolio hijo'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cl 10/21/2019 13:09:03'!
aPortfolioParentCanNotHaveSameAccountAsChildPortfolio

	^'No se puede agregar una cuenta registrada en un portfolio hijo al portfolio padre'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
ProtoAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'cl 10/21/2019 12:41:04'!
manages:  aProtoAccount

	^ aProtoAccount = self! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'cl 10/21/2019 12:56:47'!
newParent: aPortfolio! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'cl 10/17/2019 20:18:30'!
balance
	
	^transactions inject: 0 into: [:balanceValue :aTransaction | aTransaction addToBalance: balanceValue ].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
